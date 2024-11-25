using System.Data;

public class Utilities
{
    public static bool Trabajador{get; set;}
    public static Usuarios CrearUsuario(int dni, string nombre, string apellido, string email, string password, DateTime fecha, bool Trabajador, int? IdValoracion)
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
            Trabajador = Trabajador,
            ID_Valoracion = IdValoracion
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


    public static Trabajadores CrearTrabajador(string Matricula, int ID_Usuario)
    {

        Trabajadores trabajador = new Trabajadores
        {
            Matricula = Matricula,
            ID_User = ID_Usuario
        };

        Console.WriteLine(ID_Usuario);
        Console.WriteLine("IdUser: " + trabajador.ID_User);

        BD.AgregarTrabajador(trabajador);
        return trabajador;
    }

    public static Clientes CrearCliente(string Direccion, int idUsuario)
    {

        Clientes cliente = new Clientes
        {
            Direccion = Direccion,
            ID_User = idUsuario
        };

        BD.AgregarCliente(cliente);
        return cliente;
    }

}