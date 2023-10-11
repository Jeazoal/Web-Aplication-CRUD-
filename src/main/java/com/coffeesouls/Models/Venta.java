package com.coffeesouls.Models;
import java.math.BigDecimal;
import java.util.Date;

public class Venta {
    private int idVenta;
    private Date fechaVenta;
    private BigDecimal monto;
    private String descripcion;
    private String nomCliente;

    public Venta(int idVenta, Date fechaVenta, BigDecimal monto, String descripcion, String nomCliente) {
        this.idVenta = idVenta;
        this.fechaVenta = fechaVenta;
        this.monto = monto;
        this.descripcion = descripcion;
        this.nomCliente = nomCliente;
    }

    // Agregar getters y setters según sea necesario
    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public Date getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(Date fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public BigDecimal getMonto() {
        return monto;
    }

    public void setMonto(BigDecimal monto) {
        this.monto = monto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getNomCliente() {
        return nomCliente;
    }

    public void setNomCliente(String nomCliente) {
        this.nomCliente = nomCliente;
    }

    @Override
    public String toString() {
        return "Venta [idVenta=" + idVenta + ", fechaVenta=" + fechaVenta + ", monto=" + monto + ", descripcion="
                + descripcion + ", nomCliente=" + nomCliente + "]";
    }
}
