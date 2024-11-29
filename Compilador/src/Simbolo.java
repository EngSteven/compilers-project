public class Simbolo {
    private String nombre;
    private String tipo;
    private String ambito;

    public Simbolo(String nombre, String tipo, String ambito) {
        this.nombre = nombre;
        this.tipo = tipo;
        this.ambito = ambito;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getAmbito() {
        return ambito;
    }

    public void setAmbito(String ambito) {
        this.ambito = ambito;
    }

    
}
