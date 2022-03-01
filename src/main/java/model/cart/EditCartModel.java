package model.cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import dao.CartDAO;
import vo.BookVO;

@WebServlet("/cart/edit")
public class EditCartModel extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//로그인 상태
		if (session.getAttribute("userId") != null) {
			// 카트 ID 가져오기
			CartDAO cartDAO = new CartDAO();
			String userId = session.getAttribute("userId").toString();
			int cartId = cartDAO.getCartId(userId);
			// 연결 해제
			cartDAO.close();
		} else {
			// 비회원 상태
			if (session.getAttribute("cart") == null) {
				List<BookVO> cart = new ArrayList<>();
				session.setAttribute("cart", cart);
			}
			List<BookVO> cart = (ArrayList<BookVO>) session.getAttribute("cart");
			int lastIndexOfCart = cart.size() - 1;
			session.setAttribute("lastIndexOfCart", lastIndexOfCart);
			
			Gson gson = new Gson();
			String cartJson = gson.toJson(cart);
			System.out.println(cartJson);
			
			request.setAttribute("main_jsp", "../cart/Cart.jsp");
			response.setContentType("application/json");
		    response.setCharacterEncoding("UTF-8");
			response.getWriter().write(cartJson);
		}
	}
}