package arek.inzynierka.user;


import arek.inzynierka.model.Group;
import arek.inzynierka.model.Task;
import arek.inzynierka.model.User;
import arek.inzynierka.repository.GroupRepository;
import arek.inzynierka.repository.TaskRepository;
import arek.inzynierka.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service("userService")
//jest to serwis usługa dostepu do warstwy danych(ma zwizek z baza danych z application.properties)
@Transactional//wlacza nam transakcje jezeli chodzi o baze danych
public class UserServiceImplementation implements UserService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private TaskRepository taskRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    GroupRepository groupRepository;

    @Override
    public User findUserByEmail(String email) {
        return userRepository.findByEmail(email);
    }

    @Override
    public void saveUser(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setActive(1);
        Role role = new Role();
        if(user.getNrRoli()==0) {
            role = roleRepository.findByRole("ROLE_USER");
            user.setRoles(new ArrayList<>(Arrays.asList(role)));
            userRepository.save(user);
        }
        else{
            role = roleRepository.findByRole("ROLE_PARENT");
            Group group = new Group();
            group.setName(user.getName()+" "+user.getLastName());
            user.setRoles(new ArrayList<>(Arrays.asList(role)));
            userRepository.save(user);
            user=userRepository.findByEmail(user.getEmail());
            group.setGroupAdmin(user.getId());
            groupRepository.save(group);
            List<Group> groups=new ArrayList<>();
            groups.add(group);
            user.setGroups(groups);
            userRepository.save(user);
        }
    }

    @Override
    public void updateUserPassword(String newPassword, String email) {
        userRepository.updateUserPassword(bCryptPasswordEncoder.encode(newPassword), email);
    }

    @Override
    public void updateUserProfile(String newName, String newLastName, String newEmail, int id) {
        userRepository.updateUserProfile(newName, newLastName, newEmail, id);
    }

    @Override
    public void updateUserActivation(int activeCode, String activationCode) {
        userRepository.updateActivation(activeCode, activationCode);
    }


    @Override
    public Page<User> findAll(Pageable pageable) {
        Page<User> userList = userRepository.findAll(pageable);
        return userList;
    }
}
