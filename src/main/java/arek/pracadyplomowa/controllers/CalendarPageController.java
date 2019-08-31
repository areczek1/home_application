package arek.pracadyplomowa.controllers;

import arek.pracadyplomowa.model.Group;
import arek.pracadyplomowa.model.Task;
import arek.pracadyplomowa.model.User;
import arek.pracadyplomowa.repository.GroupRepository;
import arek.pracadyplomowa.service.UserService;
import arek.pracadyplomowa.utilities.UserUtilities;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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
    @Qualifier("groupRepository")
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

        for (Task task:
            taskInProgress ) {
            task.setDay(task.getDueDate().getDayOfMonth());
            task.setMonth(task.getDueDate().getMonthValue()-1);
            task.setYear(task.getDueDate().getYear());
            task.setHour(task.getDueDate().getHour());
            task.setMinute(task.getDueDate().getMinute());
        }

        for (Task task:
                taskDone ) {
            task.setDay(task.getDueDate().getDayOfMonth());
            task.setMonth(task.getDueDate().getMonthValue()-1);
            task.setYear(task.getDueDate().getYear());
            task.setHour(task.getDueDate().getHour());
            task.setMinute(task.getDueDate().getMinute());
        }
        for (Task task:
                taskToDo ) {
            task.setDay(task.getDueDate().getDayOfMonth());
            task.setMonth(task.getDueDate().getMonthValue()-1);
            task.setYear(task.getDueDate().getYear());
            task.setHour(task.getDueDate().getHour());
            task.setMinute(task.getDueDate().getMinute());
        }
        System.out.println(taskInProgress.size());
        model.addAttribute("taskInProgress", taskInProgress);
        model.addAttribute("taskToDo", taskToDo);
        model.addAttribute("taskDone", taskDone);
        model.addAttribute("licznik", 0);

        return "calendar";
    }

}

