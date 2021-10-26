package com.zhidisoft.ser2;

import com.zhidisoft.LoginMysql.Body;
import com.zhidisoft.LoginMysql.Enter;
import com.zhidisoft.entity.TaxOrgan;
import com.zhidisoft.entity.Taxer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/getTaxerInfoServlet.do")
public class GetTaxerInfoServlet extends HttpServlet {
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
            Taxer taxer = by.selectByTaxerId(id);
            TaxOrgan organ = en.selectByOrganId(taxer.getOrganId());
            req.setAttribute("taxer",taxer);
            req.setAttribute("organ",organ);
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("/manage/jsp/taxerInfo.jsp").forward(req, resp);
    }
}

