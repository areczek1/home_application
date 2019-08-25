package arek.inzynierka.repository;



import arek.inzynierka.model.Token;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;




@Repository("tokenRepository")
public interface TokenRepository extends JpaRepository<Token, Integer> {

    Token findByToken(String token);

}
