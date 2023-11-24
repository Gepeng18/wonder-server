package com.gitee.whzzone.admin.common.security;

import com.gitee.whzzone.admin.system.entity.User;
import com.gitee.whzzone.admin.system.service.EmailService;
import com.gitee.whzzone.admin.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Component;

/**
 * @author : whz
 * @date : 2023/5/18 8:40
 */
@Component
public class EmailAuthenticationProvider implements AuthenticationProvider {

    @Autowired
    private UserService sysUserService;

    @Autowired
    private EmailService emailService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String email = authentication.getName();
        String code = (String) authentication.getCredentials();

        EmailAuthenticationToken authenticationToken = new EmailAuthenticationToken(email, code);

        User sysUser = sysUserService.getByEmail(email);

        sysUserService.beforeLoginCheck(sysUser);

        if (!emailService.verifyEmailCode(email, code)) {
            throw new BadCredentialsException("验证码错误");
        }

        authenticationToken.setDetails(sysUser);
        return authenticationToken;
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return EmailAuthenticationToken.class.isAssignableFrom(authentication);
    }
}