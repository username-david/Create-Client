package ClientManagement.Controller;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ClientManagement.Dto.ClientDto;
import ClientManagement.Entity.Client;
import ClientManagement.Service.ClientService;
import ClientManagement.Service.ValidationService;

@Controller
@Scope("session")
public class ClientController extends BaseController {

	@Autowired
	ClientService clientService;
	@Autowired
	ClientDto clientDto;

	// For adding a new client
	@RequestMapping(value = { "/addClientRequest" }, method = RequestMethod.GET)
	public ModelAndView addClient() {

		mvShare.addObject("client", new Client());
		mvShare.addObject("count", -1);
		mvShare.addObject("isFututeDate", 0);
		mvShare.addObject("isUsedID", 0);
		mvShare.addObject("formType", new String("adding"));
		mvShare.setViewName("/client/clientAddingForm");
		return mvShare;
	}

	@RequestMapping(value = "/addClientRequest", method = RequestMethod.POST)
	public ModelAndView addClientExecute(@ModelAttribute Client client) throws ParseException {

		int count = 0;
		int isUsedID = clientService.isIDNumberSaved(client.getIdentityNumber());
		int isFutureDate = ValidationService.isFutureDate(client.getDateOfBirth());

		if (ValidationService.isAbleToAdd(isFutureDate, isUsedID) == true) {
			count = clientService.addClient(client);
		}
		mvShare.addObject("count", count);
		mvShare.addObject("isFututeDate", isFutureDate);
		mvShare.addObject("isUsedID", isUsedID);

		mvShare.setViewName("/client/clientAddingForm");
		return mvShare;
	}

	// For modifying an existed client
	@RequestMapping(value = { "/modifyClientRequest", "/modifyClientExecute" }, method = RequestMethod.GET)
	public ModelAndView modifyClientGet() throws ParseException {

		mvShare.addObject("client", new Client());
		mvShare.addObject("formType", new String("modifying"));
		mvShare.addObject("success", "");
		mvShare.setViewName("/client/clientModifyingForm");
		return mvShare;
	}

	@RequestMapping(value = "/modifyClientRequest", method = RequestMethod.POST)
	public ModelAndView modifyClient(@RequestParam("") String clientId) throws ParseException {

		boolean isIDNumberValid = true;
		Client client = clientService.findClientById(clientId);
		mvShare.addObject("client", client);
		mvShare.addObject("clientId", clientId);
		mvShare.addObject("isIDNumberValid", isIDNumberValid);
		mvShare.setViewName("/client/clientModifyingForm");

		return mvShare;
	}

	@RequestMapping(value = "/modifyClientExecute", method = RequestMethod.POST)
	public ModelAndView modifyClientExecute(@RequestParam("") String clientId, @ModelAttribute Client client)
			throws ParseException {

		int isFutureDate = ValidationService.isFutureDate(client.getDateOfBirth());
		boolean isIDNumberValid = clientService.isIDNumberValid(clientId, client);
		if (isFutureDate != 1 && isIDNumberValid == true) {
			clientService.updateClient(clientId, client);
			mvShare.addObject("success", "Client modified successfully!");
			mvShare.addObject("clientId", clientId);
			mvShare.addObject("client", client);
		} else {
			mvShare.addObject("success", null);
		}
		mvShare.addObject("isFututeDate", isFutureDate);
		mvShare.addObject("isIDNumberValid", isIDNumberValid);

		return mvShare;
	}

	// For inquiring a client
	@RequestMapping(value = { "/inquireClientRequest" }, method = RequestMethod.GET)
	public ModelAndView inquireClient() {

		mvShare.addObject("clientId", null);
		mvShare.setViewName("/client/inquiryForm");
		return mvShare;
	}

	@RequestMapping(value = "/inquireClientRequest", method = RequestMethod.POST)
	public ModelAndView inquireClient(@RequestParam("") String clientId) {

		Client client = clientService.findClientById(clientId);
		mvShare.addObject("clientId", clientId);
		if (client != null) {
			clientDto = clientService.castToClientDto(client);
		} else {
			clientDto = null;
		}
		mvShare.addObject("clientDto", clientDto);
		mvShare.setViewName("/client/inquiryForm");
		return mvShare;
	}

}
