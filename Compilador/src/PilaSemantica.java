import java.util.ArrayList;

public class PilaSemantica {
    
    private ArrayList<String> pilaSemantica;

    public PilaSemantica()
    {
        pilaSemantica = new ArrayList<>();
    }

    public void push_init(String valor)
    {
        pilaSemantica.add(valor);
    }

    public void push_end(String valor)
    {
        pilaSemantica.add(pilaSemantica.size(), valor);
    }

    public String pop_init() // saca el primero de la lista
    {
        String temp = null;
        try
        {
            temp = pilaSemantica.get(0);
            pilaSemantica.remove(0);
        }
        catch(IndexOutOfBoundsException e) { System.err.println("Error en la pila: pop_init()"); }

        return temp;
    }

    public String pop_end() // el pop típico que saca el último o el tope
    {
        String temp = null;
        try
        {
            temp = pilaSemantica.get(pilaSemantica.size() - 1);
            pilaSemantica.remove(pilaSemantica.size() - 1);
        }
        catch (IndexOutOfBoundsException e) { System.err.println("Error en la pila: pop_end()"); }

        return temp;
    }

    public Boolean isEmpty()
    {
        return pilaSemantica.isEmpty();
    }

    public void clear()
    {
        pilaSemantica.clear();
    }

    public int size()
    {
        return pilaSemantica.size();
    }

    public void print()
    {
        System.out.println("Pila semántica:\n");
        int size = pilaSemantica.size();
        for(int i = 0; i < size; i++)
        {
            System.out.println(pilaSemantica.get(i));
        }
    }

}