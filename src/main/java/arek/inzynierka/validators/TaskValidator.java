package arek.inzynierka.validators;

import arek.inzynierka.model.Task;
import arek.inzynierka.model.User;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class TaskValidator implements Validator {
    @Override
    public boolean supports(Class<?> cls) {
        return Task.class.equals(cls);
    }

    @Override
    public void validate(Object obj, Errors errors) {
        Task task = (Task) obj;

        ValidationUtils.rejectIfEmpty(errors, "name", "error.taskname.empty");
        ValidationUtils.rejectIfEmpty(errors, "description", "error.description.empty");
        ValidationUtils.rejectIfEmpty(errors, "comment", "error.comment.empty");
        ValidationUtils.rejectIfEmpty(errors, "countYang", "error.countYang.empty");
    }
}