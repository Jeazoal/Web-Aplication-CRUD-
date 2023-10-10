package com.coffeesouls.Models;
import java.sql.Date;

public class Inventario {
    private int idProducto;
    private int cantidad;
    private Date fechaEntrada;
    private String categoria;

    public Inventario(int idProducto, int cantidad, Date fechaEntrada, String categoria) {
        this.idProducto = idProducto;
        this.cantidad = cantidad;
        this.fechaEntrada = fechaEntrada;
        this.categoria = categoria;
    }

    // Getters y setters

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Date getFechaEntrada() {
        return fechaEntrada;
    }

    public void setFechaEntrada(Date fechaEntrada) {
        this.fechaEntrada = fechaEntrada;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }
}
