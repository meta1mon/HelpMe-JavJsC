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
import member.vo.Member;

/**
 * Servlet implementation class ScheduleInsert
 */
@WebServlet("/scheduleinsert")
public class ScheduleInsertCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ScheduleInsertCtrl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿 들어 왔다");
		
		
		
		CalendarVO vo = new CalendarVO();
		Member memVo = (Member) request.getSession().getAttribute("loginMember"); 

		String dbScheName = request.getParameter("scheName");
		String dbId = memVo.getId();
		String dbScheStart = request.getParameter("scheStart");
		String dbScheEnd = request.getParameter("scheEnd");
		int dbScheCode = Integer.parseInt(request.getParameter("scheCode"));
		String dbScheContent = request.getParameter("scheContent");
		
		vo.setId(dbId);
		vo.setScheName(dbScheName);
		vo.setScheStart(dbScheStart);
		vo.setScheEnd(dbScheEnd);
		vo.setScheCode(dbScheCode);
		vo.setScheContent(dbScheContent);
		
		int result = 0;
		
		try {
			result = new CalendarService().insertSchedule(vo);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
