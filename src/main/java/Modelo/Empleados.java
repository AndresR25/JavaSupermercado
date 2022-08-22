/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

public class Empleados {
    private int codempleado;
    private String nombreemp;
    private String apellido1E;
    private String apellido2E;
    private int salario;
    private String telefonoE;

    public Empleados(int codempleado, String nombreemp, String apellido1E, String apellido2E, int salario, String telefonoE) {
        this.codempleado = codempleado;
        this.nombreemp = nombreemp;
        this.apellido1E = apellido1E;
        this.apellido2E = apellido2E;
        this.salario = salario;
        this.telefonoE = telefonoE;
    }

    public int getCodempleado() {
        return codempleado;
    }

    public void setCodempleado(int codempleado) {
        this.codempleado = codempleado;
    }

    public String getNombreemp() {
        return nombreemp;
    }

    public void setNombreemp(String nombreemp) {
        this.nombreemp = nombreemp;
    }

    public String getApellido1E() {
        return apellido1E;
    }

    public void setApellido1E(String apellido1E) {
        this.apellido1E = apellido1E;
    }

    public String getApellido2E() {
        return apellido2E;
    }

    public void setApellido2E(String apellido2E) {
        this.apellido2E = apellido2E;
    }

    public int getSalario() {
        return salario;
    }

    public void setSalario(int salario) {
        this.salario = salario;
    }

    public String getTelefonoE() {
        return telefonoE;
    }

    public void setTelefonoE(String telefonoE) {
        this.telefonoE = telefonoE;
    }

 
    
}
