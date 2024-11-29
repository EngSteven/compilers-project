import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class Principal {
    private static final String dir = System.getProperty("user.dir");

    public static void main(String[] args) throws Exception {
        String ruta1 = dir + "/src/Lexer.flex";
        String ruta2 = dir + "/src/LexerCup.flex";
        String[] rutaS =  {"-parser", "Sintax", dir + "/src/Sintax.cup"}; 
        generarLexer(ruta1, ruta2, rutaS);
    }
    
    public static void generarLexer(String ruta1, String ruta2, String[] rutaS) throws IOException, Exception{
        File archivo;

        // Verificar y generar Lexer.flex
        archivo = new File(ruta1);
        if (archivo.exists()) {
            System.out.println("Generando lexer desde: " + archivo.getAbsolutePath());
            JFlex.Main.generate(archivo);
        } else {
            System.out.println("Archivo no encontrado: " + archivo.getAbsolutePath());
            return;
        }

        // Verificar y generar LexerCup.flex
        archivo = new File(ruta2);
        if (archivo.exists()) {
            System.out.println("Generando lexer desde: " + archivo.getAbsolutePath());
            JFlex.Main.generate(archivo);
        } else {
            System.out.println("Archivo no encontrado: " + archivo.getAbsolutePath());
            return;
        }

        // Generar archivos con CUP
        System.out.println("Generando archivos CUP...");
        java_cup.Main.main(rutaS);

        // Mover sym.java a /src
        Path rutaSym = Paths.get(dir + "/src/sym.java");
        if (Files.exists(rutaSym)) {
            System.out.println("Eliminando archivo sym.java existente...");
            Files.delete(rutaSym);
        }
        if (Files.exists(Paths.get(dir + "/sym.java"))) {
            Files.move(
                Paths.get(dir + "/sym.java"), 
                Paths.get(dir + "/src/sym.java")
            );
            System.out.println("sym.java movido a /src");
        } else {
            System.out.println("sym.java no se generó correctamente.");
        }

        // Mover Sintax.java a /src
        Path rutaSin = Paths.get(dir + "/src/Sintax.java");
        if (Files.exists(rutaSin)) {
            System.out.println("Eliminando archivo Sintax.java existente...");
            Files.delete(rutaSin);
        }
        if (Files.exists(Paths.get(dir + "/Sintax.java"))) {
            Files.move(
                Paths.get(dir + "/Sintax.java"), 
                Paths.get(dir + "/src/Sintax.java")
            );
            System.out.println("Sintax.java movido a /src");
        } else {
            System.out.println("Sintax.java no se generó correctamente.");
        }
    }
}