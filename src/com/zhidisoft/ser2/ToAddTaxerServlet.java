package com.zhidisoft.ser2;

import com.zhidisoft.LoginMysql.Body;
import com.zhidisoft.LoginMysql.Enter;
import com.zhidisoft.entity.TaxOrgan;
import com.zhidisoft.entity.Taxer;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(urlPatterns = "/toAddTaxerServlet.do")
public class ToAddTaxerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Enter en=new Enter();
        try {
            List<TaxOrgan> organs = en.selectallOrgan();
            req.setAttribute("organs",organs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("/manage/jsp/addTaxer.jsp").forward(req,resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        Enter en=new Enter();
        Body by=new Body();
       String taxerCode = req.getParameter("taxerCode");
        String taxerName= req.getParameter("taxerName");
        String mobile = req.getParameter("mobile");
        String address = req.getParameter("address");
        String sex = req.getParameter("sex");
        String birthday = req.getParameter("birthday");
        String email = req.getParameter("email");
        int organId = Integer.parseInt(req.getParameter("organId"));
        Taxer tx=new Taxer(taxerCode,taxerName,mobile,address,sex,birthday,email,organId);
        boolean b = by.insertTaxer(tx);
        Map<String,Object> m=new HashMap<>();
        PrintWriter out = resp.getWriter();
        if (b){
            m.put("success",true);
            m.put("msg","添加成功");
        }else {
            m.put("success",false);
            m.put("msg","添加失败");
        }
        out.write(JSONObject.fromObject(m).toString());
        out.flush();
        out.close();
        req.getRequestDispatcher("/manage/jsp/listTaxer.jsp").forward(req,resp);

    }
}
