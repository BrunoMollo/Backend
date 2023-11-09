public class Perro {
    private String nombre;
    private int edad;
    public Perro(String nombre, int edad) {
        this.nombre = nombre;
        this.edad = edad;
    }
    public void ladrar() {
        System.out.println("¡Guau! ¡Guau!");
    }
    public void correr() {
        System.out.println(nombre + " está corriendo.");
    }
    public void envejecer() {
        edad++;
    }
}
