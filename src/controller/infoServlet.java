package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import dao.billDao;
import dao.billDaolmpl;
import dao.userDao;
import dao.userDaolmpl;

/**
 * Servlet implementation class infoServlet
 */
@WebServlet("/infoServlet")
public class infoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public infoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		billDao billDao=new billDaolmpl();
		String Username=request.getParameter("Username");
		try {
			if(Username==""||Username==null){
				List<Object> list=billDao.infoList();
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write(JSONObject.toJSON(list).toString());
			}else {
				List<Object> list=billDao.infoListByName(Username);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write(JSONObject.toJSON(list).toString());
			}
			
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
