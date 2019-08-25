package arek.inzynierka.user;

import arek.inzynierka.emailSender.EmailSender;
import arek.inzynierka.model.Group;
import arek.inzynierka.model.Token;
import arek.inzynierka.model.User;
import arek.inzynierka.repository.GroupRepository;
import arek.inzynierka.repository.TokenRepository;
import arek.inzynierka.repository.UserRepository;
import arek.inzynierka.utilities.ApplicationUtils;
import arek.inzynierka.utilities.UserUtilities;
import arek.inzynierka.validators.ChangePasswordValidator;
import arek.inzynierka.validators.EditUserProfileValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.stream.Collectors;

@Controller
public class ProfilController {

    @Autowired
    private EmailSender emailSender;

    @Autowired
    MessageSource messageSource;
    @Autowired
    private GroupRepository groupRepository;

    @Value("${spring.http.tokenGroup}")
    String address;

    @Autowired
    private UserService userService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private TokenRepository tokenRepository;
    private static int ELEMENTS = 4;

    @GET
    @RequestMapping(value = "/profil")
    public String showUserProfilePage(Model model) {

        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        int nrRoli = user.getRoles().iterator().next().getId();
        user.setNrRoli(nrRoli);
        model.addAttribute("user", user);
        return "profil";
    }

    @GET
    @RequestMapping(value = "/editpassword")
    public String editUserPassword(Model model) {

        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        model.addAttribute("user", user);
        return "editpassword";
    }

    @POST
    @RequestMapping(value = "/updatepass")
    public String changeUserPassword(User user, BindingResult result, Model model, Locale locale) {
        String returnPage = null;
        new ChangePasswordValidator().validate(user, result);
        new ChangePasswordValidator().checkPasswords(user.getNewPassword(), result);
        String username = UserUtilities.getLoggedUser();
        User userUpdate = userService.findUserByEmail(username);
        userUpdate.setNewPassword(user.getNewPassword());
        if (result.hasErrors()) {
            returnPage = "editpassword";
        } else {
            userService.updateUserPassword(userUpdate.getNewPassword(), userUpdate.getEmail());
            returnPage = "aftereditpassword";
            model.addAttribute("message", messageSource.getMessage("passwordChange.success", null, locale));
        }
        return returnPage;
    }

    @GET
    @RequestMapping(value = "/editprofil")
    public String changeUserData(Model model) {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        model.addAttribute("user", user);
        return "editprofil";
    }

    @POST
    @RequestMapping(value = "/updateprofil")
    public String changeUserDataAction(User user, BindingResult result, Model model, Locale locale) {
        String returnPage = null;
        String username = UserUtilities.getLoggedUser();
        User userUpdate = userService.findUserByEmail(username);
        new EditUserProfileValidator().validate(userUpdate, result);

        if (result.hasErrors()) {
            returnPage = "editprofil";
        } else {
            userService.updateUserProfile(user.getName(), user.getLastName(), user.getEmail(), userUpdate.getId());
            model.addAttribute("message", messageSource.getMessage("profilEdit.success", null, locale));
            returnPage = "afteredit";
        }
        return returnPage;
    }

    @GET
    @RequestMapping(value = "/members")
    public String openUsersPage( Model model) {
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        Group group =groupRepository.findById(user.getGroups().get(0).getId());
        List<Group>groups=new ArrayList<>();
        groups.add(group);
        List<User> userList = userRepository.findByGroups(groups);
        model.addAttribute("userList", userList);
        return "members";
    }

    private Page<User> getAllUsersPageable(int page) {
        Page<User> pages = userService.findAll(PageRequest.of(page, ELEMENTS));
        for (User users : pages) {
            int numerRoli = users.getRoles().iterator().next().getId();
            users.setNrRoli(numerRoli);
        }
        return pages;
    }

    @GET
    @RequestMapping(value = "/searchmembers/{page}")
    @Secured(value = "ROLE_PARENT")
    public String searchUserPage(@PathVariable("page") int page, Model model) {
        List<User> userList = userRepository.findAll().stream().filter(user -> user.getRoles().stream().anyMatch(role -> role.getRole().equals("ROLE_USER"))).collect(Collectors.toList());
        userList = userList.stream().filter(user -> user.getGroups().isEmpty()).collect(Collectors.toList());
        model.addAttribute("userList", userList);
        return "searchmembers";
    }

    @POST
    @RequestMapping(value = "/jointogroup/{page}")
    public String jointogroup(@PathVariable("page") int page, Model model) {
        List<User> userList = userRepository.findAll();
        model.addAttribute("userList", userList);
        return "searchmembers";
    }

    @POST
    @RequestMapping(value = "/addmember/{id}")
    @Secured(value = "ROLE_PARENT")
    public String addMember(@PathVariable("id") int id, Model model, Locale locale) {
        List<User> userList = userRepository.findAll().stream().filter(user -> user.getRoles().stream().anyMatch(role -> role.getRole().equals("ROLE_USER"))).collect(Collectors.toList());
        userList = userList.stream().filter(user -> user.getGroups().isEmpty()).collect(Collectors.toList());
        String username = UserUtilities.getLoggedUser();
        User user = userService.findUserByEmail(username);
        User userInvited =userRepository.findById(id);

        String tokenRandomString=(ApplicationUtils.randomStringGenerator());
        Token token =new Token();
        token.setId(userInvited.getId());
        token.setToken(tokenRandomString);
        tokenRepository.save(token);
        sendEmail(user,userInvited.getEmail(),tokenRandomString);
        model.addAttribute("userList", userList);
        model.addAttribute("message", userInvited.getName()+" "+userInvited.getLastName());
        return "searchmembers";
    }

    @POST
    @RequestMapping(value = "/jointogroup/{token}/{groupid}")
    public String addMember(@PathVariable("token") String tokenString,@PathVariable("groupid") int groupId, Model model) {

        Token token= tokenRepository.findByToken(tokenString);
        if(token==null)
        {
            model.addAttribute("message", "Token jest nieaktywny");
            return "index";
        }
        User user =userRepository.findById(token.getId());
        Group group=groupRepository.findById(groupId);
        List<Group> groups =new ArrayList<>();
        groups.add(group);
        user.setGroups(groups);
        userRepository.save(user);
        token.setToken(null);
        tokenRepository.save(token);
        model.addAttribute("message", "Gratuluje dolaczyles/as do grupy");
        return "index";
    }



    void sendEmail(User user,String email, String activationCode) {
        String content = "<style type=\"text/css\">\n" +
                "@media only screen and (max-width:600px) {p, ul li, ol li, a { font-size:16px!important; line-height:150%!important } h1 { font-size:30px!important; text-align:center; line-height:120%!important } h2 { font-size:26px!important; text-align:center; line-height:120%!important } h3 { font-size:20px!important; text-align:center; line-height:120%!important } h1 a { font-size:30px!important } h2 a { font-size:26px!important } h3 a { font-size:20px!important } .es-menu td a { font-size:16px!important } .es-header-body p, .es-header-body ul li, .es-header-body ol li, .es-header-body a { font-size:16px!important } .es-footer-body p, .es-footer-body ul li, .es-footer-body ol li, .es-footer-body a { font-size:16px!important } .es-infoblock p, .es-infoblock ul li, .es-infoblock ol li, .es-infoblock a { font-size:12px!important } *[class=\"gmail-fix\"] { display:none!important } .es-m-txt-c, .es-m-txt-c h1, .es-m-txt-c h2, .es-m-txt-c h3 { text-align:center!important } .es-m-txt-r, .es-m-txt-r h1, .es-m-txt-r h2, .es-m-txt-r h3 { text-align:right!important } .es-m-txt-l, .es-m-txt-l h1, .es-m-txt-l h2, .es-m-txt-l h3 { text-align:left!important } .es-m-txt-r img, .es-m-txt-c img, .es-m-txt-l img { display:inline!important } .es-button-border { display:block!important } a.es-button { font-size:20px!important; display:block!important; border-width:10px 0px 10px 0px!important } .es-btn-fw { border-width:10px 0px!important; text-align:center!important } .es-adaptive table, .es-btn-fw, .es-btn-fw-brdr, .es-left, .es-right { width:100%!important } .es-content table, .es-header table, .es-footer table, .es-content, .es-footer, .es-header { width:100%!important; max-width:600px!important } .es-adapt-td { display:block!important; width:100%!important } .adapt-img { width:100%!important; height:auto!important } .es-m-p0 { padding:0px!important } .es-m-p0r { padding-right:0px!important } .es-m-p0l { padding-left:0px!important } .es-m-p0t { padding-top:0px!important } .es-m-p0b { padding-bottom:0!important } .es-m-p20b { padding-bottom:20px!important } .es-mobile-hidden, .es-hidden { display:none!important } .es-desk-hidden { display:table-row!important; width:auto!important; overflow:visible!important; float:none!important; max-height:inherit!important; line-height:inherit!important } .es-desk-menu-hidden { display:table-cell!important } table.es-table-not-adapt, .esd-block-html table { width:auto!important } table.es-social { display:inline-block!important } table.es-social td { display:inline-block!important } }\n" +
                "#outlook a {\n" +
                "\tpadding:0;\n" +
                "}\n" +
                ".ExternalClass {\n" +
                "\twidth:100%;\n" +
                "}\n" +
                ".ExternalClass,\n" +
                ".ExternalClass p,\n" +
                ".ExternalClass span,\n" +
                ".ExternalClass font,\n" +
                ".ExternalClass td,\n" +
                ".ExternalClass div {\n" +
                "\tline-height:100%;\n" +
                "}\n" +
                ".es-button {\n" +
                "\tmso-style-priority:100!important;\n" +
                "\ttext-decoration:none!important;\n" +
                "}\n" +
                "a[x-apple-data-detectors] {\n" +
                "\tcolor:inherit!important;\n" +
                "\ttext-decoration:none!important;\n" +
                "\tfont-size:inherit!important;\n" +
                "\tfont-family:inherit!important;\n" +
                "\tfont-weight:inherit!important;\n" +
                "\tline-height:inherit!important;\n" +
                "}\n" +
                ".es-desk-hidden {\n" +
                "\tdisplay:none;\n" +
                "\tfloat:left;\n" +
                "\toverflow:hidden;\n" +
                "\twidth:0;\n" +
                "\tmax-height:0;\n" +
                "\tline-height:0;\n" +
                "\tmso-hide:all;\n" +
                "}\n" +
                "</style> \n" +
                " </head> \n" +
                " <body style=\"width:100%;font-family:arial, 'helvetica neue', helvetica, sans-serif;-webkit-text-size-adjust:100%;-ms-text-size-adjust:100%;padding:0;Margin:0;\"> \n" +
                "  <div class=\"es-wrapper-color\" style=\"background-color:#F6F6F6;\"> \n" +
                "   <!--[if gte mso 9]>\n" +
                "\t\t\t<v:background xmlns:v=\"urn:schemas-microsoft-com:vml\" fill=\"t\">\n" +
                "\t\t\t\t<v:fill type=\"tile\" color=\"#f6f6f6\"></v:fill>\n" +
                "\t\t\t</v:background>\n" +
                "\t\t<![endif]--> \n" +
                "   <table class=\"es-wrapper\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;padding:0;Margin:0;width:100%;height:100%;background-repeat:repeat;background-position:center top;\"> \n" +
                "     <tr style=\"border-collapse:collapse;\"> \n" +
                "      <td valign=\"top\" style=\"padding:0;Margin:0;\"> \n" +
                "       <table class=\"es-content\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;table-layout:fixed !important;width:100%;\"> \n" +
                "         <tr style=\"border-collapse:collapse;\"> \n" +
                "          <td align=\"center\" style=\"padding:0;Margin:0;background-position:left top;\"> \n" +
                "           <table class=\"es-content-body\" width=\"600\" cellspacing=\"0\" cellpadding=\"0\" bgcolor=\"#ffffff\" align=\"center\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-color:#FFFFFF;\"> \n" +
                "             <tr style=\"border-collapse:collapse;\"> \n" +
                "              <td align=\"left\" style=\"padding:0;Margin:0;background-position:left top;\"> \n" +
                "               <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;\"> \n" +
                "                 <tr style=\"border-collapse:collapse;\"> \n" +
                "                  <td width=\"600\" align=\"center\" valign=\"top\" style=\"padding:0;Margin:0;\"> \n" +
                "                   <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;\"> \n" +
                "                     <tr style=\"border-collapse:collapse;\"> \n" +
                "                      <td align=\"center\" style=\"padding:0;Margin:0;\"><img class=\"adapt-img\" src=\"https://dqcpe.stripocdn.email/content/guids/CABINET_bc0f7a8e2699c6fc0dd67ccf46f40364/images/92561565037085895.png\" alt style=\"display:block;border:0;outline:none;text-decoration:none;-ms-interpolation-mode:bicubic;\" width=\"600\"></td> \n" +
                "                     </tr> \n" +
                "                   </table></td> \n" +
                "                 </tr> \n" +
                "               </table></td> \n" +
                "             </tr> \n" +
                "             <tr style=\"border-collapse:collapse;\"> \n" +
                "              <td align=\"left\" style=\"Margin:0;padding-bottom:5px;padding-left:20px;padding-right:20px;padding-top:30px;background-position:left top;\"> \n" +
                "               <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;\"> \n" +
                "                 <tr style=\"border-collapse:collapse;\"> \n" +
                "                  <td width=\"560\" valign=\"top\" align=\"center\" style=\"padding:0;Margin:0;\"> \n" +
                "                   <table width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;\"> \n" +
                "                     <tr style=\"border-collapse:collapse;\"> \n" +
                "                      <td align=\"center\" style=\"padding:0;Margin:0;\"><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:30px;font-family:verdana, geneva, sans-serif;line-height:45px;color:#333333;\">Potwierdzenie adresu&nbsp;email</p></td> \n" +
                "                     </tr> \n" +
                "                   </table></td> \n" +
                "                 </tr> \n" +
                "               </table></td> \n" +
                "             </tr> \n" +
                "             <tr style=\"border-collapse:collapse;\"> \n" +
                "              <td align=\"left\" style=\"padding:0;Margin:0;padding-top:20px;padding-left:40px;padding-right:40px;background-position:left top;\"> \n" +
                "               <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;\"> \n" +
                "                 <tr style=\"border-collapse:collapse;\"> \n" +
                "                  <td width=\"520\" align=\"center\" valign=\"top\" style=\"padding:0;Margin:0;\"> \n" +
                "                   <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;background-position:left top;\"> \n" +
                "                     <tr style=\"border-collapse:collapse;\"> \n" +
                "                      <td align=\"center\" style=\"padding:5px;Margin:0;\"><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:15px;font-family:verdana, geneva, sans-serif;line-height:23px;color:#888888;\">Dołącz do grupy <userName>. Bedzie super</p><p style=\"Margin:0;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-size:15px;font-family:verdana, geneva, sans-serif;line-height:23px;color:#888888;\">Po prostu kliknij w w przycisk poniżej, aby zweryfikować Twój adres email.</p></td> \n" +
                "                     </tr> \n" +
                "                   </table></td> \n" +
                "                 </tr> \n" +
                "               </table></td> \n" +
                "             </tr> \n" +
                "             <tr style=\"border-collapse:collapse;\"> \n" +
                "              <td align=\"left\" style=\"Margin:0;padding-left:20px;padding-right:20px;padding-top:35px;padding-bottom:40px;background-position:left top;\"> \n" +
                "               <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;\"> \n" +
                "                 <tr style=\"border-collapse:collapse;\"> \n" +
                "                  <td width=\"560\" align=\"center\" valign=\"top\" style=\"padding:0;Margin:0;\"> \n" +
                "                   <table cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"mso-table-lspace:0pt;mso-table-rspace:0pt;border-collapse:collapse;border-spacing:0px;\"> \n" +
                "                     <tr style=\"border-collapse:collapse;\"> \n" +
                "                      <td align=\"center\" bgcolor=\"transparent\" style=\"Margin:0;padding-top:10px;padding-left:10px;padding-right:10px;padding-bottom:15px;\"><span class=\"es-button-border\" style=\"border-style:solid;border-color:#2CB543;background:#ECCC1B;border-width:0px 0px 2px 0px;display:inline-block;border-radius:15px;width:auto;border-bottom-color:#C8BC43;border-bottom-width:4px;\"><a href=\"<userActivationLink>\" class=\"es-button\" target=\"_blank\" style=\"mso-style-priority:100 !important;text-decoration:none;-webkit-text-size-adjust:none;-ms-text-size-adjust:none;mso-line-height-rule:exactly;font-family:arial, 'helvetica neue', helvetica, sans-serif;font-size:18px;color:#FFFFFF;border-style:solid;border-color:#ECCC1B;border-width:15px 99px;display:inline-block;background:#ECCC1B;border-radius:15px;font-weight:normal;font-style:normal;line-height:22px;width:auto;text-align:center;\">Zweryfikuj email</a></span></td> \n" +
                "                     </tr> \n" +
                "                   </table></td> \n" +
                "                 </tr> \n" +
                "               </table></td> \n" +
                "             </tr> \n" +
                "           </table></td> \n" +
                "         </tr> \n" +
                "       </table></td> \n" +
                "     </tr> \n" +
                "   </table> \n" +
                "  </div>  \n" +
                " </body>";
        int groupId=user.getGroups().get(0).getId();
        String activationLink = address + activationCode+"/"+groupId;

        content = content.replaceFirst("<userName>", user.getName() + " " + user.getLastName());
        content = content.replaceFirst("<userActivationLink>", activationLink);

        emailSender.sendEmail(email, "Potwierdzenie rejestracji", content);
    }


}