public class Perro {
    // Atributos de la clase
    private String nombre;
    private int edad;

    // Constructor
    public Perro(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }

    // Métodos
    public void ladrar() {
        System.out.println("¡Guau! ¡Guau!");
    }

    public void correr() {
        System.out.println(nombre + " está corriendo.");
    }

    public void envejecer() {
        edad++;
    }

    public void mostrarInformacion() {
        System.out.println("Nombre: " + nombre);
        System.out.println("Edad: " + edad + " años");
    }

    // Método principal para probar la clase
    public static void main(String[] args) {
        Perro miPerro = new Perro("Rex", 3);
        miPerro.ladrar();
        miPerro.correr();
        miPerro.envejecer();
        miPerro.mostrarInformacion();
    }
}
