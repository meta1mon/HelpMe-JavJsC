package common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// request 파라미터를 이용해서 필터작업 수행
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8"); //  response를 이용 응답의 필터링 작업 수행
		
		chain.doFilter(request, response); // chain의 다음 필터 처리 -> 현재까지의 내용을 적용하고 연결된 페이지로 이동하도록 만들어줌
	}

	@Override
	public void destroy() {
	}
	

}
