/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Util.DBConection;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
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
@WebServlet(name = "PlanLeta", urlPatterns = {"/PlanLeta"})
public class PlanLeta extends HttpServlet {

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
            throws ServletException, IOException, SQLException {

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String destinacija = request.getParameter("destinacija");
        String Akompanije = request.getParameter("Akompanije");
        String datum = request.getParameter("datum");
        String povratak = request.getParameter("povratak");
        String bkarata = request.getParameter("bkarata");
        String torbe = request.getParameter("button");

        List<String> dest = Upit.GetDestinacije(destinacija);
        String avio = Upit.AvioKompanije(Akompanije);
        double cena = Upit.GetCena(destinacija);

        int karte = Integer.parseInt(bkarata);

        
        
        
        
        if (karte != 0) {
            cena = karte * cena;
            
        }
        if (povratak != null) {
            cena = 1.5 * cena;
        }
     if (torbe.equals("medium +25 evra")) {

            cena = cena + (25 * karte);
            
           
       }if (torbe.equals("large +60 evra")) {
            cena =  cena + (60 * karte);
       }
        response.sendRedirect("Plan.jsp");
        request.getSession(true).setAttribute("AvioKarte", true);
        request.getSession(true).setAttribute("destinacija", dest);
        request.getSession(true).setAttribute("Akompanije", avio);
        request.getSession(true).setAttribute("bkarata", bkarata);
        request.getSession(true).setAttribute("datum", datum);
        request.getSession(true).setAttribute("povratak", povratak);
        request.getSession(true).setAttribute("ukupno", cena);
        request.getSession(true).setAttribute("torbe", torbe);

        Connection conn = DBConection.getConn();
        String upit = ("insert into rezervacija (fk_korisnici, datum, fk_destinacije) values (?,?,?)");
        Object id = request.getSession().getAttribute("idKorisnici");
        PreparedStatement ps = conn.prepareStatement(upit);
        ps.setString(1, String.valueOf(id));
        ps.setString(2, datum);
        ps.setString(3, destinacija);
        int rs = ps.executeUpdate();

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PlanLeta.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(PlanLeta.class.getName()).log(Level.SEVERE, null, ex);
        }
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
