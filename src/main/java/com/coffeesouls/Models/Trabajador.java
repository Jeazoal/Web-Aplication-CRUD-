package com.coffeesouls.Models;

public class Trabajador {
    private int idEmp;
    private String nomEmp;
    private String apeEmp;
    private int edadEmp;
    private String dniEmp;
    private String email;

    public Trabajador(int idEmp, String nomEmp, String apeEmp, int edadEmp, String dniEmp, String email) {
        this.idEmp = idEmp;
        this.nomEmp = nomEmp;
        this.apeEmp = apeEmp;
        this.edadEmp = edadEmp;
        this.dniEmp = dniEmp;
        this.email = email;
    }

    // Getters y setters (puedes generarlos automáticamente en tu IDE)
    public int getIdEmp() {
        return idEmp;
    }

    public void setIdEmp(int idEmp) {
        this.idEmp = idEmp;
    }

    public String getNomEmp() {
        return nomEmp;
    }

    public void setNomEmp(String nomEmp) {
        this.nomEmp = nomEmp;
    }

    public String getApeEmp() {
        return apeEmp;
    }

    public void setApeEmp(String apeEmp) {
        this.apeEmp = apeEmp;
    }

    public int getEdadEmp() {
        return edadEmp;
    }

    public void setEdadEmp(int edadEmp) {
        this.edadEmp = edadEmp;
    }

    public String getDniEmp() {
        return dniEmp;
    }

    public void setDniEmp(String dniEmp) {
        this.dniEmp = dniEmp;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
