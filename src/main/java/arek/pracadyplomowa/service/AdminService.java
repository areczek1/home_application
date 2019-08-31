package arek.pracadyplomowa.service;

import arek.pracadyplomowa.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface AdminService {

    Page<User> findAll(Pageable pageable);
    User findUserById(int id);
    void updateUser(int id, int nrRoli, int activity);
}
