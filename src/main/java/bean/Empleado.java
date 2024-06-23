package bean;

public class Empleado {

    private int Idempleado;
    private Tipo_empleado tipo_empleado;
    private String Nombre;
    private String Apellido;
    private String Genero;
    private int Telefono;
    private String Correo;
    private String Password;
    private int Estado;

    public Empleado() {
    }
    
    public Empleado(int Idempleado, Tipo_empleado tipo_empleado, String Nombre, String Apellido, String Genero, int Telefono, String Correo, String Password, int Estado) {
        this.Idempleado = Idempleado;
        this.tipo_empleado = tipo_empleado;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.Genero = Genero;
        this.Telefono = Telefono;
        this.Correo = Correo;
        this.Password = Password;
        this.Estado = Estado;
    }

    public int getIdempleado() {
        return Idempleado;
    }

    public void setIdempleado(int Idempleado) {
        this.Idempleado = Idempleado;
    }

    public Tipo_empleado getTipo_empleado() {
        return tipo_empleado;
    }

    public void setTipo_empleado(Tipo_empleado tipo_empleado) {
        this.tipo_empleado = tipo_empleado;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getApellido() {
        return Apellido;
    }

    public void setApellido(String Apellido) {
        this.Apellido = Apellido;
    }

    public String getGenero() {
        return Genero;
    }

    public void setGenero(String Genero) {
        this.Genero = Genero;
    }

    public int getTelefono() {
        return Telefono;
    }

    public void setTelefono(int Telefono) {
        this.Telefono = Telefono;
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
