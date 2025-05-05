package site.hwali.meeting.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.mybatis.logging.Logger;
import org.mybatis.logging.LoggerFactory;
import org.springframework.util.AntPathMatcher;
import org.springframework.web.servlet.HandlerInterceptor;
import site.hwali.meeting.model.Employee;

import java.util.Arrays;
import java.util.Objects;

public class PermissInterceptor implements HandlerInterceptor {
    AntPathMatcher pathMatcher = new AntPathMatcher();
    private static final Logger logger = LoggerFactory.getLogger(PermissInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String requestURI = request.getRequestURI();
        System.out.println("requestURI = " + requestURI);
        // 匿名可访问路径
        String[] commonPaths = {"/","/doLogin","/register","/doReg"};
        if (Arrays.stream(commonPaths).filter(path->path.equals(requestURI)).count()>0){
                return true;
        }
        HttpSession session = request.getSession(true);
        Employee currentuser = (Employee) session.getAttribute("currentuser");
        if (pathMatcher.match("/admin/**", requestURI)) {
            if (!Objects.isNull(currentuser)){
                if (currentuser.getRole() == 2) {
                    return true;
                } else {
                    response.getWriter().write("forbidden");
                    return false;
                }
            }
        }else{
            if (currentuser != null) {
                return true;
            }
        }
        response.sendRedirect("/");
        return false;

    }
}
