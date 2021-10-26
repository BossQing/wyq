package com.zhidisoft.Ser;

import com.zhidisoft.LoginMysql.Body;
import com.zhidisoft.LoginMysql.Enter;
import com.zhidisoft.entity.Taxer;
import com.zhidisoft.entity.User;
import com.zhidisoft.util.EncryptUtil;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/loginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        Body by=new Body();
        Enter en=new Enter();
        JSONObject json = new JSONObject();
        PrintWriter out = resp.getWriter();
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String remUser = req.getParameter("remUser");
        req.getSession().setAttribute("username",username);
        password= EncryptUtil.encryptMD5(password);
        User user=null;
        Taxer taxer=null;
        try {
            user = en.selectByName(username);
             taxer = by.selectByTaxerId(user.getTaxerId());

            if (username.equals(user.getUsername()) && password.equals(user.getPassword())){
                json.put("success",true);
            }else {
                json.put("success",false);
                json.put("msg","登录失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (remUser!=null){
            req.getSession().setAttribute("user",user);
            req.getSession().setAttribute("taxer",taxer);
            req.getSession().setAttribute("username",username);

        }
        out.print(json);
        out.flush();
        out.close();
        req.getRequestDispatcher("/manage/jsp/index.jsp").forward(req,resp);
    }
}
