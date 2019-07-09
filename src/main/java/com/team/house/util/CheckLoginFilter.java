package com.team.house.util;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
   //登录操作验证
public class CheckLoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {

        HttpServletRequest request=(HttpServletRequest)req;
        HttpServletResponse response=(HttpServletResponse)resp;

        String requestURI = request.getRequestURI();//获取请求路径  /page/login.jsp

        String path = requestURI.substring(requestURI.lastIndexOf("/") + 1);//获取请求的页面名称  login.jsp
          if (path.equals("login.jsp")||path.equals("regs.jsp")||path.equals("checklogin")||path.equals("checkUser")||path.equals("getCored")){
              chain.doFilter(req, resp);//放行
          }else {
              //判断你有没有登入
              HttpSession session=request.getSession();
              Object o=session.getAttribute("logininfo");
              if(o==null){ //判断你有没有登入
                  response.sendRedirect("login.jsp");
              }else{
                  chain.doFilter(req, resp);
              }
          }

    }

    public void init(FilterConfig config) throws ServletException {

    }

}
