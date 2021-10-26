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

@WebServlet(urlPatterns = "/toEditTaskServlet.do")
public class EditTaskServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Enter en = new Enter();
        Body by = new Body();
        int id = Integer.parseInt(req.getParameter("id"));
        TaxPayer taxpayer = null;

        try {
            TaxSource source = by.selectBySourceId(id);
            taxpayer = by.selectByTaxpayerId(source.getPayerId());
            List<TaxOrgan> organs = en.selectallOrgan();
            List<Industry> industrys = en.selectallIndustry();
            Industry industry = en.selectByIndustryId(taxpayer.getIndustryId());
            TaxOrgan taxOrgan = en.selectByOrganId(taxpayer.getTaxOrganId());
            String username = (String) req.getSession().getAttribute("username");
            Taxer taxers = en.selectByTaxerrecordUserId(source.getApproverId());
            Taxer approverTaxer = en.selectByTaxerrecordUserId(source.getApproverId());
            Taxer executeTaxer = en.selectByTaxerrecordUserId(source.getExecuteId());
            List<Taxer> taxerList = en.selectalltaxer();
            req.setAttribute("taxers", taxerList);
            System.out.println(taxers);
            req.setAttribute("task", source);
//            req.setAttribute("taxers", taxers);
            req.setAttribute("industrys", industrys);
            req.setAttribute("username", username);
            req.setAttribute("organs", organs);
            req.setAttribute("subOrgan", taxOrgan);
            req.setAttribute("approverTaxer", approverTaxer);
            req.setAttribute("executeTaxer", executeTaxer);
            req.setAttribute("payer", taxpayer);
            Taxer user = en.selectByTaxerrecordUserId(taxOrgan.getRecordUserId());
            req.setAttribute("organ", taxOrgan);
            req.setAttribute("user", user);
            req.setAttribute("industry", industry);
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("/manage/jsp/editTask.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        Enter en = new Enter();
        Body by = new Body();

        int id = Integer.parseInt(req.getParameter("id"));
        String taskName = req.getParameter("taskName");
        int subOrganId = Integer.parseInt(req.getParameter("subOrganId"));
        int approverId = Integer.parseInt(req.getParameter("approverId"));
        int executeId = Integer.parseInt(req.getParameter("executeId"));
        String executeTime = req.getParameter("executeTime");
        String taskState = req.getParameter("taskState");
        TaxSource taxSource = new TaxSource(id, taskName, subOrganId, approverId, executeId, executeTime, taskState);
        boolean b = by.updateSource(taxSource, id);
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
