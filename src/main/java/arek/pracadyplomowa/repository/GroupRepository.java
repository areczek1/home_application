package arek.pracadyplomowa.repository;

import arek.pracadyplomowa.model.Group;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository("groupRepository")
public interface GroupRepository extends JpaRepository<Group,Integer> {
    Group findById(int id);
}
