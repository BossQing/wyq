package com.zhidisoft.filter;

import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/uploadImg.do")
@MultipartConfig(location="D://basketball")
public class UploadImg extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Part file = req.getPart("file");
        String filename = file.getSubmittedFileName();
        file.write(filename);
        PrintWriter out = resp.getWriter();
        JSONObject json = new JSONObject();
        json.put("success", true);
        json.put("url", filename);
        out.flush();
        out.close();
    }
}