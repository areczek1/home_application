package arek.inzynierka.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@Entity
@Table(name = "awards")
public class Awards {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_id")
    private long id;

    @Column(name = "name")
    @NotNull
    private String name;

    @Column(name = "count")
    @NotNull
    private int count;

    @Column(name = "path")
    @NotNull
    private String path;
}
