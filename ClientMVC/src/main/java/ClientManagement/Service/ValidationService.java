package ClientManagement.Service;

import java.util.Date;

import org.springframework.stereotype.Service;

import ClientManagement.Util.ClientAddingValidation;
import ClientManagement.Util.DateValidation;

@Service
public class ValidationService {

	public static boolean isAbleToAdd(int isFutureDate, int isUsedId) {
		return ClientAddingValidation.isAbleToAdd(isUsedId, isFutureDate);
	}

	public static int isFutureDate(Date date) {
		return DateValidation.isFutureDate(date);
	}
}
