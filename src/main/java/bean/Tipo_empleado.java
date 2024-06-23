/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

/**
 *
 * @author miche
 */
public class Tipo_empleado {
    
    private int Idtipo_empleado;
    private String Nombre;
    private int Estado;

    public Tipo_empleado() {
    }

    public Tipo_empleado(int Idtipo_empleado, String Nombre, int Estado) {
        this.Idtipo_empleado = Idtipo_empleado;
        this.Nombre = Nombre;
        this.Estado = Estado;
    }

    public int getIdtipo_empleado() {
        return Idtipo_empleado;
    }

    public void setIdtipo_empleado(int Idtipo_empleado) {
        this.Idtipo_empleado = Idtipo_empleado;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }
    
    
    
}
