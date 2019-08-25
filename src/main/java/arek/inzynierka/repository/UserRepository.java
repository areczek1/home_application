package arek.inzynierka.repository;

import arek.inzynierka.model.Group;
import arek.inzynierka.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("userRepository")
public interface UserRepository extends JpaRepository<User, Integer> {

    public User findByEmail(String email);//generuje zapytanie do bazy danych
    public User findById(int id);
    public List<User> findByGroups(List<Group> group);

    @Modifying//bedziemy cos modyfikowaćw w bazie dzieki tej adnotacji
    @Query("UPDATE User u SET u.password = :newPassword WHERE u.email= :email")//jest tak jakby update danych w bazie
    public void updateUserPassword(@Param("newPassword") String newPassword, @Param("email") String email);

    @Modifying
    @Query("UPDATE User u SET u.name = :newName, u.lastName = :newLastName, u.email = :newEmail WHERE u.id= :id")
    public void updateUserProfile(@Param("newName") String newName, @Param("newLastName") String newLastName,
                                  @Param("newEmail") String newEmail, @Param("id") int id);
    @Modifying
    @Query("UPDATE User u SET u.active = :activeParam WHERE u.activationCode = :activationCode")
    public void updateActivation(@Param("activeParam") int activeParam, @Param("activationCode") String activationCode);
}
