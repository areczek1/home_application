package arek.pracadyplomowa.controllers;

import arek.pracadyplomowa.model.*;
import arek.pracadyplomowa.repository.*;
import arek.pracadyplomowa.service.UserService;
import arek.pracadyplomowa.model.User;
import arek.pracadyplomowa.utilities.UserUtilities;
import arek.pracadyplomowa.validators.AwardValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.MessageSource;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Controller
public class AwardPageController {

    @Autowired
    UserService userService;

    @Autowired
    @Qualifier("awardRepository")
    AwardRepository awardRepository;

    @Autowired
    @Qualifier("userRepository")
    UserRepository userRepository;

    @Autowired
    MessageSource messageSource;

    @Autowired
    @Qualifier("groupRepository")
    GroupRepository groupRepository;

    @Autowired
    @Qualifier("taskRepository")
    TaskRepository taskRepository;

    @Autowired
    @Qualifier("chosenAwardRepository")
    ChosenAwardRepository chosenAwardRepository;


    @POST
    @RequestMapping(value = "/addaward")
    @Secured(value = "ROLE_PARENT")
    public String addAward(Model model) {
        Awards award = new Awards();
        model.addAttribute("award", award);
        return "addaward";
    }

    @POST
    @RequestMapping(value = "/addnewaward")
    @Secured(value = "ROLE_PARENT")
    public String addNewAward(Model model, Awards award, Locale locale) {

        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        Group group=user.getGroups().get(0);
        List<Awards> awards=group.getAwards();
        awards.add(award);
        group.setAwards(awards);
        groupRepository.save(group);
        awardRepository.save(award);
        model.addAttribute("message_award", messageSource.getMessage("addaward.success", null, locale));
        return "addaward";
    }



    @GET
    @RequestMapping(value = "/viewaward")
    @Secured(value = { "ROLE_PARENT", "ROLE_USER"})
    public String viewAward(Model model)
    {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        if(user.getGroups().isEmpty())
        {
            model.addAttribute("awardsList",new ArrayList<Awards>());
            return "viewaward";
        }
        model.addAttribute("awardsList",user.getGroups().get(0).getAwards());
        model.addAttribute("points",user.getPoints());
        return "viewaward";
    }


    @GET
    @RequestMapping(value = "/chosenaward")
    @Secured(value = "ROLE_PARENT")
    public String chosenAward( Model model) {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
       List<ChosenAward> chosenAwards =chosenAwardRepository.findAllByParentId(user.getId());
        for (ChosenAward chosenAward:
             chosenAwards) {
            Awards awards=awardRepository.findById(chosenAward.getAwardId());
            chosenAward.setPath(awards.getPath());
            User userWhoChoice=userRepository.findById(chosenAward.getUserId());
            chosenAward.setUserName(userWhoChoice.getName());
        }
       model.addAttribute("chosenAwards", chosenAwards);
        return "chosenaward";
    }

    @GET
    @RequestMapping(value = "/mychosenaward")
    @Secured(value = "ROLE_USER")
    public String myChosenAward( Model model) {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        List<ChosenAward> chosenAwards =chosenAwardRepository.findAllByUserId(user.getId());
        for (ChosenAward chosenAward:
                chosenAwards) {
            Awards awards=awardRepository.findById(chosenAward.getAwardId());
            chosenAward.setPath(awards.getPath());
            User userWhoChoice=userRepository.findById(chosenAward.getUserId());
            chosenAward.setUserName(userWhoChoice.getName());
        }
        model.addAttribute("chosenAwards", chosenAwards);
        return "chosenaward";
    }

    @POST
    @RequestMapping(value = "/choiceaward/{id}")
    @Secured(value = "ROLE_USER")
    public String choiceAward(@PathVariable("id") int id, Model model) {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        Awards awards=awardRepository.findById(id);
        if(user.getPoints()> awards.getCount())
        {
            user.setPoints(user.getPoints() - awards.getCount());
            ChosenAward chosenAward = new ChosenAward();
            chosenAward.setGroupId(user.getGroups().get(0).getId());
            chosenAward.setParentId(user.getGroups().get(0).getGroupAdmin());
            chosenAward.setUserId(user.getId());
            chosenAward.setAwardId(awards.getId());
            chosenAwardRepository.save(chosenAward);
            userRepository.save(user);
            model.addAttribute("message", "Gratuluje wybrania nagrody "+awards.getName());
        }
        else {

            model.addAttribute("message", "Nie masz wystarczająco punktów");
        }
        if(user.getGroups().isEmpty())
        {
            model.addAttribute("awardsList",new ArrayList<Awards>());
            return "viewaward";
        }
        model.addAttribute("awardsList",user.getGroups().get(0).getAwards());
        model.addAttribute("points",user.getPoints());

        return "viewaward";

    }

    @POST
    @RequestMapping(value = "/deletechosenawards/{id}")
    @Secured(value = "ROLE_PARENT")
    public String deleteChosenAwards(@PathVariable("id") int id, Model model) {

        ChosenAward chosenAward = chosenAwardRepository.findById(id);
        chosenAwardRepository.delete(chosenAward);
        model.addAttribute("message", "Nagroda zrealizowana!");

        return "viewaward";

    }
    @GET
    @RequestMapping(value = "/editaward/{numberid}")
    @Secured(value ="ROLE_PARENT")
    public String changeAward(@PathVariable("numberid") int numberId, Model model) {

        Awards awards = awardRepository.findById(numberId);
        model.addAttribute("awards", awards);

        return "editaward";
    }
    @PUT
    @RequestMapping(value = "/updateaward/{numberid}")
    @Secured(value ="ROLE_PARENT")
    public String changeAwardAction(@PathVariable("numberid") int numberid, Awards awards, BindingResult result, Model model, Locale locale) {
        Awards awards1=awardRepository.findById(numberid);
        awards1.setPath(awards.getPath());
        awards1.setName(awards.getName());
        awards1.setCount(awards.getCount());

        model.addAttribute("awards", awards1);
      //  new AwardValidator().validate(awards1, result);
            System.out.println("awards"+awards1.getName());
            awardRepository.save(awards1);
            System.out.println(awards1.getName());
            model.addAttribute("message", messageSource.getMessage("editAward.success", null, locale));
            return "editaward";

    }

}

