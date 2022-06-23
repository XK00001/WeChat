package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import dao.storeDao;
import dao.storeDaolmpl;
import dao.userDao;
import dao.userDaolmpl;

/**
 * Servlet implementation class storelookServlet
 */
@WebServlet("/storelookServlet")
public class storelookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public storelookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		storeDao storeDao=new storeDaolmpl();
		String Sname=request.getParameter("Sname");
		try {
			if(Sname==""||Sname==null){
				List<Object> list=storeDao.storeList1();
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write(JSONObject.toJSON(list).toString());
			}else {
				List<Object> list=storeDao.storeList1ByName(Sname);
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
