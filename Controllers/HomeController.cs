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
    public IActionResult AgregarUsuario(int dni, string nombre, string apellido, string email, string password, DateTime fecha, bool Trabajador, string ? matricula, string ? Direccion)
    {
        Usuarios nuevoUsuario = Utilities.CrearUsuario(dni, nombre, apellido, email, password, fecha, Trabajador);
        if(!nuevoUsuario.Trabajador)
        {
            Utilities.CrearTrabajador(matricula);
        }
        else{
            Utilities.CrearCliente(Direccion);
        }
        return RedirectToAction("Index");
    }


    // [Route("/Home/SingUp")]
    // public IActionResult SignUp()
    // {
    //     Response.Cookies.Delete("UserId");
    //     Response.Cookies.Append("UserId", "123456");
    //     string user = Request.Cookies["UserId"];

    //     Console.WriteLine(user ?? " No hay usuariodefinido");
    //     return View();
    // }

    public IActionResult Register()
    {
        return View();
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
