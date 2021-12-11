package in.rajatroy.formbasedauthenticationextended.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("")
public class HomeController {

	@GetMapping("home")
	public String getHome() {
		return "Welcome to Antmatcher Test Home!";
	}
	
}
