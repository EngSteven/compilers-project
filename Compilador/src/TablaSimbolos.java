import java.util.ArrayList;
import java.util.List;

/*
 *  nombre, tipo y ámbito de variables globales, 
 * funciones y variables locales y parámetros
 */

public class TablaSimbolos {
    private List<Simbolo> simbolos;

    public TablaSimbolos() {
        this.simbolos = new ArrayList<>();
    }

    public void agregarSimbolo(String nombre, String tipo, String ambito) {
        simbolos.add(new Simbolo(nombre, tipo, ambito));
    }

    public Boolean existeSimbolo(String nombre, String ambito){
        for (Simbolo simbolo : simbolos) {
            if(simbolo.getNombre().equals(nombre) &&
            !(ambito.equals("variables locales") && simbolo.getAmbito().equals("variables globales")) &&
            !(ambito.equals("parametros") && simbolo.getAmbito().equals("variables globales"))){
                return true;
            }
        }
        return false;
    }

    // para verificar variables ya declaradas
    public Boolean existeSimbolo(String nombre){
        for (Simbolo simbolo : simbolos) {
            if(simbolo.getNombre().equals(nombre)){
                return true;
            }
        }
        return false;
    }


    public String getTablaSimStr(){
        StringBuilder tabla = new StringBuilder();

        // Encabezados de la tabla
        tabla.append(String.format("%-15s %-15s %-15s%n", "NOMBRE", "TIPO", "AMBITO"));
        tabla.append("-".repeat(45)).append("\n"); // Línea de separación

        // Filas de la tabla
        for (Simbolo simbolo : simbolos) {
            tabla.append(String.format("%-15s %-15s %-15s%n",
                    simbolo.getNombre(),
                    simbolo.getTipo(),
                    simbolo.getAmbito()));
        }

        System.out.println(tabla.toString());
        return tabla.toString();
    }

    // Búsqueda de un símbolo por nombre
    public Simbolo buscarSimbolo(String nombre) {
        for (Simbolo simbolo : simbolos) {
            if (simbolo.getNombre().equals(nombre)) {
                return simbolo;
            }
        }
        return null; // No encontrado
    }

    // Para poner los tipos de las variables declaradas consecutivamente
    public void asignarTipo(String tipo){
        for (Simbolo simbolo : simbolos) {
            if(simbolo.getTipo().equals("")){
                simbolo.setTipo(tipo);
            }
            
        }

    }



}
