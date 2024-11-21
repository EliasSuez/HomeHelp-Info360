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
        ViewBag.user = Request.Cookies["UserId"];
        ViewBag.Trabajador = Utilities.Trabajador;
        Console.WriteLine($"Valor de la cookie UserId: {ViewBag.user ?? "nulo"}");
        Console.WriteLine($"Eres trabajador: {ViewBag.Trabajador ?? "nulo"}");
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

    [Route("/Home/SignUpUser")]
    public IActionResult SignUp()
    {
        // Agrega una nueva cookie
        Response.Cookies.Append("UserId", "123456", new CookieOptions
        {
            Expires = DateTime.Now.AddDays(1),  // Establece la expiración de la cookie
            HttpOnly = true,  // Solo accesible a través de HTTP
            Secure = false,    // Solo se enviará por HTTPS
        });

        // Obtiene el valor de la cookie
        string user = Request.Cookies["UserId"];

        // Muestra el valor de la cookie o un mensaje si no existe
        Console.WriteLine(user ?? " No hay usuario definido");
        return View("Index");
    }
    
    public IActionResult LogOut(){

        Response.Cookies.Delete("UserId");
        return RedirectToAction("Index");
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

    public class FileController : Controller
{
    private readonly string _uploadPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "uploads");

    public IActionResult Index()
    {
        return View();
    }

    [HttpPost]
    public async Task<IActionResult> Upload(IFormFile uploadedFile)
    {
        if (uploadedFile != null && uploadedFile.Length > 0)
        {
            // Asegúrate de que la carpeta de destino exista
            if (!Directory.Exists(_uploadPath))
            {
                Directory.CreateDirectory(_uploadPath);
            }

            // Guarda el archivo en la carpeta "uploads"
            var filePath = Path.Combine(_uploadPath, uploadedFile.FileName);
            using (var stream = new FileStream(filePath, FileMode.Create))
            {
                await uploadedFile.CopyToAsync(stream);
            }

            ViewBag.Message = "Archivo subido exitosamente: " + uploadedFile.FileName;
        }
        else
        {
            ViewBag.Message = "Por favor selecciona un archivo válido.";
        }

        return View("Index");
    }
}
}
