using System.Data;

public class Utilities
{
    public static Usuarios CrearUsuario(int dni, string nombre, string apellido, string email, string password,  DateTime fecha)
{
    int edad = CalcularEdad(fecha);

    Usuarios usuario = new Usuarios
    {
        DNI = dni,
        Nombre = nombre,
        Apellido = apellido,
        Edad = edad,
        Email = email,
        Password = password,
    };

    BD.AgregarUsuario(usuario);
    return usuario;
}

    public static int CalcularEdad(DateTime fechaNacimiento)
    {
    DateTime fechaActual = DateTime.Now;
    int edad = fechaActual.Year - fechaNacimiento.Year;

    if (fechaActual < fechaNacimiento.AddYears(edad))
    {
        edad--;
    }

    return edad;
    }

}