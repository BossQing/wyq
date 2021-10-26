package com.zhidisoft.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 请求字符编码过滤器
 * @author 卢健良
 *
 */
@WebFilter(urlPatterns = "/*")
public class EncodingFilter implements Filter {

//	private String encoding = "UTF-8";

	@Override
	public void destroy() {

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
						 FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpReq = (HttpServletRequest) request;
		HttpServletResponse httpResp = (HttpServletResponse) response;

		/*httpReq.setCharacterEncoding(encoding);
		httpResp.setCharacterEncoding(encoding);
		httpResp.setContentType("text/html; charset=" + encoding);*/
		httpReq.setCharacterEncoding("UTF-8");
		httpResp.setCharacterEncoding("UTF-8");
//		httpResp.setContentType("text/html; charset=UTF-8");
		chain.doFilter(httpReq, httpResp);

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
//		String encoding = filterConfig.getInitParameter("encoding");
//		if (encoding != null && !encoding.isEmpty()) {
//			this.encoding = encoding;
		}
	}


	

