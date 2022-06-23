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
 * Servlet implementation class inServlet
 */
@WebServlet("/inServlet")
public class inServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public inServlet() {
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
		int count=Integer.parseInt(request.getParameter("count"));
		String time=request.getParameter("time");
		String username=request.getParameter("username");
		String remark=request.getParameter("remark");
		billDao billDao=new billDaolmpl();
		goodsDao goodsDao=new goodsDaolmpl();
		try {
			billDao.addbill(gname,specname, sname, proname, gunit,time,username,remark,count);
			goodsDao.updatecount(gname,count);
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
