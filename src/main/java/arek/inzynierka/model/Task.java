package arek.inzynierka.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "tasks")
public class Task {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "task_id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "comment")
    private String comment;

    @Column(name = "count_yang")
    private int countYang;

    @Column(name = "state")
    private int state;

    @Column(name = "due_date")
    private LocalDateTime dueDate;

    @Transient
    private String dueDateText;

    @Column(name = "create_date")
    private LocalDateTime createDate;

    @Column(name = "end_date")
    private LocalDateTime endDate;

    @Column(name = "confirm")
    private boolean confirm;

    @Column (name="user_id")
    private int userId;

    @Transient
    int day;

    @Transient
    int month;

    @Transient
    int year;


}
