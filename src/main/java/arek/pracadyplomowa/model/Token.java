package arek.pracadyplomowa.model;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "token")
public class Token {

    @Id
    @Column(name = "user_id")
    private int id;

    @Column(name = "token")
    private String token;

}