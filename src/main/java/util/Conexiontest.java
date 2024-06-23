/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package util;

/**
 *
 * @author miche
 */
public class Conexiontest {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        
        ConexionBD con = new ConexionBD();
        con.getConnection();
    }
    
}
