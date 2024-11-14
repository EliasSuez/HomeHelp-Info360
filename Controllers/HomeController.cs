using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using HomeHelp.Models;

namespace HomeHelp.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }
    
    public IActionResult PoliticaPrivacidad()
    {
        return View();
    }

    public IActionResult Login()
    {
        return View();
    }

    [HttpPost]
    public IActionResult AgregarUsuario(int dni, string nombre, string apellido, string email, string password, DateTime fecha, string ? matricula, string ? Direccion)
    {
        Usuarios nuevoUsuario = Utilities.CrearUsuario(dni, nombre, apellido, email, password, fecha, Utilities.Trabajador);
        if(nuevoUsuario.Trabajador)
        {
            Utilities.CrearTrabajador(matricula);
        }
        else{
            Utilities.CrearCliente(Direccion);
        }
        return RedirectToAction("SignUp");
    }
    public IActionResult Register(bool Trabajador)
    {
        Utilities.Trabajador = Trabajador;
        if(Utilities.Trabajador){
            return View("RegisterTrabajador");
        }
        else{
            return View("RegisterCliente");
        }
    }

    [Route("/Home/SignUp")]
    public IActionResult SignUp()
    {
        // Elimina la cookie si ya existe
        Response.Cookies.Delete("UserId");

        // Agrega una nueva cookie
        Response.Cookies.Append("UserId", "123456", new CookieOptions
        {
            Expires = DateTime.Now.AddDays(1),  // Establece la expiración de la cookie
            HttpOnly = true,  // Solo accesible a través de HTTP
            Secure = true,    // Solo se enviará por HTTPS
        });

        // Obtiene el valor de la cookie
        string user = Request.Cookies["UserId"];

        // Muestra el valor de la cookie o un mensaje si no existe
        Console.WriteLine(user ?? " No hay usuario definido");

        return View("Index");
    }


    public IActionResult Crearcuenta()
    {
        return View();
    }

    public IActionResult RegisterCliente()
    {
        return View();
    }
    public IActionResult RegisterTrabajador()
    {
        return View();
    }

    public IActionResult Tips()
    {
        return View();
    }
    public IActionResult Servicios()
    {
        return View();
    }

    public IActionResult SubirServicio()
    {
        return View();
    }
}
