package com.zhidisoft.Ser1;

import com.zhidisoft.LoginMysql.Body;
import com.zhidisoft.LoginMysql.Enter;
import com.zhidisoft.entity.*;
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

@WebServlet(urlPatterns = "/searchTaskServlet.do")
public class SearchTaskServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Enter en=new Enter();
        TaxPayer payer=null;
        try {
            List<TaxOrgan> organs = en.selectallOrgan();
            List<Industry> industrys = en.selectallIndustry();
            req.setAttribute("industrys", industrys);
            req.setAttribute("organs", organs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("/manage/jsp/searchTask.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        Body by=new Body();
        int page = Integer.parseInt(req.getParameter("page"));
        int rows = Integer.parseInt(req.getParameter("rows"));
//        String payerCode = req.getParameter("payerCode");
//        String payerName = req.getParameter("payerName");
        List<Map<String, String>> list =null;
        List< TaxSource > list1=null;
        try {
            list = by.selectTaskLike(page, rows);
            list1 = by.selectallSource();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Map<String,Object> m=new HashMap<>();
        m.put("total",list1.size());
        m.put("rows",list);
//        m.put("payerCode",payerCode);
//        m.put("payerName",payerName);
        PrintWriter out = resp.getWriter();
        out.write(JSONObject.fromObject(m).toString());
        out.flush();
        out.close();
        req.getRequestDispatcher("/manage/jsp/searchTask.jsp").forward(req,resp);
    }
}
