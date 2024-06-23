
package bean;

public class Categoria_platillo {
    
    private int idCategoria;
    private String Nombre;
    private int Estado;

    public Categoria_platillo(int idCategoria, String Nombre, int Estado) {
        this.idCategoria = idCategoria;
        this.Nombre = Nombre;
        this.Estado = Estado;
    }

    public Categoria_platillo() {
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
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
