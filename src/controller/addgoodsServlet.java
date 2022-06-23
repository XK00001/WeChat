package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.goodsDao;
import dao.goodsDaolmpl;
import dao.userDao;
import dao.userDaolmpl;

/**
 * Servlet implementation class addgoodsServlet
 */
@WebServlet("/addgoodsServlet")
public class addgoodsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addgoodsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String gcode=request.getParameter("gcode");
		String gname=request.getParameter("gname");
		String speccode=request.getParameter("speccode");
		String gunit=request.getParameter("gunit");
		String procode=request.getParameter("procode");
		goodsDao goodsDao=new goodsDaolmpl();
		try {
			goodsDao.addgoods(gcode, gname, speccode, gunit, procode);
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
