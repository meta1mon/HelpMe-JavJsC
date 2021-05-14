package calendar.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import calendar.Service.CalendarService;
import member.vo.Member;

/**
 * Servlet implementation class ScheduleUpdateCtrl
 */
@WebServlet("/scheduledrop")
public class ScheduleDragNDropCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleDragNDropCtrl() {
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
		System.out.println("resize 서블릿");
		
		String dbScheStart = request.getParameter("start");
		System.out.println(dbScheStart);
		String dbScheEnd = request.getParameter("end");
		System.out.println(dbScheEnd);
		
		String dbScheName = request.getParameter("title");
		System.out.println(dbScheName);
		
		Member memVo = (Member) request.getSession().getAttribute("loginMember"); 
		String dbId = memVo.getId();
		
		
		
		int result = 0;
		
		try {
			result = new CalendarService().dropSchedule(dbScheStart, dbScheEnd, dbScheName, dbId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
