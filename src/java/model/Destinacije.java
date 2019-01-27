package model;
// Generated 06-Aug-2018 19:42:17 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Destinacije generated by hbm2java
 */
public class Destinacije  implements java.io.Serializable {


     private Integer idDestinacije;
     private AvioKompanije avioKompanije;
     private String grad;
     private String drzava;
     private Integer cena;
     private Set<Rezervacija> rezervacijas = new HashSet<>(0);

    public Destinacije() {
    }

    public Destinacije(AvioKompanije avioKompanije, String grad, String drzava, Integer cena, Set<Rezervacija> rezervacijas) {
       this.avioKompanije = avioKompanije;
       this.grad = grad;
       this.drzava = drzava;
       this.cena = cena;
       this.rezervacijas = rezervacijas;
    }
   
    public Integer getIdDestinacije() {
        return this.idDestinacije;
    }
    
    public void setIdDestinacije(Integer idDestinacije) {
        this.idDestinacije = idDestinacije;
    }
    public AvioKompanije getAvioKompanije() {
        return this.avioKompanije;
    }
    
    public void setAvioKompanije(AvioKompanije avioKompanije) {
        this.avioKompanije = avioKompanije;
    }
    public String getGrad() {
        return this.grad;
    }
    
    public void setGrad(String grad) {
        this.grad = grad;
    }
    public String getDrzava() {
        return this.drzava;
    }
    
    public void setDrzava(String drzava) {
        this.drzava = drzava;
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


