package ClientManagement.Dao;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import ClientManagement.Entity.Client;
import ClientManagement.Entity.Mapper.ClientMapper;

@Repository
public class ClientDao implements EntityDao<Client> {

	@Autowired
	public JdbcTemplate jdbcTemplate;

	public List<Client> getAll() {

		List<Client> clientList = new ArrayList<Client>();
		String sqlQuery = "select * from Client";

		clientList = jdbcTemplate.query(sqlQuery, new ClientMapper());
		return clientList;
	}

	public Client findClientById(String id) {

		List<Client> clientList = getAll();
		Client client = clientList.stream().filter(t -> id.equals(t.getClientID())).findFirst().orElse(null);

		return client;
	}

	public boolean isIDNumberValid(String id, Client clientModel) {

		List<Client> clientList = getAll();
		Client client = clientList.stream().filter(t -> clientModel.getIdentityNumber().equals(t.getIdentityNumber()))
				.findFirst().orElse(null);
		if (client == null || id.equals(client.getClientID())) {
			return true;
		}
		return false;
	}

	public int isIDNumberSaved(String idNumber) {

		List<Client> clientList = getAll();
		Client client = clientList.stream().filter(t -> idNumber.equals(t.getIdentityNumber())).findFirst()
				.orElse(null);

		return (client == null) ? 0 : 1;
	}

	public int addClient(Client client) throws ParseException {

		StringBuilder sqlQuery = new StringBuilder();
		sqlQuery.append("insert into client([first name], [last name], [gender_id], ");
		sqlQuery.append("[date of birth], [indentity number], [marital_id], [address], [country_id])");
		sqlQuery.append(" values( '");
		sqlQuery.append(client.getFirstName() + "', '");
		sqlQuery.append(client.getLastName() + "', ");
		sqlQuery.append(client.getGenderId() + ", '");
		sqlQuery.append(client.formatDate(client.getDateOfBirth()) + "', '");
		;
		sqlQuery.append(client.getIdentityNumber() + "', ");
		;
		sqlQuery.append(client.getMaritalId() + ", '");
		;
		sqlQuery.append(client.getAddress() + "', ");
		;
		sqlQuery.append(client.getCountryId() + ")");
		;

		return jdbcTemplate.update(sqlQuery.toString());
	}

	public void updateClient(String id, Client client) {

		StringBuilder sqlQuery = new StringBuilder();

		sqlQuery.append("update client ");
		sqlQuery.append("set [first name] = ?, [last name] = ?, [gender_id] = ?, [date of birth] = ?,");
		sqlQuery.append(" [indentity number] = ?, [marital_id] = ?, [address] = ?, [country_id] = ? ");
		sqlQuery.append("where [Client Number]=?");

		jdbcTemplate.update(sqlQuery.toString(), client.getFirstName(), client.getLastName(), client.getGenderId(),
				client.getDateOfBirth(), client.getIdentityNumber(), client.getMaritalId(), client.getAddress(),
				client.getCountryId(), id);
	}

}