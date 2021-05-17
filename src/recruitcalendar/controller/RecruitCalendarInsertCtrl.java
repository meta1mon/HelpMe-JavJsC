package recruitcalendar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import calendar.Service.CalendarService;
import calendar.VO.CalendarVO;
import member.vo.Member;
import recruitcalendar.Service.RecruitCalendarService;
import recruitcalendar.VO.RecruitCalendarVO;

/**
 * Servlet implementation class RecruitCalendarInsertCtrl
 */
@WebServlet("/rcscheduleinsert")
public class RecruitCalendarInsertCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RecruitCalendarInsertCtrl() {
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
		System.out.println("서블릿 들어 왔다");

		RecruitCalendarVO vo = new RecruitCalendarVO();
		Member memVo = (Member) request.getSession().getAttribute("loginMember");
		
		System.out.println(memVo.getId());

		// 관리자로 로그인 시에만 일정 등록 가능
		if (memVo != null) {
			if (!memVo.getId().equals("semi01")) {
				System.out.println(memVo.getId());
				PrintWriter out = response.getWriter();
				out.println("<script>alert('일정 삭제 권한이 없습니다.');</script>");
				response.sendRedirect("rccalendar");
				
				// out.println("<script>location.href='rccalendar'</script>");

				System.out.println("권한 없음");
			} else {
				System.out.println("등록 성공공공");

				String dbScheName = request.getParameter("scheName");
				System.out.println(dbScheName);

				String dbScheStart = request.getParameter("scheStart");
				System.out.println(dbScheStart);

				String dbScheEnd = request.getParameter("scheEnd");
				System.out.println(dbScheEnd);

				int dbScheCode = Integer.parseInt(request.getParameter("scheCode"));
				System.out.println(dbScheCode);

				String dbScheContent = request.getParameter("scheContent");
				System.out.println(dbScheContent);

				vo.setRcScheName(dbScheName);
				vo.setRcScheStart(dbScheStart);
				vo.setRcScheEnd(dbScheEnd);
				vo.setRcScheCode(dbScheCode);
				vo.setRcScheContent(dbScheContent);

				int result = 0;

				try {
					result = new RecruitCalendarService().insertSchedule(vo);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				System.out.println("insert result = " + result);

			}

		}
	}
}
