/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

/**
 *
 * @author miche
 */
public class Detalle_compra {
    
    private int Iddetalle;
    private int Idproducto;
    private int Idcompra;
    private int Cantidad;
    private double Precio;
    private Platillo platillo;

    public Detalle_compra() {
    }

    public Detalle_compra(int Iddetalle, int Idproducto, int Idcompra, int Cantidad, double Precio, Platillo platillo) {
        this.Iddetalle = Iddetalle;
        this.Idproducto = Idproducto;
        this.Idcompra = Idcompra;
        this.Cantidad = Cantidad;
        this.Precio = Precio;
        this.platillo = platillo;
    }
    
    public int getIddetalle() {
        return Iddetalle;
    }

    public void setIddetalle(int Iddetalle) {
        this.Iddetalle = Iddetalle;
    }

    public int getIdproducto() {
        return Idproducto;
    }

    public void setIdproducto(int Idproducto) {
        this.Idproducto = Idproducto;
    }

    public int getIdcompra() {
        return Idcompra;
    }

    public void setIdcompra(int Idcompra) {
        this.Idcompra = Idcompra;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }

    public Platillo getPlatillo() {
        return platillo;
    }

    public void setPlatillo(Platillo platillo) {
        this.platillo = platillo;
    }
    
    
    
}
