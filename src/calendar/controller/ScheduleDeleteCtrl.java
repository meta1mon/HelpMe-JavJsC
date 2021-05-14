package calendar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import calendar.Service.CalendarService;
import member.vo.Member;

/**
 * Servlet implementation class ScheduleDeleteCtrl
 */
@WebServlet("/scheduledelete")
public class ScheduleDeleteCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleDeleteCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿 진입함");
		String dbScheName = request.getParameter("title");
		System.out.println("dbScheName : " + dbScheName);
		Member memVo = (Member) request.getSession().getAttribute("loginMember"); 
		
		String dbId = memVo.getId();
		System.out.println(dbId);
		
		int result = 0;
		
		try {
			result = new CalendarService().deleteSchedule(dbScheName, dbId);
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
