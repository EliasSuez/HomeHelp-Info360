using System.Data.SqlClient;
using Dapper;

public class BD
{
    private static List<Usuarios> _ListaUsuarios;
    private static List<Trabajadores> _ListaTrabajadores;
    
    private static List<Valoraciones> _ListaValoraciones;
    private static List<Clientes> _ListaClientes;

    private static string _connectionString = @"Server=DESKTOP-NLK60DB\SQLEXPRESS; DataBase=HOMEHELP;Trusted_Connection=True; ";

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
    string SQL = @"
        IF NOT EXISTS (SELECT ID_Usuario FROM Usuarios WHERE ID_Usuario = @pID_Usuario)
        BEGIN
            INSERT INTO Usuarios (DNI, Nombre, Apellido, Edad, ID_Valoracion, Trabajador, Email, Password, Foto)
            VALUES (@pDNI, @pNombre, @pApellido, @pEdad, @pID_Valoracion, @pTrabajador, @pEmail, @pPassword, @pFoto)
        END";
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        db.Execute(SQL, new
        {
            @pID_Usuario = user.ID_Usuario, 
            @pDNI = user.DNI,
            @pNombre = user.Nombre,
            @pApellido = user.Apellido,
            @pEdad = user.Edad,
            @pID_Valoracion = user.ID_Valoracion,
            @pTrabajador = user.Trabajador,
            @pEmail = user.Email,
            @pPassword = user.Password,
            @pFoto = user.Foto
        });
    }
}


    public static void AgregarTrabajador(Trabajadores tra)
{
    string SQL = @"
        IF NOT EXISTS (SELECT 1 FROM Usuarios WHERE ID_Usuario = @pID_User)
        BEGIN
            INSERT INTO Trabajadores (Matricula, ID_Especialidad, ID_User)
            VALUES (@pMatricula, @pID_Especialidad, @pID_User)
        END";
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        db.Execute(SQL, new
        {
            @pMatricula = tra.Matricula,
            @pID_Especialidad = 1,
            @pID_User = tra.ID_User  
        });
    }
}


    public static void AgregarCliente(Clientes clie)
{
    string SQL = @"
        IF NOT EXISTS (SELECT 1 FROM Usuarios WHERE ID_Usuario = @pID_user)
        BEGIN
            INSERT INTO Clientes (Direccion, ID_user)
            VALUES (@pDireccion, @pID_user)
        END";
    using (SqlConnection db = new SqlConnection(_connectionString))
    {
        db.Execute(SQL, new
        {
            @pDireccion = clie.Direccion,
            @pID_user = clie.ID_User  
        });
    }
}


    public static void AgregarValoraciones(Valoraciones valo)
    {
        string SQL = " INSERT INTO Valoraciones (Puntuacion, Comentario, Desea_Recomendarlo, Calificacion)VALUES (@pPuntuacion, @pComentario, @pDesea_Recomendarlo, @pCalificacion) ";
        using (SqlConnection db = new SqlConnection(_connectionString))
        {
            db.Execute(SQL, new { @pPuntuacion = valo.Puntuacion, @pComentario = valo.Comentario, @pDesea_Recomendarlo = valo.Desea_Recomendarlo, @pCalificacion = valo.Calificacion });
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