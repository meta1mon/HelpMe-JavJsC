package recruitcalendar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.vo.Member;
import recruitcalendar.Service.RecruitCalendarService;

/**
 * Servlet implementation class RecruitCalendarDeleteCtrl
 */
@WebServlet("/rcscheduledelete")
public class RecruitCalendarDeleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RecruitCalendarDeleteCtrl() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		execute(request, response);
	}

	protected void execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("서블릿 진입함");
		String dbScheName = request.getParameter("title");
		System.out.println("dbScheName : " + dbScheName);
		Member memVo = (Member) request.getSession().getAttribute("loginMember");

		String dbId = memVo.getId();

		// 관리자로 로그인 시에만 일정 삭제 가능
		if (memVo != null) {
			if (!memVo.getId().equals("semi01")) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('일정 삭제 권한이 없습니다.');</script>");
				response.sendRedirect("rccalendar");
			    //out.println("<script>location.href='rccalendar'</script>");
				
				System.out.println("권한 없음");
			} else {
				System.out.println(dbId);

				int result = 0;

				try {
					result = new RecruitCalendarService().deleteSchedule(dbScheName);
				} catch (SQLException e) {
					e.printStackTrace();
				}

				if (result > 0) {
					System.out.println("일정 db 삭제 성공");
				} else {
					System.out.println("일정 db 삭제 실패");

				}

			}

		}
	}
}
