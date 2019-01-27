/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Util.DBConection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Upit;

/**
 *
 * @author Administrator
 */
@WebServlet(name = "hotel", urlPatterns = {"/hotel"})
public class hotel extends HttpServlet {

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
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            request.getSession(true).removeAttribute("AvioKarte");
             Object log = request.getSession().getAttribute("logged");
             
        if (log != null){
               try {
            
            String hotels = request.getParameter("hoteli");
            String br = request.getParameter("num");
            String datum = request.getParameter("datum");
            Connection conn = DBConection.getConn();
            String upit = ("insert into rezervacija (fk_korisnici, Datum, fk_hoteli) values (?,?,?)");
            Object id = request.getSession().getAttribute("idKorisnici");
            PreparedStatement ps = conn.prepareStatement(upit);
            ps.setString(1, String.valueOf(id));
            ps.setString(2, datum);
            ps.setString(3, hotels);   
            int rs = ps.executeUpdate();
            
                   int broj = Integer.parseInt(br);
                   double cena = Upit.GetCenaHotela(hotels);
                   cena = broj * cena;
            
                     request.getSession(true).setAttribute("cena", cena);
                     request.getSession(true).setAttribute("hoteli", hotels);
                     request.getSession(true).setAttribute("num", br);
                     request.getSession(true).setAttribute("datum", datum);
            
            
        } catch (SQLException ex) {
            Logger.getLogger(hotel.class.getName()).log(Level.SEVERE, null, ex);
        }
        
            out.println("<script type=\"text/javascript\">");
            out.println("location='Placanje.jsp';");
            out.println("</script>");
            
        }else{ 
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Potrebno je da se ulogujete!');");
            out.println("location='Login.jsp';");
            out.println("</script>");
            
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
