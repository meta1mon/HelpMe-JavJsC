package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;

import member.dao.MemberDao;
import member.service.MemberService;
import member.vo.Member;

/**
 * Servlet implementation class UniqueIdCheck
 */
@WebServlet("/uniqueid")
public class UniqueIdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UniqueIdCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String str = request.getParameter("id");
		int tag = Integer.parseInt(request.getParameter("tag"));
		Member result = new MemberService().selectSearch(str, tag);
		
		Gson gson = new GsonBuilder().create();
		String msg;

		if(result == null) {
			 msg = gson.toJson("사용가능");			
		} else {
			msg = gson.toJson("사용불가능");
		}
		PrintWriter out = response.getWriter();
		out.println(msg);
		out.flush();
		out.close();
		
		
		
	}

}
