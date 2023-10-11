package com.coffeesouls.Models;

public class Categoria {
    private int id_categoria;
    private String nom_categoria;
    private String estado;

    public Categoria() {
        // Constructor vacío
    }

    public Categoria(int id_categoria, String nom_categoria, String estado) {
        this.id_categoria = id_categoria;
        this.nom_categoria = nom_categoria;
        this.estado = estado;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getNom_categoria() {
        return nom_categoria;
    }

    public void setNom_categoria(String nom_categoria) {
        this.nom_categoria = nom_categoria;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Categoria{" +
                "id_categoria=" + id_categoria +
                ", nom_categoria='" + nom_categoria + '\'' +
                ", estado='" + estado + '\'' +
                '}';
    }
}
