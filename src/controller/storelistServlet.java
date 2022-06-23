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

/**
 * Servlet implementation class storelistServlet
 */
@WebServlet("/storelistServlet")
public class storelistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public storelistServlet() {
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
				List<Object> list=storeDao.storeList();
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write(JSONObject.toJSON(list).toString());
			}else {
				List<Object> list=storeDao.storeListByName(Sname);
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
