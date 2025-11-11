package jhonatan.Proyectos.Portfolio.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class Controladores {
	
	@GetMapping("/proyectos")
	public String proyectos(Model model) {
		return "proyectos";
	}
	
	@GetMapping("/informacion")
	public String informacion(Model model) {
		return "informacion";
	}
}