package arek.inzynierka.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Getter
@Setter
@Entity
@Table(name = "date_task")
public class DateTask {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "task_id")
    private int idTask;

    @Column(name = "create_date")
    @NotNull
    private LocalDateTime createDate;

    @Column(name = "end_date")
    @NotNull
    private LocalDateTime endDate;

    @Column(name = "confirm")
    @NotNull
    private boolean confirm;
}
