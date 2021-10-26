package com.zhidisoft.ser3;

import com.zhidisoft.LoginMysql.Body;
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
import java.util.HashMap;
import java.util.Map;

@WebServlet(urlPatterns = "/updatePassword.do")
public class UpdatePassword extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Body by=new Body();
        User user = (User) req.getSession().getAttribute("user");
        Integer id = user.getId();
        String newPassword = req.getParameter("newPassword");
      String  password= EncryptUtil.encryptMD5(newPassword);
        boolean b = by.updatePassword(password, id);
        Map<String, Object> m = new HashMap<>();
        PrintWriter out = resp.getWriter();
        if (b) {
            m.put("success", true);
            m.put("msg", "修改成功");
        } else {
            m.put("success", false);
            m.put("msg", "修改失败");
        }
        out.write(JSONObject.fromObject(m).toString());
        out.flush();
        out.close();
        req.getRequestDispatcher("/manage/jsp/searchTask.jsp").forward(req, resp);
    }
}
