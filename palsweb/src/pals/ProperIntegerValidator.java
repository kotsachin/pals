package pals;

//import java.util.regex.Matcher;
//import java.util.regex.Pattern;

import org.apache.log4j.Logger;

import com.opensymphony.xwork2.validator.ValidationException;
import com.opensymphony.xwork2.validator.validators.FieldValidatorSupport;

/***
 * Correcting a bug in Struts 2 where doubles are not validated correctly.
 */

public class ProperIntegerValidator extends FieldValidatorSupport {

    private static final Logger log = Logger.getLogger(ProperIntegerValidator.class);
	
	private String minInclusive;
	private String maxInclusive;
	
	public String getMinInclusive() {
		return minInclusive;
	}

	public void setMinInclusive(String minValue) {
		this.minInclusive = minValue;
	}

	public String getMaxInclusive() {
		return maxInclusive;
	}

	public void setMaxInclusive(String maxValue) {
		this.maxInclusive = maxValue;
	}
	
	
	public void validate(Object object) throws ValidationException {
		
		String fieldName = getFieldName();
		
		String fieldStringValue;
		try {
			fieldStringValue = (String) getFieldValue(fieldName, object);
			if( fieldStringValue != null && fieldStringValue.length() > 0 )
			{
                log.debug("Validating: " + fieldStringValue);
			    Integer fieldIntegerValue = Integer.valueOf(fieldStringValue);
			    if (getMinInclusive() != null && Integer.valueOf(getMinInclusive()) > fieldIntegerValue 
			        || getMaxInclusive() != null && Integer.valueOf(getMaxInclusive()) < fieldIntegerValue) 
				    addFieldError(fieldName, object);
			}
		} catch (NumberFormatException e) {
			addFieldError (fieldName, object);
		}
		
	}

	
	

}
