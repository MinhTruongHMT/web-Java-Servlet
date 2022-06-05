package sevlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.*;
import domain.*;
import java.util.*;

@WebServlet(name = "sachServlet", urlPatterns = {"/sachServlet"})
public class sachServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            String page = "";
            SachDAO dao = new SachDAO();
            LoaiSachDAO loaidao = new LoaiSachDAO();
            if (action.equals("xoa")) {
                page = "ShowSach.jsp";
                int id = Integer.valueOf(request.getParameter("masach"));
                Sach ls = dao.get(id);
                dao.delete(ls);
            } else if (action.equals("xulythem")) {
                page = "ShowSach.jsp";
                Sach ls = new Sach();
                int id = Integer.valueOf(request.getParameter("masach"));
                ls.setMasach(id);
                ls.setTensach(request.getParameter("tensach"));
                ls.setGiasach(Float.parseFloat(request.getParameter("giasach")));
                Loaisach a = loaidao.get(Integer.parseInt(request.getParameter("list")));
                ls.setLoaisach(a);
                String anh = request.getParameter("photo");
                ls.setAnh(anh.getBytes());
                dao.create(ls);

            } else if (action.equals("sua")) {
                page = "suasach.jsp";
                int id = Integer.valueOf(request.getParameter("masach"));
                Sach a = dao.get(id);
                if (a == null) {
                    request.setAttribute("sach", new Sach());
                }
                request.setAttribute("sach", a);
            }
            request.getRequestDispatcher(page).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
