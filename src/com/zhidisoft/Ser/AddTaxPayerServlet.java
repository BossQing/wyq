package com.zhidisoft.Ser;

import com.zhidisoft.LoginMysql.Enter;
import com.zhidisoft.entity.Industry;
import com.zhidisoft.entity.TaxOrgan;
import com.zhidisoft.entity.TaxPayer;
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

@WebServlet(urlPatterns = "/toAddTaxPayerServlet.do")
public class AddTaxPayerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Enter en = new Enter();
        try {
            List<TaxOrgan> organs = en.selectallOrgan();
            List<Industry> industrys = en.selectallIndustry();
            List<Taxer> user = en.selectalltaxer();
            req.setAttribute("user", user);
            req.setAttribute("industrys", industrys);
            req.setAttribute("organs", organs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        req.getRequestDispatcher("/manage/jsp/addTaxPayer.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json; charset=UTF-8");
        String  payerCode = req.getParameter("payerCode");
        String payerName = req.getParameter("payerName");
        String bizAddress = req.getParameter("bizAddress");
        String bizAddressPhone = req.getParameter("bizAddressPhone");
        int taxOrganId = Integer.parseInt(req.getParameter("taxOrganId"));
        int industryId = Integer.parseInt(req.getParameter("industryId"));
        String bizScope = req.getParameter("bizScope");
        String invoiceType = req.getParameter("invoiceType");
        String legalPerson = req.getParameter("legalPerson");
        String legalIdCard = req.getParameter("legalIdCard");
        String finaceName = req.getParameter("finaceName");
        String finaceIdCard = req.getParameter("finaceIdCard");
        String legalIdCardImageURL = req.getParameter("legalIdCardImageURL");
        String finaceIdCardImageURL = req.getParameter("finaceIdCardImageURL");
        String recordDate = req.getParameter("recordDate");
        TaxPayer tp=new TaxPayer(payerCode,payerName,bizAddress,taxOrganId,industryId,bizScope ,invoiceType,legalPerson,legalIdCard,legalIdCardImageURL ,finaceName ,finaceIdCard ,finaceIdCardImageURL,bizAddressPhone,recordDate);
        Enter en = new Enter();
        boolean b = en.inserttaxpayer(tp);
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
