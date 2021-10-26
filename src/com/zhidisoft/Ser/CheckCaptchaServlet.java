package com.zhidisoft.Ser;

import com.google.code.kaptcha.Constants;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/checkCaptchaServlet")
public class CheckCaptchaServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        PrintWriter out = resp.getWriter();
        JSONObject json = new JSONObject();
        String captcha = req.getParameter("captcha");
        String s = req.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY).toString();
        if (captcha.equals(s)){
            json.put("success", true);
            json.put("msg", "正确");
        }else {
            json.put("success", false);
            json.put("msg", "错误");
        }
        out.print(json);
        out.flush();
        out.close();
    }
}
