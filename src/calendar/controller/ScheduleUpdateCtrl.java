package calendar.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import calendar.Service.CalendarService;
import calendar.VO.CalendarVO;

/**
 * Servlet implementation class ScheduleUpdateCtrl
 */
@WebServlet("/scheduleupdate")
public class ScheduleUpdateCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleUpdateCtrl() {
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
		CalendarVO vo = new CalendarVO();

		String dbScheStart = request.getParameter("scheStart");
		String dbScheEnd = request.getParameter("scheEnd");
		int dbScheCode = Integer.parseInt(request.getParameter("scheCode"));
		String dbScheContent = request.getParameter("scheContent");
		String dbScheName = request.getParameter("scheName");
		
		vo.setScheStart(dbScheStart);
		vo.setScheEnd(dbScheEnd);
		vo.setScheCode(dbScheCode);
		vo.setScheContent(dbScheContent);
		vo.setScheName(dbScheName);
		
		int result = 0;
		
		try {
			result = new CalendarService().updateSchedule(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
