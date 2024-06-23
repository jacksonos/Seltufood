/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

/**
 *
 * @author miche
 */
public class Cliente {
    
    private int Idcliente;
    private String Nombres;
    private String Apellidos;
    private String Genero;
    private String Direccion;
    private String Correo;
    private String Password;
    private int Estado;

    public Cliente() {
    }

    public Cliente(int Idcliente, String Nombres, String Apellidos, String Genero, String Direccion, String Correo, String Password, int Estado) {
        this.Idcliente = Idcliente;
        this.Nombres = Nombres;
        this.Apellidos = Apellidos;
        this.Genero = Genero;
        this.Direccion = Direccion;
        this.Correo = Correo;
        this.Password = Password;
        this.Estado = Estado;
    }
    
    

    public int getIdcliente() {
        return Idcliente;
    }

    public void setIdcliente(int Idcliente) {
        this.Idcliente = Idcliente;
    }

    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String Nombres) {
        this.Nombres = Nombres;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String Apellidos) {
        this.Apellidos = Apellidos;
    }

    public String getGenero() {
        return Genero;
    }

    public void setGenero(String Genero) {
        this.Genero = Genero;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }
    
    
    
}
