package com.zhidisoft.ser2;

import com.zhidisoft.LoginMysql.Body;
import com.zhidisoft.LoginMysql.Enter;
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

@WebServlet(urlPatterns = "/listTaxerServlet.do")
public class ListTaxerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        Enter en=new Enter();
        Body by=new Body();
        int page = Integer.parseInt(req.getParameter("page"));
        int rows = Integer.parseInt(req.getParameter("rows"));
//        String payerCode = req.getParameter("taxerCode");
        String taxerName = req.getParameter("taxerName");
        List<Map<String, String>> list =null;
        List<Taxer> list1=null;
        try {
            list =by.selectTaxerlimit(page,rows,taxerName);
            list1 = en.selectalltaxer();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map<String,Object> m=new HashMap<>();
        m.put("total",list1.size());
        m.put("rows",list);
//        m.put("payerCode",payerCode);
        m.put("taxerName",taxerName);
        PrintWriter out = resp.getWriter();
        out.write(JSONObject.fromObject(m).toString());
        out.flush();
        out.close();
    }
}
