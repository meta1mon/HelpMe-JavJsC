package calendar.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import calendar.Service.CalendarService;
import calendar.VO.CalendarVO;
import member.vo.Member;

/**
 * Servlet implementation class ScheduleViewCtrl
 */
@WebServlet("/scheduleview")
public class ScheduleViewCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScheduleViewCtrl() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		execute(request, response);
	}
	
	protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿 진입함");
		PrintWriter out = response.getWriter();
		
		Member memVo = (Member) request.getSession().getAttribute("loginMember"); 
		
		String id = memVo.getId();
		System.out.println(id);
		
		ArrayList<CalendarVO> list = null;
		
		try {
			list = new CalendarService().viewSchedule(id);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		Gson gson = new GsonBuilder().create();
		String jsonlist = gson.toJson(list);
		System.out.println(jsonlist);
		
		
		out.print(jsonlist);
		out.flush();
		out.close();
		
		// TODO 여기 RESIZE DB연결 필요오오오 데이터 받아오기이이이 NULL 들어온다ㅏㅏㅏ
	}
	
	
}
