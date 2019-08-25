package arek.inzynierka.repository;

import arek.inzynierka.model.Awards;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaRepository;

@Repository("awardRepository")
public interface AwardRepository extends JpaRepository<Awards,Integer>{

    Awards findById(long id);

}

