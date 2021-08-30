package ClientManagement.Controller;

import java.text.ParseException;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import ClientManagement.Service.HomeService;

@Component
public class BaseController {

	protected ModelAndView mvShare;

	@Autowired
	HomeService homeService;

	@PostConstruct
	public void init() {
		this.mvShare = new ModelAndView();
		try {
			this.mvShare.addObject("countries", homeService.getAllCountries());
			this.mvShare.addObject("maritals", homeService.getAllMaritalStatus());
			this.mvShare.addObject("genders", homeService.getAllGenders());
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
