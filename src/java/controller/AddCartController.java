/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Cart;
import model.CartTable;
import static model.Cart_.id;
import model.Catalog;
import model.CatalogTable;
/**
 *
 * @author kedke
 */
public class AddCartController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        EntityManager em = (EntityManager) session.getAttribute("entitymanager");
        
        Cart cart = new Cart();

        int id_ctr = Integer.parseInt(request.getParameter("idcatalog"));
        Catalog catalog = CatalogTable.findCatalogById(id_ctr);

        List<Cart> oldctr = CartTable.findCartByIdCatalog(catalog);
        if (oldctr  == null) {
            cart.setIdcatalog(catalog);
            cart.setQuantity(Integer.parseInt(request.getParameter("quantity")));
            CartTable.insertCart(cart);
        } else {
            cart.setId(oldctr .get(0).getId());
            cart.setIdcatalog(catalog);
            cart.setQuantity(oldctr .get(0).getQuantity()+Integer.parseInt(request.getParameter("quantity")));
            CartTable.updateCart(cart);
        }
        
        request.getRequestDispatcher("showcart.jsp").forward(request, response);
        
       
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
