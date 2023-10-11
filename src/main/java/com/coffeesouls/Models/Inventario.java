package com.coffeesouls.Models;

public class Inventario {
    private int cod_invet;
    private String nom_invent;
    private String tipo;
    private String cantidad;
    private String proveedor;

    // Constructor
    public Inventario(int cod_invet, String nom_invent, String tipo, String cantidad, String proveedor) {
        this.cod_invet = cod_invet;
        this.nom_invent = nom_invent;
        this.tipo = tipo;
        this.cantidad = cantidad;
        this.proveedor = proveedor;
    }

    // Getters y setters
    public int getCod_invet() {
        return cod_invet;
    }

    public void setCod_invet(int cod_invet) {
        this.cod_invet = cod_invet;
    }

    public String getNom_invent() {
        return nom_invent;
    }

    public void setNom_invent(String nom_invent) {
        this.nom_invent = nom_invent;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }
}
