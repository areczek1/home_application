package arek.pracadyplomowa.repository;

import arek.pracadyplomowa.model.ChosenAward;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("chosenAwardRepository")
public interface ChosenAwardRepository extends JpaRepository<ChosenAward,Integer> {

    List<ChosenAward> findAllByParentId(int parentId);
    List<ChosenAward> findAllByUserId(int userId);
    ChosenAward findById(int id);

}
