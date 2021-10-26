package com.zhidisoft.Ser1;

import com.zhidisoft.LoginMysql.Body;
import com.zhidisoft.LoginMysql.Enter;
import com.zhidisoft.entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/getTaskInfoServlet.do")
public class GetTaskInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Enter en = new Enter();
        Body by = new Body();
        int id = Integer.parseInt(req.getParameter("id"));
        try {
            TaxSource source = by.selectBySourceId(id);
            TaxPayer payer = by.selectByTaxpayerId(source.getPayerId());
            TaxOrgan organ = en.selectByOrganId(payer.getTaxOrganId());
            Industry industry = en.selectByIndustryId(payer.getIndustryId());
            String username = (String) req.getSession().getAttribute("username");
            Taxer approverTaxer = en.selectByTaxerrecordUserId(source.getApproverId());
            Taxer executeTaxer = en.selectByTaxerrecordUserId(source.getExecuteId());
            req.setAttribute("payer", payer);
            req.setAttribute("industry", industry);
            req.setAttribute("organ", organ);
            req.setAttribute("subOrgan", organ);
            req.setAttribute("username", username);
            req.setAttribute("task", source);
            req.setAttribute("approverTaxer", approverTaxer);
            req.setAttribute("executeTaxer", executeTaxer);
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("/manage/jsp/taskInfo.jsp").forward(req, resp);
    }
}

