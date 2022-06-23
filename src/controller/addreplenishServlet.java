package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.billDao;
import dao.billDaolmpl;
import dao.goodsDao;
import dao.goodsDaolmpl;

/**
 * Servlet implementation class addreplenishServlet
 */
@WebServlet("/addreplenishServlet")
public class addreplenishServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addreplenishServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String specname=request.getParameter("specname");
		String gname=request.getParameter("gname");
		String sname=request.getParameter("sname");
		String proname=request.getParameter("proname");
		String gunit=request.getParameter("gunit");
		String time=request.getParameter("time");
		String username=request.getParameter("username");
		int count=Integer.parseInt(request.getParameter("count"));
		billDao billDao=new billDaolmpl();
		try {
			billDao.addreplenish(specname,gname, sname, proname,count, gunit,username,time,1);
			response.getWriter().write("success");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
