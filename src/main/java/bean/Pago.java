/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

/**
 *
 * @author miche
 */
public class Pago {
    
    private int Idpago;
    private double Monto;
    
    public Pago() {
    }
    

    public Pago(int Idpago, double Monto) {
        this.Idpago = Idpago;
        this.Monto = Monto;
    }

    public int getIdpago() {
        return Idpago;
    }

    public void setIdpago(int Idpago) {
        this.Idpago = Idpago;
    }

    public double getMonto() {
        return Monto;
    }

    public void setMonto(double Monto) {
        this.Monto = Monto;
    }
    
    
    
}
