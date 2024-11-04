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
    public IActionResult AniadirUsuario(int dni, string nombre, string apellido, string email, string password, string direccion, DateTime fecha)
    {

        Usuarios nuevoUsuario = Utilities.CrearUsuario(dni, nombre, apellido, email, password, direccion, fecha);
        return RedirectToAction("Index");
    }
    public IActionResult Register()
    {
        return View();
    }


}
