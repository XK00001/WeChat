package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.providerDao;
import dao.providerDaolmpl;
/**
 * Servlet implementation class updateproServlet
 */
@WebServlet("/updateproServlet")
public class updateproServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateproServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		int id=Integer.parseInt(request.getParameter("id"));
		String procode=request.getParameter("procode");
		String proname=request.getParameter("proname");
		String prodesc=request.getParameter("prodesc");
		String procontact=request.getParameter("procontact");
		String prophone=request.getParameter("prophone");
		String proaddress=request.getParameter("proaddress");
		providerDao providerDao=new providerDaolmpl();
		try {
			providerDao.updateprovider(id,procode, proname, prodesc, procontact, prophone, proaddress);
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
