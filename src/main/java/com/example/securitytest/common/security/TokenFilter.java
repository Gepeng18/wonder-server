package com.example.securitytest.common.security;

import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONUtil;
import com.example.securitytest.common.Result;
import com.example.securitytest.pojo.entity.SysUser;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * @author : whz
 * @date : 2023/5/17 17:46
 */
@Component
@Slf4j
public class TokenFilter extends OncePerRequestFilter {

    @Value("${system-config.cache.token.prefix}")
    private String cacheTokenPrefix;

    @Autowired
    private RedisTemplate<String, Object> redisTemplate;

    @Value("${system-config.cache.token.live-time}")
    private long cacheTime;

    @Value("${system-config.cache.token.live-unit}")
    private TimeUnit cacheTimeUnit;

    @Value("${system-config.cache.token.refresh-time}")
    private long refreshTime;

    @Value("${system-config.cache.token.refresh-unit}")
    private TimeUnit refreshUnit;

    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String token = request.getHeader("token");

        if (StrUtil.isBlank(token)) {
            filterChain.doFilter(request, response);
            return;
        }

        String key = cacheTokenPrefix + token;

        Boolean hasKey = redisTemplate.hasKey(key);
        if (Boolean.FALSE.equals(hasKey)) {
            response.setHeader("content-type", "application/json");
            IoUtil.write(response.getOutputStream(), true, JSONUtil.toJsonStr(Result.error("错误的token")).getBytes());
            log.error("错误的token");
            return;
        }

        String jsonStr = (String) redisTemplate.opsForValue().get(key);

        SysUser sysUser = JSONUtil.toBean(jsonStr, SysUser.class);

        if (!sysUser.getEnabled()) {
            response.setHeader("content-type", "application/json");
            IoUtil.write(response.getOutputStream(), true, JSONUtil.toJsonStr(Result.error("该用户已被禁用")).getBytes());
            log.error("该用户已被禁用");
            return;
        }

        if(redisTemplate.boundValueOps(key).getExpire() < refreshUnit.toSeconds(refreshTime)){
            redisTemplate.boundValueOps(key).expire(cacheTime, cacheTimeUnit);
        }

        UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(sysUser, null, null);
        authenticationToken.setDetails(new WebAuthenticationDetails(request));
        SecurityContextHolder.getContext().setAuthentication(authenticationToken);

        filterChain.doFilter(request, response);
    }
}
