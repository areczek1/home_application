package arek.pracadyplomowa.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@Entity
@Table(name = "choice")
public class Choice {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_id")
    private int id;

    @Column(name = "prize")
    @NotNull
    private String prize;

    @Column(name = "user_name")
    @NotNull
    private String username;

    @Column(name = "path")
    @NotNull
    private String path;
}
