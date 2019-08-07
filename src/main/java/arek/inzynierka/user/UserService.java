package arek.inzynierka.user;

import arek.inzynierka.model.User;

public interface UserService {

    public User findUserByEmail(String email);//odnajduje uzytkownika po mailu
    public void saveUser(User user);//zapisuje uzytkownika
    public void updateUserPassword(String newPassword, String email);
    public void updateUserProfile(String newName, String newLastName, String newEmail, int id);
    public void updateUserActivation(int activeCode, String activationCode);
}
