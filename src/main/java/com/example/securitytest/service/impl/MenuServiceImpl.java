package com.example.securitytest.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.securitytest.mapper.MenuMapper;
import com.example.securitytest.pojo.dto.MenuTreeDto;
import com.example.securitytest.pojo.dto.MenuDto;
import com.example.securitytest.pojo.entity.Menu;
import com.example.securitytest.pojo.query.MenuQuery;
import com.example.securitytest.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

/**
 * @author : whz
 * @date : 2023/5/22 20:17
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {

    @Autowired
    private MenuMapper menuMapper;

    @Override
    public List<String> findPermitByUserId(Long userId) {
        return menuMapper.findPermitByUserId(userId);
    }

    @Override
    public List<MenuTreeDto> treeList(MenuQuery query) {
        List<Menu> menuList = findAll();

        List<MenuTreeDto> menuTreeVos = BeanUtil.copyToList(menuList, MenuTreeDto.class);

        //获取父节点
        return menuTreeVos.stream().filter(m -> m.getParentId() == 0).map(
                (m) -> {
                    m.setChildren(getChildrenList(m, menuTreeVos));
                    return m;
                }
        ).collect(Collectors.toList());
    }

    public static List<MenuTreeDto> getChildrenList(MenuTreeDto tree, List<MenuTreeDto> list){
        List<MenuTreeDto> children = list.stream().filter(item -> Objects.equals(item.getParentId(), tree.getId())).map(
                (item) -> {
                    item.setChildren(getChildrenList(item, list));
                    return item;
                }
        ).collect(Collectors.toList());
        return children;
    }

    @Override
    public List<MenuTreeDto> list(MenuQuery query) {
        if (query.getParentId() == null)
            query.setParentId(0L);

        LambdaQueryWrapper<Menu> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Menu::getParentId, query.getParentId());
        queryWrapper.orderByAsc(Menu::getSort);
        List<Menu> menuList = menuMapper.selectList(queryWrapper);

        List<MenuTreeDto> menuTreeVos = BeanUtil.copyToList(menuList, MenuTreeDto.class);

        for (MenuTreeDto menuTreeVo : menuTreeVos) {
            Long count = menuMapper.selectCount(new LambdaQueryWrapper<Menu>().eq(Menu::getParentId, menuTreeVo.getId()));
            menuTreeVo.setHasChildren(count > 0);
        }

        return menuTreeVos;
    }

    @Override
    public List<Menu> findAll() {
        LambdaQueryWrapper<Menu> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Menu::getEnabled, true);
        queryWrapper.orderByAsc(Menu::getSort);
        return menuMapper.selectList(queryWrapper);
    }

    @Override
    public List<MenuDto> findByUserId(Long userId) {
        List<Menu> byUserId = menuMapper.findByUserId(userId);
        List<MenuDto> sysMenuDtos = BeanUtil.copyToList(byUserId, MenuDto.class );
        return sysMenuDtos;
    }

    @Override
    public MenuDto afterQueryHandler(MenuDto menuDto) {
        Menu parent = getById(menuDto.getParentId());
        if (parent != null){
            menuDto.setParentName(parent.getName());
        }
        return menuDto;
    }

}