package arek.inzynierka.mainController;

import arek.inzynierka.model.Group;
import arek.inzynierka.model.Task;
import arek.inzynierka.model.User;
import arek.inzynierka.repository.GroupRepository;
import arek.inzynierka.user.UserService;
import arek.inzynierka.utilities.UserUtilities;
import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.ws.rs.POST;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class CalendarPageController {

    @Autowired
    UserService userService;
    @Autowired
    GroupRepository groupRepository;
    @POST
    @RequestMapping(value = "/calendar")
    @Secured(value ={ "ROLE_PARENT", "ROLE_USER"})
    public String addAward(Model model) {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        model.addAttribute("user",user);
        if(user.getGroups().isEmpty())
        {
            List<Task> taskToDo = new ArrayList<>();
            List<Task> taskInProgress = new ArrayList<>();
            List<Task> taskDone = new ArrayList<>();
            model.addAttribute("taskToDo", taskToDo);
            model.addAttribute("taskInProgress", taskInProgress);
            model.addAttribute("taskDone", taskDone);
            model.addAttribute("licznik", 0);
            return "index";
        }
        Group group =groupRepository.findById(user.getGroups().get(0).getId());
        List<Task> taskToDo = group.getTaskList().stream().filter(task -> task.getState()==0).collect(Collectors.toList());
        List<Task> taskInProgress = group.getTaskList().stream().filter(task -> task.getState() == 1).collect(Collectors.toList());
        List<Task> taskDone = group.getTaskList().stream().filter(task -> task.getState()==2).collect(Collectors.toList());
        if(user.getRoles().get(0).getRole().equals("ROLE_PARENT")) {
        }
        else {
            taskInProgress=taskInProgress.stream().filter(task -> task.getUserId()==user.getId()).collect(Collectors.toList());
            taskDone=taskDone.stream().filter(task -> task.getUserId()==user.getId()).collect(Collectors.toList());
        }

        List <String> taskc=taskInProgress.stream().map(task -> task.getName()).collect(Collectors.toList());
        for (Task task:
            taskInProgress ) {
            task.setDay(task.getDueDate().getDayOfMonth());
            task.setMonth(task.getDueDate().getMonthValue()-1);
            task.setYear(task.getDueDate().getYear());
        }
        System.out.println(taskInProgress.size());
        model.addAttribute("taskInProgress", taskInProgress);
        model.addAttribute("taskToDo", taskToDo);
        model.addAttribute("taskDone", taskDone);
        model.addAttribute("licznik", 0);

        return "calendar";
    }

}

