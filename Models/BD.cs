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

     public static void AgregarUsuario(Usuarios user)
    {
        string SQL = " IF NOT EXIST (SELECT DNI FROM Usuarios WHERE DNI = @pDNI) BEGIN {INSERT INTO Usuarios( DNI, Nombre, Apellido, Direccion, Edad, Calificacion, Trabajador, Descripcion, ID_Visitante) VALUES (@pDNI, @pNombre,@pApellido, @pDireccion, @pEdad, @pCalificacion, @pTrabajador, @pEmail, @pPassword )} END";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {    
            db.Execute(SQL, new {pDNI = user.DNI, pNombre = user.Nombre ,pApellido = user.Apellido, pDireccion = user.Direccion, pEdad = user.Edad, pCalificacion = user.Calificacion, pTrabajador = user.Trabajador, pEmail = user.Email, pPassword = user.Password});
        } 
        
    } 
    public static void AgregarTrabajador(Trabajadores tra)
    { 
        
        string SQL = "IF NOT EXISTS (SELECT 1 FROM Usuarios WHERE DNI = @pDNI) BEGIN { INSERT INTO Trabajadores (Matricula, Especialidad, DNI)VALUES (@pMatricula, @pEspecialidad, @pDNI) } ; END"; 
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(SQL, new {pDNI = tra.DNI, pMatricula = tra.Matricula ,pEspecialidad = tra.Especialidad} );
        } 
        
    } 


    public static int ObtenerUltimoNumeroUsuario()
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT ISNULL(MAX(Numberuser), 0) FROM Usuarios";
            return db.ExecuteScalar<int>(sql);
        }
    }

}