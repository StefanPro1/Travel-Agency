package model;
// Generated 06-Aug-2018 19:42:17 by Hibernate Tools 4.3.1

import java.util.HashSet;
import java.util.Set;

/**
 * Hoteli generated by hbm2java
 */
public class Hoteli implements java.io.Serializable {

    private int idHoteli;
    private String naziv;
    private String stars;
    private Integer cena;
    private Set<Rezervacija> rezervacijas = new HashSet<>(0);

    public Hoteli() {
    }

    public Hoteli(int idHoteli) {
        this.idHoteli = idHoteli;
    }

    public Hoteli(int idHoteli, String naziv, String stars, Integer cena, Set<Rezervacija> rezervacijas) {
        this.idHoteli = idHoteli;
        this.naziv = naziv;
        this.stars = stars;
        this.cena = cena;
        this.rezervacijas = rezervacijas;
    }

    public int getIdHoteli() {
        return this.idHoteli;
    }

    public void setIdHoteli(int idHoteli) {
        this.idHoteli = idHoteli;
    }

    public String getNaziv() {
        return this.naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public String getStars() {
        return this.stars;
    }

    public void setStars(String stars) {
        this.stars = stars;
    }

    public Integer getCena() {
        return this.cena;
    }

    public void setCena(Integer cena) {
        this.cena = cena;
    }

    public Set<Rezervacija> getRezervacijas() {
        return this.rezervacijas;
    }

    public void setRezervacijas(Set<Rezervacija> rezervacijas) {
        this.rezervacijas = rezervacijas;
    }

}
