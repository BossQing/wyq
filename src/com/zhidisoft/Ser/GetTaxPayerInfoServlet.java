package com.zhidisoft.Ser;

import com.zhidisoft.LoginMysql.Enter;
import com.zhidisoft.entity.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/getTaxPayerInfoServlet.do")
public class GetTaxPayerInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Enter en=new Enter();
        int  id = Integer.parseInt(req.getParameter("id"));
        TaxPayer  payer=null;
        Taxer user=null;
        try {

            payer = en.selectByIDtaxpayer(id);
//            user = en.selectByUserId(payer.getUserId());
            TaxOrgan organ = en.selectByOrganId(payer.getTaxOrganId());
            Industry industry = en.selectByIndustryId(payer.getIndustryId());
            user = en.selectByTaxerrecordUserId(industry.getRecordUserId());
            TaxSource task = en.selectByPayerId(id);
            Taxer approverTaxer = en.selectByTaxerrecordUserId(task.getApproverId());
            Taxer executeTaxer = en.selectByTaxerrecordUserId(task.getExecuteId());
            req.setAttribute("industry", industry);
            req.setAttribute("organ", organ);
            req.setAttribute("subOrgan", organ);
//            req.setAttribute("user", user);
            req.setAttribute("task", task);
            req.setAttribute("approverTaxer", approverTaxer);
            req.setAttribute("executeTaxer", executeTaxer);
            req.setAttribute("user",user);
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.setAttribute("payer",payer);

        req.getRequestDispatcher("/manage/jsp/payerInfo.jsp").forward(req,resp);

    }
}

