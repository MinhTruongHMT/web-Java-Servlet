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

@WebServlet(name = "LoaiSachServlet", urlPatterns = {"/LoaiSachServlet"})
public class LoaiSachServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String action = request.getParameter("action");
            String page = "";
            LoaiSachDAO dao = new LoaiSachDAO();
            if (action.equals("xoa")) {
                page = "ShowLoaiSach.jsp";
                Integer maloai = Integer.valueOf(request.getParameter("maloai"));
                Loaisach ls = dao.get(maloai);
                dao.delete(ls);
            } else if (action.equals("xulythem")) {
                
                Loaisach ls = new Loaisach();
                ls.setTenloai(request.getParameter("tenloaisach"));
                page = "ShowLoaiSach.jsp";
                dao.create(ls);
            } else if (action.equals("sua")) {
                int id = Integer.valueOf(request.getParameter("maloai"));
                Loaisach a = dao.get(id);
                if(a==null){
                    request.setAttribute("loaisach", new Sach());
                }
                request.setAttribute("loaisach",a);
                page="suaLoaiSach.jsp";
            }
            else if (action.equals("update")) {
                int id = Integer.valueOf(request.getParameter("maloai"));
                Loaisach a = dao.get(id);
                a.setTenloai(request.getParameter("tenloaisach"));
                dao.create(a);
                page="ShowLoaiSach.jsp";
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
