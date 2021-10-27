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

@WebServlet(urlPatterns = "/toAddTaskServlet.do")
public class ToAddTaskServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String payerCode = req.getParameter("payerCode");
        Enter en=new Enter();
        Body by=new Body();
        try {
            TaxPayer payer = by.selectByTaxpayerPayerCode(payerCode);
            req.setAttribute("payer",payer);
            TaxOrgan organ = en.selectByOrganId(payer.getTaxOrganId());
            Industry industry = en.selectByIndustryId(payer.getIndustryId());
            req.setAttribute("industry", industry);
            req.setAttribute("organ", organ);
            List<Taxer> taxers = en.selectalltaxer();
            List<TaxOrgan> organs = en.selectallOrgan();
            req.setAttribute("organs",organs);
            req.setAttribute("taxers",taxers);
            User user = en.selectByUserId(payer.getUserId());
            req.setAttribute("user", user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("/manage/jsp/addTask.jsp").forward(req,resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        Enter en=new Enter();
        int  payerId = Integer.parseInt(req.getParameter("payerId"));
        String taskName = req.getParameter("taskName");
        int  subOrganId = Integer.parseInt(req.getParameter("subOrganId"));
        int approverId = Integer.parseInt(req.getParameter("approverId"));
        int  executeId = Integer.parseInt(req.getParameter("executeId"));
        String executeTime = req.getParameter("executeTime");
        String taskState = req.getParameter("taskState");
        TaxSource ts=new TaxSource(payerId,taskName,subOrganId,approverId,executeId,executeTime,taskState);

        boolean b = en.inserttaxsource(ts);
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
        req.getRequestDispatcher("/searchTaskServlet.do").forward(req,resp);

    }
}
