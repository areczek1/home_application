package arek.pracadyplomowa.administrator;

import arek.pracadyplomowa.model.User;
import arek.pracadyplomowa.service.AdminService;
import arek.pracadyplomowa.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

@Controller
public class AdminPageController {

    private static final Logger LOG = LoggerFactory.getLogger(AdminPageController.class);

    private static int ELEMENTS = 4;

    @Autowired
    MessageSource messageSource;

    @Autowired
    private UserService userService;

    @Autowired
    private AdminService adminService;

    @GET
    @RequestMapping(value = "/admin")
    @Secured(value = { "ROLE_ADMIN" })
    public String openAdminMainPage() {
        LOG.info("Administracja strona główna");
        return "admin/admin";
    }

    @GET
    @RequestMapping(value = "/admin/users/{page}")
    @Secured(value = { "ROLE_ADMIN" })
    public String openAdminAllUsersPage(@PathVariable("page") int page, Model model) {
        Page<User> pages = getAllUsersPageable(page - 1);
        int totalPages = pages.getTotalPages();
        int currentPage = pages.getNumber();
        List<User> userList = pages.getContent();
        model.addAttribute("totalPages", totalPages);
        model.addAttribute("currentPage", currentPage + 1);
        model.addAttribute("userList", userList);
        model.addAttribute("recordStartCounter", currentPage * ELEMENTS);
        return "admin/users";
    }

    @POST
    @RequestMapping(value = "/admin/updateuser/{id}")
    @Secured(value = "ROLE_ADMIN")
    public String updateUser(@PathVariable("id") int id, User user) {
        int nrRoli = user.getNrRoli();
        int czyActive = user.getActive();
        adminService.updateUser(id, nrRoli, czyActive);
        return "redirect:/admin/users/1";
    }
    @GET
    @RequestMapping(value = "/admin/users/edit/{id}")
    @Secured(value = { "ROLE_ADMIN" })
    public String getUserToEdit(@PathVariable("id") int id, Model model) {
        User user = new User();
        user = adminService.findUserById(id);

        Map<Integer, String> roleMap = new HashMap<Integer, String>();
        roleMap = prepareRoleMap();

        Map<Integer, String> activityMap = new HashMap<Integer, String>();
        activityMap = prepareActivityMap();

        int rola = user.getRoles().iterator().next().getId();
        user.setNrRoli(rola);

        model.addAttribute("roleMap", roleMap);
        model.addAttribute("activityMap", activityMap);
        model.addAttribute("user", user);
        return "admin/useredit";
    }

    private Page<User> getAllUsersPageable(int page) {
        Page<User> pages = adminService.findAll(PageRequest.of(page, ELEMENTS));
        for (User users : pages) {
            int numerRoli = users.getRoles().iterator().next().getId();
            users.setNrRoli(numerRoli);
        }
        return pages;
    }

    //przygotowanie  mapy ról
    public Map<Integer, String> prepareRoleMap() {
        Locale locale = Locale.getDefault();
        Map<Integer, String> roleMap = new HashMap<Integer, String>();
        roleMap.put(1, messageSource.getMessage("word.admin", null, locale));
        roleMap.put(2, messageSource.getMessage("word.user", null, locale));
        return roleMap;
    }

    // przygotowanie mapy aktywny/nieaktywny
    public Map<Integer, String> prepareActivityMap() {
        Locale locale = Locale.getDefault();
        Map<Integer, String> activityMap = new HashMap<Integer, String>();
        activityMap.put(0, messageSource.getMessage("word.nie", null, locale));
        activityMap.put(1, messageSource.getMessage("word.tak", null, locale));
        return activityMap;
    }
}