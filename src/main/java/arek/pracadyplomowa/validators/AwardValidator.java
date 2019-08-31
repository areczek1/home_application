package arek.pracadyplomowa.validators;

import arek.pracadyplomowa.model.Awards;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;


public class AwardValidator implements Validator {
    @Override
    public boolean supports(Class<?> cls) {
        return Awards.class.equals(cls);
    }

    @Override
    public void validate(Object obj, Errors errors) {
        Awards award = (Awards) obj;

        ValidationUtils.rejectIfEmpty(errors, "name", "error.awardname.empty");
    }
}

