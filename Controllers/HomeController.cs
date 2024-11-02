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

    public IActionResult Login(string email, string password)
    {
        if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(password))
        {
            ModelState.AddModelError("LoginError", "El email y la contraseña son obligatorios.");
            return View("Login");
        }

        Usuarios usuario = BD.ObtenerUsuarios().FirstOrDefault(u => u.Email == email && u.Password == password);
        if (usuario == null)
        {
            ModelState.AddModelError("LoginError", "Email o contraseña incorrectos.");
            return View("Login");
        }

        HttpContext.Session.SetString("UserId", usuario.DNI.ToString());
        return RedirectToAction("Index", "Home");
    }

    [HttpPost]
    public IActionResult Register(int dni, string nombre, string apellido, string email, string password, string direccion, DateTime fecha)
    {
        if (dni <= 0)
        {
            ModelState.AddModelError("DNI", "El DNI no es válido.");
        }
        if (string.IsNullOrWhiteSpace(nombre))
        {
            ModelState.AddModelError("Nombre", "El nombre es obligatorio.");
        }
        if (string.IsNullOrWhiteSpace(apellido))
        {
            ModelState.AddModelError("Apellido", "El apellido es obligatorio.");
        }
        if (!IsValidEmail(email))
        {
            ModelState.AddModelError("Email", "El email no es válido.");
        }
        if (password.Length < 6)
        {
            ModelState.AddModelError("Password", "La contraseña debe tener al menos 6 caracteres.");
        }
        if (fecha > DateTime.Now)
        {
            ModelState.AddModelError("FechaNacimiento", "La fecha de nacimiento no puede ser en el futuro.");
        }

        if (!ModelState.IsValid)
        {
            return View("Register");
        }

        Usuarios nuevoUsuario = Utilities.CrearUsuario(dni, nombre, apellido, email, password, direccion, fecha);
        return RedirectToAction("Index");
    }

    private bool IsValidEmail(string email)
    {
        try
        {
            var addr = new System.Net.Mail.MailAddress(email);
            return addr.Address == email;
        }
        catch
        {
            return false;
        }
    }


    public IActionResult Crearcuenta()
    {
        return View();
    }


}
