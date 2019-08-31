package arek.pracadyplomowa.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Getter
@Setter
@Entity
@Table(name = "chosen_award")
public class ChosenAward {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "chosen_award_id")
    private int id;

    @Column(name = "user_id")
    private int userId;

    @Column(name = "parent_id")
    private int parentId;

    @Column(name = "group_id")
    private int groupId;

    @Column(name = "award_id")
    private long awardId;

    @Transient
    private String userName;

    @Transient
    private String path;
}
