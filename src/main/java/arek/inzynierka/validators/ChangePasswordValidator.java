package arek.inzynierka.validators;

import arek.inzynierka.constans.ApplicationConstans;
import arek.inzynierka.user.User;
import arek.inzynierka.utilities.ApplicationUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class ChangePasswordValidator implements Validator {

    @Override
    public boolean supports(Class<?> cls) {
        return User.class.equals(cls);
    }

    @Override
    public void validate(Object obj, Errors errors) {

        @SuppressWarnings("unused")
        User user = (User) obj;

        ValidationUtils.rejectIfEmpty(errors, "newPassword", "error.userPassword.empty");

    }

    public void checkPasswords(String newPass, Errors errors) {

        if (!newPass.equals(null)) {
            boolean isMatch = ApplicationUtils.checkEmailOrPassword(ApplicationConstans.passwordPattern, newPass);
            if(!isMatch) {
                errors.rejectValue("newPassword", "error.userPasswordIsNotMatch");
            }
        }
    }
}