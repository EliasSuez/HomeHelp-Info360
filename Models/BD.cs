using System.Data.SqlClient;
using Dapper;

public class BD
{
    private static List<Usuarios> _ListaUsuarios;
    private static List<Trabajadores> _ListaTrabajadores;
    private static List<Servicios> _ListaServicios;
    private static List<Valoraciones> _ListaValoraciones;  
    private static List<Clientes> _ListaClientes; 

    private static string _connectionString = @"Server=localhost;DataBase=HOMEHELP;Trusted_Connection=True;";

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
     public static List<Clientes> ObtenerClientes()
    {
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            string sql = "SELECT * FROM Clientes";
            _ListaClientes = db.Query<Clientes>(sql).ToList();
        }
        return _ListaClientes;
    }

     public static void AgregarUsuario(Usuarios user)
    {
        string SQL = " IF NOT EXIST (SELECT ID_Usuario FROM Usuarios WHERE ID_Usuario = @pID_Usuario) BEGIN {INSERT INTO Usuarios( DNI, Nombre, Apellido, Edad, ID_Valoracion, Trabajador, Email, Password, Foto, Descripcion) VALUES (@pDNI, @pNombre,@pApellido, @pEdad, @pID_Valoracion, @pTrabajador, @pEmail, @pPassword, @pFoto, @pDescripcion )} END";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {    
            db.Execute(SQL, new {pDNI = user.DNI, pNombre = user.Nombre ,pApellido = user.Apellido, pEdad = user.Edad, pID_Valoracion = user.ID_Valoracion, pTrabajador = user.Trabajador, pEmail = user.Email, pPassword = user.Password, pFoto = user.Foto, pDescripcion = user.Descripcion});
        } 
        
    } 
    public static void AgregarTrabajador(Trabajadores tra)
    { 
        
        string SQL = "IF NOT EXISTS (SELECT 1 FROM Usuarios WHERE ID_User = @pID_User) BEGIN { INSERT INTO Trabajadores (Matricula, ID_Especialidad, ID_User)VALUES (@pMatricula, @pEspecialidad, @pID_user) } ; END"; 
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(SQL, new {pMatricula = tra.Matricula ,pID_Especialidad = tra.ID_Especialidad, pID_User = tra.ID_User} );
        } 
    }  

    public static void AgregarValoraciones(Clientes clie)
    { 
        
        string SQL = " INSERT INTO Valoraciones (Puntuacion, Comentario, Desea_Recomendarlo, Calificacion)VALUES (@pPuntuacion, @pComentario, @pDesea_Recomendarlo, @pCalificacion) "; 
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(SQL, new {/* */} );
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