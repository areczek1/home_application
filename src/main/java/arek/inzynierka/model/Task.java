package arek.inzynierka.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.sql.Date;

@Getter
@Setter
@Entity
@Table(name = "tasks")
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_id")
    private long id;

    @Column(name = "name")
    @NotNull
    private String name;

    @Column(name = "description")
    @NotNull
    private String description;

    @Column(name = "comment")
    @NotNull
    private String comment;

    @Column(name = "count_yang")
    @NotNull
    private int countYang;

    @Column(name = "state")
    @NotNull
    private int state;

    @Column(name = "due_date")
    @NotNull
    private Date dueDate;

    @Column(name = "id_user")
    @NotNull
    private long idUser;
}
