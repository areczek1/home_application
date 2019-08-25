package arek.inzynierka.mainController;

import arek.inzynierka.model.Group;
import arek.inzynierka.model.Task;
import arek.inzynierka.model.User;
import arek.inzynierka.repository.GroupRepository;
import arek.inzynierka.repository.TaskRepository;
import arek.inzynierka.repository.UserRepository;
import arek.inzynierka.user.UserService;
import arek.inzynierka.utilities.UserUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.ws.rs.ConstrainedTo;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Controller
public class ParentPageController {

    @Autowired
    UserService userService;
    @Autowired
    TaskRepository taskRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    GroupRepository groupRepository;

    @Autowired
    MessageSource messageSource;

    @POST
    @RequestMapping(value = "/addtask")
    @Secured(value = "ROLE_PARENT" )
    public String addTask(Model model)
    {
        Task task = new Task();
        model.addAttribute("task", task);
        return "addtask";
    }

    @POST
    @RequestMapping(value = "/addnewtask")
    @Secured(value = "ROLE_PARENT")
    public String addNewTask(Model model, Task task, Locale locale) {
        System.out.println(task.getDueDateText());
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        task.setDueDate(generateDueDate(task.getDueDateText()));
        task.setCreateDate(LocalDateTime.now());
        task.setState(0);
        Group group=user.getGroups().get(0);
        List<Task> tasks=group.getTaskList();
        tasks.add(task);
        taskRepository.save(task);
        groupRepository.save(group);
        model.addAttribute("message_task", messageSource.getMessage("addtask.success", null, locale));
        return "addtask";
    }

    public LocalDateTime generateDueDate(String dueDateText){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String day = dueDateText.substring(3,5);
        String month = dueDateText.substring(0,2);
        String year = dueDateText.substring(6,10);
        String hours = dueDateText.substring(11,13);
        String minutes = dueDateText.substring(14,16);
        String pora = dueDateText.substring(17,19);
        System.out.println(day);
        System.out.println(month);
        System.out.println(year);
        System.out.println(hours);
        System.out.println(minutes);
        System.out.println(pora);
        if(pora.equals("PM"))
        {
            hours = String.valueOf(Integer.parseInt(hours) +12);
        }
        String now = year+"-"+month+"-"+day+" "+hours+":"+minutes;
        LocalDateTime formatDateTime = LocalDateTime.parse(now, formatter);
        return formatDateTime;
    }

    @GET
    @RequestMapping(value = "/viewtask")
    public String viewTask(Model model) {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        if(user.getGroups().isEmpty())
        {
            model.addAttribute("tasksList",new ArrayList<Task>());
            return "viewtask";
        }
        model.addAttribute("tasksList",user.getGroups().get(0).getTaskList());
        return "viewtask";
    }

}
