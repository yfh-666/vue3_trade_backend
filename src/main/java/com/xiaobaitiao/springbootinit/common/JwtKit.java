package com.xiaobaitiao.springbootinit.common;


import com.xiaobaitiao.springbootinit.model.entity.User;
import com.xiaobaitiao.springbootinit.model.vo.LoginUserVO;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * JWT工具类
 *
 * @author xiaobaitiao
 *
 *
 */
@Component
public class JwtKit {
    @Resource
    private JwtProperties jwtProperties;

    /**
     * 生成Token
     *
     * @param  user 自定义要存储的用户对象信息
     * @return string(Token)
     */
    public <T> String generateToken(T user) {
        Map<String, Object> claims = new HashMap<>(10);

        if (user instanceof User) {
            claims.put("id", ((User) user).getId());
            claims.put("username", ((User) user).getUserName());
        } else if (user instanceof LoginUserVO) {
            claims.put("id", ((LoginUserVO) user).getId());  // ✅ 多加这一层也行
            claims.put("username", ((LoginUserVO) user).getUserName());
        } else {
            claims.put("id", user.toString()); // ❌ 这行用于调试，正常不推荐 fallback 成字符串
        }

        claims.put("createdate", new Date());

        return Jwts.builder()
                .addClaims(claims)
                .setExpiration(new Date(System.currentTimeMillis() + jwtProperties.getExpiration()))
                .signWith(SignatureAlgorithm.HS256, jwtProperties.getSecret())
                .compact();
    }


    public JwtKit() {
    }

    public JwtKit(JwtProperties jwtProperties) {
        this.jwtProperties = jwtProperties;
    }

    /**
     * 校验Token是否合法
     *
     * @param token 要校验的Token
     * @return Claims (过期时间，用户信息，创建时间)
     */
    public  Claims parseJwtToken(String token) {
        Claims claims = null;
        // 根据哪个密钥解密
        claims = Jwts.parser().setSigningKey(jwtProperties.getSecret())
                // 设置要解析的Token
                .parseClaimsJws(token)
                .getBody();
        return claims;
    }
}
