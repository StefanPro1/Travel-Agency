/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
@WebServlet(name = "email2", urlPatterns = {"/email2"})
public class email2 extends HttpServlet {

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

        Object id = request.getSession().getAttribute("idKorisnici");

        String mail = Upit.GetAdresa(String.valueOf(id));
        String to = mail;
        String from = "pro.travel2018@gmail.com";
        final String username = "pro.travel2018@gmail.com";
        final String password = "Protravel1989";
        String host = "smtp.gmail.com";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));
            message.setSubject("Rezervacija");
            Object datum = request.getSession().getAttribute("datum");
            Object h = request.getSession().getAttribute("hoteli");
            Object cena = request.getSession().getAttribute("cena");
            Object br = request.getSession().getAttribute("num");
            String hotel = Upit.GetHoteli(String.valueOf(h));
            String idR = Upit.IdRezervacije(String.valueOf(id));
            String msg = ("<h1>Pro-Travel Agency</h1>"
                    + "<img src=https://wallpapershome.com/images/pages/pic_h/4606.jpg width=600 height=300 >" + "<p>Uspesno ste rezervisali hotel " + hotel + "<br>"
                    + " Cena rezervacije " + cena + "€ " + "<br>" + ""
                    + " Ukupna duzina boravka  " + br + " nocenja" + "<br>" + ""
                    + " Datum prijave u hotel: " + datum + "<br>"
                    + " Vas Id rezervacije je: #" + idR + "<br>" + ""
                    + "Napomena: rezervaciju mozete besplatno otkazati u narednih 10 dana. </p>" + "<p>Prijatan boravak!</p>");
            message.setContent(msg, "text/html; charset=utf-8");

            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Uspesno ste rezervisali hotel! Uskoro ce Vam stici e-mail sa potvrdom i detaljima rezervacije');");
        out.println("location='index.jsp';");
        out.println("</script>");

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
            Logger.getLogger(email2.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(email2.class.getName()).log(Level.SEVERE, null, ex);
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
