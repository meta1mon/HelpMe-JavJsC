package recruitcalendar.controller;

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

import member.vo.Member;
import recruitcalendar.Service.RecruitCalendarService;
import recruitcalendar.VO.RecruitCalendarVO;

/**
 * Servlet implementation class RecruitCalendarViewCtrl
 */
@WebServlet("/rcscheduleview")
public class RecruitCalendarViewCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecruitCalendarViewCtrl() {
        super();
        // TODO Auto-generated constructor stub
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
		//Member memVo = (Member) request.getSession().getAttribute("loginMember"); 
		
		
		ArrayList<RecruitCalendarVO> list = null;
		
		
		try {
			list = new RecruitCalendarService().viewSchedule();
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		Gson gson = new GsonBuilder().create();
		String jsonlist = gson.toJson(list);
		System.out.println(jsonlist);
		
		
		out.print(jsonlist);
		out.flush();
		out.close();
		
	}

}
