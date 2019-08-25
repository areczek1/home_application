package arek.inzynierka.mainController;

import arek.inzynierka.model.Group;
import arek.inzynierka.model.Task;
import arek.inzynierka.model.User;
import arek.inzynierka.repository.GroupRepository;
import arek.inzynierka.repository.TaskRepository;
import arek.inzynierka.repository.UserRepository;
import arek.inzynierka.service.TaskService;
import arek.inzynierka.user.UserService;
import arek.inzynierka.utilities.UserUtilities;
import arek.inzynierka.validators.TaskValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;


@Controller
public class TaskPageController {

    @Autowired
    UserService userService;

    @Autowired
    TaskRepository taskRepository;

    @Autowired
    GroupRepository groupRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    private TaskService taskService;

    @Autowired
    MessageSource messageSource;

    private static int ELEMENTS = 4;

    @PUT
    @RequestMapping(value = "/doit/{numberid}")
    @Secured(value = { "ROLE_PARENT", "ROLE_USER"})
    public String taskDoIt(@PathVariable("numberid") int numberId, Model model) {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        Task task2= taskRepository.findById(numberId);
        if(task2.getState()==0)
        {
            task2.setState(1);
            task2.setUserId(user.getId());
        }
        taskRepository.save(task2);
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
        List<Task> taskInProgress = group.getTaskList().stream().filter(task -> task.getState()==1).collect(Collectors.toList());
        List<Task> taskDone = group.getTaskList().stream().filter(task -> task.getState()==2).collect(Collectors.toList());
        if(user.getRoles().get(0).getRole().equals("ROLE_PARENT")) {
        }
        else {
            taskInProgress=taskInProgress.stream().filter(task -> task.getUserId()==user.getId()).collect(Collectors.toList());
            taskDone=taskDone.stream().filter(task -> task.getUserId()==user.getId()).collect(Collectors.toList());
        }
        Task firstTask=taskService.createFirstTask(taskToDo,taskInProgress,taskDone);
        model.addAttribute("firstTask",firstTask);
        model.addAttribute("taskToDo", taskToDo);
        model.addAttribute("taskInProgress", taskInProgress);
        model.addAttribute("taskDone", taskDone);
        model.addAttribute("licznik", 0);
        return "index";
    }
    @PUT
    @RequestMapping(value = "/done/{numberid}")
    @Secured(value = { "ROLE_PARENT", "ROLE_USER"})
    public String taskDone(@PathVariable("numberid") int numberId, Model model) {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        Task task2= taskRepository.findById(numberId);
        if(task2.getState()==1)
        {
            task2.setState(2);
            User taskUser=userRepository.findById(task2.getUserId());
            taskUser.setPoints(taskUser.getPoints()+task2.getCountYang());
            userRepository.save(taskUser);
        }
        taskRepository.save(task2);
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
        List<Task> taskInProgress = group.getTaskList().stream().filter(task -> task.getState()==1).collect(Collectors.toList());
        List<Task> taskDone = group.getTaskList().stream().filter(task -> task.getState()==2).collect(Collectors.toList());
        if(user.getRoles().get(0).getRole().equals("ROLE_PARENT")) {
        }
        else {
            taskInProgress=taskInProgress.stream().filter(task -> task.getUserId()==user.getId()).collect(Collectors.toList());
            taskDone=taskDone.stream().filter(task -> task.getUserId()==user.getId()).collect(Collectors.toList());
        }
        Task firstTask=taskService.createFirstTask(taskToDo,taskInProgress,taskDone);
        model.addAttribute("firstTask",firstTask);
        model.addAttribute("taskToDo", taskToDo);
        model.addAttribute("taskInProgress", taskInProgress);
        model.addAttribute("taskDone", taskDone);
        model.addAttribute("licznik", 0);
        return "index";
    }
    @DELETE
    @Secured(value = { "ROLE_PARENT", "ROLE_USER"})
    @RequestMapping(value = "/deleted/{numberid}")
    public String deleteTask(@PathVariable("numberid") int numberId, Model model) {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        Task task2 = taskRepository.findById(numberId);
        taskRepository.delete(task2);
        model.addAttribute("user", user);

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
        List<Task> taskInProgress = group.getTaskList().stream().filter(task -> task.getState()==1).collect(Collectors.toList());
        List<Task> taskDone = group.getTaskList().stream().filter(task -> task.getState()==2).collect(Collectors.toList());
        if(user.getRoles().get(0).getRole().equals("ROLE_PARENT")) {
        }
        else {
            taskInProgress=taskInProgress.stream().filter(task -> task.getUserId()==user.getId()).collect(Collectors.toList());
            taskDone=taskDone.stream().filter(task -> task.getUserId()==user.getId()).collect(Collectors.toList());
        }
        model.addAttribute("taskToDo", taskToDo);
        model.addAttribute("taskInProgress", taskInProgress);
        model.addAttribute("taskDone", taskDone);
        model.addAttribute("licznik", 0);
        return "index";
    }
    @GET
    @RequestMapping(value = "/edittask/{numberid}")
    @Secured(value ="ROLE_PARENT")
    public String changeTask(@PathVariable("numberid") int numberId, Model model) {

        Task task = taskRepository.findById(numberId);
        task.setDueDateText(generateDateText(task.getDueDate()));
        model.addAttribute("task", task);

        return "edittask";
    }

    public String generateDateText(LocalDateTime dateTime)
    {
        String dataText = new String();
        //09/30/2019 12:00 AM
        String day = Integer.toString(dateTime.getDayOfMonth());
        String month = Integer.toString(dateTime.getMonthValue());
        String year = Integer.toString(dateTime.getYear());
        String hour = Integer.toString(dateTime.getHour());
        String minutes = Integer.toString(dateTime.getMinute());
        String pora = new String();
        if(dateTime.getHour()>12)
        {
            pora="PM";
        }
        else
        {
            pora="AM";
        }
        dataText = month+"/"+day+"/"+year+" "+hour+":"+minutes+" "+pora;
        return dataText;
    }
    @PUT
    @RequestMapping(value = "/updatetask/{id}")
    @Secured(value ="ROLE_PARENT")
    public String changeTaskAction(@PathVariable("id") int id,Task task, BindingResult result, Model model, Locale locale) {
        String returnPage = null;
        new TaskValidator().validate(task, result);
        System.out.println(task.getId()+"jaaasdasdad");
        Task editTask =taskRepository.findById(id);
        editTask.setComment(task.getComment());
        editTask.setCountYang(task.getCountYang());
        editTask.setName(task.getName());
        editTask.setDescription(task.getDescription());;
        if (result.hasErrors()) {
            System.out.println(task.getId()+"jaaasdasdad");
        } else {
            editTask.setDueDate(generateDueDate(task.getDueDateText()));
            taskRepository.save(editTask);
            model.addAttribute("message_edittask", messageSource.getMessage("editTask.success", null, locale));
        }
        editTask.setDueDateText(generateDateText(task.getDueDate()));
        model.addAttribute("task",editTask);
        return "edittask";
    }

    public LocalDateTime generateDueDate(String dueDateText){
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        String day = dueDateText.substring(3,5);
        String month = dueDateText.substring(0,2);
        String year = dueDateText.substring(6,10);
        String hours = dueDateText.substring(11,13);
        String minutes = dueDateText.substring(14,16);
        String pora = dueDateText.substring(17,19);
        if(pora.equals("PM"))
        {
            hours = String.valueOf(Integer.parseInt(hours) +12);
        }
        String now = year+"-"+month+"-"+day+" "+hours+":"+minutes;
        LocalDateTime formatDateTime = LocalDateTime.parse(now, formatter);
        return formatDateTime;
    }
}
