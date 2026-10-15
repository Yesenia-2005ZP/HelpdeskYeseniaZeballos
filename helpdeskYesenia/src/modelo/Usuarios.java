package modelo;

import java.sql.Timestamp;

public class Usuarios {

    private int id;
    private String nombrecompleto;
    private String Direccion;
    private String telefono;
    private String correo;
    private Timestamp creado;
    private Timestamp actuallizar;

    // Constructor vacío
    public Usuarios() {
    }

    // Constructor
    public Usuarios(
            int id,
            String nombrecompleto,
            String Direccion,
            String telefono,
            String correo,
            Timestamp creado,
            Timestamp actuallizar) {

        this.id = id;
        this.nombrecompleto = nombrecompleto;
        this.Direccion = Direccion;
        this.telefono = telefono;
        this.correo = correo;
        this.creado = creado;
        this.actuallizar = actuallizar;
    }

    // Getters y Setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombrecompleto() {
        return nombrecompleto;
    }

    public void setNombrecompleto(String nombrecompleto) {
        this.nombrecompleto = nombrecompleto;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public Timestamp getCreado() {
        return creado;
    }

    public void setCreado(Timestamp creado) {
        this.creado = creado;
    }

    public Timestamp getActuallizar() {
        return actuallizar;
    }

    public void setActuallizar(Timestamp actuallizar) {
        this.actuallizar = actuallizar;
    }
}