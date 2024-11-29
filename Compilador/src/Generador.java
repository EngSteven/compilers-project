import java.util.ArrayList;
import java.util.List;


public class Generador {

    public static String traducirVariablesGlobales(PilaSemantica pPila)
    {
        // Se recibe de la forma:
        // <tipo> <var_1> ... <var_n> 

        String traduccion = "";
        String variable = "";   
        List<String> variables = new ArrayList<>();

        System.out.println("flag 1");

        int contador = pPila.size();
        
        while (!pPila.isEmpty())
        {
            while (contador > 1)
            {
                variable = pPila.pop_end();
                variables.add(variable);
                contador--; 
            }

            System.out.println("flag 2");


            String tipo = pPila.pop_end();

            switch (tipo.toUpperCase()) {
                case "CHAR":
                    for (int i = 0; i < variables.size(); i++) {
                        traduccion += variables.get(i) + " db " + "?" + "\n"; // char -> db (1 byte)
                    }
                    break;
            
                case "SHORT":
                case "SHORT INT":
                    for (int i = 0; i < variables.size(); i++) {
                        traduccion += variables.get(i) + " dw " + "?" + "\n"; // short -> dw (2 bytes)
                    }
                    break;
            
                case "INT":
                    for (int i = 0; i < variables.size(); i++) {
                        traduccion += variables.get(i) + " dd " + "?" + "\n"; // int -> dd (4 bytes)
                    }
                    break;
            
                case "LONG":
                case "LONG INT":
                case "LONG LONG":
                case "LONG LONG INT":
                    for (int i = 0; i < variables.size(); i++) {
                        traduccion += variables.get(i) + " dq " + "?" + "\n"; // long/long long -> dq (8 bytes)
                    }
                    break;
            
                default:
                    // Manejo por defecto (puedes definir un comportamiento adicional si lo necesitas)
                    for (int i = 0; i < variables.size(); i++) {
                        traduccion += variables.get(i) + " db " + "?" + "\n"; // Por defecto, lo tratamos como un byte
                    }
                    break;
            }            
            System.out.println("flag 3");

        }

        return traduccion;
    }
}
