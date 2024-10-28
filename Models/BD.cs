using System.Data.SqlClient;
using Dapper;

public class BD
{
    private static List<Usuarios> _ListaUsuarios;
    private static List<Trabajadores> _ListaTrabajadores;
    private static List<Servicios> _ListaServicios;
    private static List<Valoraciones> _ListaValoraciones;
    private static string _connectionString = @"Server=localhost;
DataBase=HOMEHELP;Trusted_Connection=True;";

    public static List<Usuarios> ObtenerUsuarios()
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Usuarios";
            _ListaUsuarios = db.Query<Usuarios>(sql).ToList();
        }
        return _ListaUsuarios;
    }

    public static List<Trabajadores> ObtenerTrabajadores()
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Trabajadores";
            _ListaTrabajadores = db.Query<Trabajadores>(sql).ToList();
        }
        return _ListaTrabajadores;
    }

    public static List<Servicios> ObtenerServicios()
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Servicios";
            _ListaServicios = db.Query<Servicios>(sql).ToList();
        }
        return _ListaServicios;
    }

    public static List<Valoraciones> ObtenerValoraciones()
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Valoraciones";
            _ListaValoraciones = db.Query<Valoraciones>(sql).ToList();
        }
        return _ListaValoraciones;
    }
}