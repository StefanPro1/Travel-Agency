/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import Util.DBConection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class Upit {

    public static boolean isUserValid(String username, String password) {
        boolean isValid = false;
        Connection conn = DBConection.getConn();
        String upit = "select * from korisnici where username = ? and password = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(upit);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                isValid = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Upit.class.getName()).log(Level.SEVERE, null, ex);
        }

        return isValid;
    }

    public static int isUserValidGetId(String username, String password) {
        boolean isValid = false;
        Connection conn = DBConection.getConn();
        String upit = "select idKorisnici from korisnici where username = ? and password = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(upit);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Upit.class.getName()).log(Level.SEVERE, null, ex);
        }

        return -1;
    }

    public static List<String> GetDestinacije(String idDestinacije) {
        List<String> lista = new ArrayList<>();
        Connection conn = DBConection.getConn();
        String upit = "select Drzava,Grad from destinacije where idDestinacije = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(upit);
            ps.setString(1, idDestinacije);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lista.add(rs.getString("Grad"));
                lista.add(rs.getString("Drzava"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(Upit.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lista;

    }

    public static String AvioKompanije(String idAvio_kompanije) {
        String naziv = null;
        Connection conn = DBConection.getConn();
        String upit = "select Naziv from avio_kompanije where idAvio_kompanije = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(upit);
            ps.setString(1, idAvio_kompanije);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                naziv = rs.getString("Naziv");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Upit.class.getName()).log(Level.SEVERE, null, ex);
        }
        return naziv;
    }

    public static String GetAdresa(String idKorisnici) {
        String eadresa = null;
        Connection conn = DBConection.getConn();
        String upit = "select Adresa from korisnici where idKorisnici = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(upit);
            ps.setString(1, idKorisnici);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                eadresa = rs.getString("Adresa");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Upit.class.getName()).log(Level.SEVERE, null, ex);
        }
        return eadresa;
    }

    public static double GetCena(String idDestinacije) {
        int Cena = 0;
        Connection conn = DBConection.getConn();
        String upit = "select Cena from destinacije where idDestinacije = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(upit);
            ps.setString(1, idDestinacije);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cena = rs.getInt("Cena");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Upit.class.getName()).log(Level.SEVERE, null, ex);
        }
        return Cena;

    }

    public static String IdRezervacije(String idKorisnici) {
        String id = null;
        Connection conn = DBConection.getConn();
        String upit = "select IdRezervacije from rezervacija where fk_korisnici = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(upit);
            ps.setString(1, idKorisnici);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                id = rs.getString("IdRezervacije");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Upit.class.getName()).log(Level.SEVERE, null, ex);
        }
        return id;
    }

    public static String GetHoteli(String idHoteli) {
        String hotel = null;
        Connection conn = DBConection.getConn();
        String upit = "select Naziv from hoteli where idHoteli = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(upit);
            ps.setString(1, idHoteli);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                hotel = rs.getString("Naziv");

            }
        } catch (SQLException ex) {
            Logger.getLogger(Upit.class.getName()).log(Level.SEVERE, null, ex);
        }
        return hotel;

    }

    public static double GetCenaHotela(String idHoteli) {
        int cena = 0;
        Connection conn = DBConection.getConn();
        String upit = "select Cena from Hoteli where idHoteli = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(upit);
            ps.setString(1, idHoteli);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cena = rs.getInt("Cena");
            }
        } catch (SQLException ex) {
            Logger.getLogger(Upit.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cena;

    }

    public static boolean isAdminValid(String username, String password) {
        boolean isValid = false;
        Connection conn = DBConection.getConn();
        String upit = "select * from zaposleni where username = ? and password = ?";
        try {
            PreparedStatement ps = conn.prepareStatement(upit);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                isValid = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(Upit.class.getName()).log(Level.SEVERE, null, ex);
        }

        return isValid;
    }
}
