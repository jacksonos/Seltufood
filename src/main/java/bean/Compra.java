/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

/**
 *
 * @author miche
 */
public class Compra {
    
    private int Idcompra;
    private int Idcliente;
    private int Idpago;
    private String Fechacompra;
    private double Monto;
    private String Estado;
    private String nombreCli;

    public Compra() {
    }

    public Compra(int Idcompra, int Idcliente, int Idpago, String Fechacompra, double Monto, String Estado) {
        this.Idcompra = Idcompra;
        this.Idcliente = Idcliente;
        this.Idpago = Idpago;
        this.Fechacompra = Fechacompra;
        this.Monto = Monto;
        this.Estado = Estado;
    }

    public int getIdcompra() {
        return Idcompra;
    }

    public void setIdcompra(int Idcompra) {
        this.Idcompra = Idcompra;
    }

    public int getIdcliente() {
        return Idcliente;
    }

    public void setIdcliente(int Idcliente) {
        this.Idcliente = Idcliente;
    }

    public int getIdpago() {
        return Idpago;
    }

    public void setIdpago(int Idpago) {
        this.Idpago = Idpago;
    }

    public String getFechacompra() {
        return Fechacompra;
    }

    public void setFechacompra(String Fechacompra) {
        this.Fechacompra = Fechacompra;
    }

    public double getMonto() {
        return Monto;
    }

    public void setMonto(double Monto) {
        this.Monto = Monto;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public String getNombreCli() {
        return nombreCli;
    }

    public void setNombreCli(String nombreCli) {
        this.nombreCli = nombreCli;
    }
    
    
    
}
