
package bean;

public class Platillo {
    
    private int idPlatillo;
    private Categoria_platillo categoria_platillo;
    private String Nombre;
    private String Foto;
    private String Descripcion;
    private double Precio;
    private int Stock;
    private int Estado;

    public Platillo() {
    }

    public Platillo(int idPlatillo, Categoria_platillo categoria_platillo, String Nombre, String Foto, String Descripcion, double Precio, int Stock, int Estado) {
        this.idPlatillo = idPlatillo;
        this.categoria_platillo = categoria_platillo;
        this.Nombre = Nombre;
        this.Foto = Foto;
        this.Descripcion = Descripcion;
        this.Precio = Precio;
        this.Stock = Stock;
        this.Estado = Estado;
    }
    
    

    public int getIdPlatillo() {
        return idPlatillo;
    }

    public void setIdPlatillo(int idPlatillo) {
        this.idPlatillo = idPlatillo;
    }

    public Categoria_platillo getCategoria_platillo() {
        return categoria_platillo;
    }

    public void setCategoria_platillo(Categoria_platillo categoria_platillo) {
        this.categoria_platillo = categoria_platillo;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getFoto() {
        return Foto;
    }

    public void setFoto(String Foto) {
        this.Foto = Foto;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public double getPrecio() {
        return Precio;
    }

    public void setPrecio(double Precio) {
        this.Precio = Precio;
    }

    public int getStock() {
        return Stock;
    }

    public void setStock(int Stock) {
        this.Stock = Stock;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }
    
    
    
}
