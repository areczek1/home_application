package arek.inzynierka.model;

import arek.inzynierka.user.Role;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "awards")
public class Awards {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "award_id")
    private long id;

    @Column(name = "name")
    private String name;

    @Column(name = "count")
    private int count;

    @Column(name = "path")
    private String path;
}
