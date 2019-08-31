package arek.pracadyplomowa.model;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "all_group")//Teraz Hibernate wie, że ma się posługiwać tablicą o nazwie 'user'
@Getter
@Setter
public class Group {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "group_id")
    private int id;

    @Column(name = "name")
    private String name;

    @Column(name = "group_admin")
    private int groupAdmin;

    @ManyToMany(cascade = CascadeType.ALL) //relacja wiele do wielu, kaskada All, zeby mozna bylo odczytywac role uzytkownikow
    @JoinTable(name = "group_task", joinColumns = @JoinColumn(name = "group_id"), inverseJoinColumns = @JoinColumn(name = "task_id"))//tablica zbierajaca dane z dwoch tablic: jest to tablica user_role, ktora przechowuje id uzytkownika i role jaka pełni
    private List<Task> taskList; //kolekcja

    @ManyToMany(cascade = CascadeType.ALL) //relacja wiele do wielu, kaskada All, zeby mozna bylo odczytywac role uzytkownikow
    @JoinTable(name = "awards_group", joinColumns = @JoinColumn(name = "group_id"), inverseJoinColumns = @JoinColumn(name = "award_id"))//tablica zbierajaca dane z dwoch tablic: jest to tablica user_role, ktora przechowuje id uzytkownika i role jaka pełni
    private List<Awards> awards; //kolekcja
}
