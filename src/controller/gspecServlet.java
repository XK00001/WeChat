package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;

import dao.goodsDao;
import dao.goodsDaolmpl;
import dao.goodspecDao;
import dao.goodspecDaolmpl;
import dao.providerDao;
import dao.providerDaolmpl;
import dao.storeDao;
import dao.storeDaolmpl;

/**
 * Servlet implementation class gspecServlet
 */
@WebServlet("/gspecServlet")
public class gspecServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public gspecServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		goodspecDao goodspecDao=new goodspecDaolmpl();
		goodsDao goodsDao=new goodsDaolmpl();
		storeDao storeDao=new storeDaolmpl();
		providerDao providerDao=new providerDaolmpl();
		int type=Integer.parseInt(request.getParameter("type"));
		String speccode=request.getParameter("speccode");
		String gcode=request.getParameter("gcode");
		List<Object> list;
		try {
			if(type==1) {
				list = goodspecDao.specList();
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write(JSONObject.toJSON(list).toString());
			}else if(type==2) {
				list = goodsDao.goodsList1(speccode);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write(JSONObject.toJSON(list).toString());
			}else if(type==3) {
				list = storeDao.store1(speccode);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write(JSONObject.toJSON(list).toString());
			}else if(type==4) {
				list = providerDao.prolist1(speccode);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write(JSONObject.toJSON(list).toString());
			}else if(type==5) {
				list = goodsDao.gunitlist(gcode);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write(JSONObject.toJSON(list).toString());
			}
		} catch (SQLException e) {
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
