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
    public IActionResult AgregarCliente(int dni, string nombre, string apellido, string email, string password, string direccion, DateTime fecha)
    {
        Usuarios nuevoUsuario = Utilities.CrearUsuario(dni, nombre, apellido, email, password, direccion, fecha);
        return RedirectToAction("Index");
    }

    [Route("/Home/SingUp")]
    public IActionResult SignUp()
    {
        Response.Cookies.Delete("UserId");
        Response.Cookies.Append("UserId", "123456");
        string user = Request.Cookies["UserId"];

        Console.WriteLine(user ?? " No hay usuariodefinido");
        return View();
    }

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
}
