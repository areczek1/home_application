package arek.pracadyplomowa.model;

import arek.pracadyplomowa.model.Group;
import arek.pracadyplomowa.model.Role;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;

@Getter
@Setter
@Entity
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "user_id")
    private int id;

    @Column(name = "email")
    @NotNull
    private String email    ;

    @Column(name = "password")
    @NotNull
    private String password;

    @Column(name = "name")
    @NotNull
    private String name;

    @Column(name = "last_name")
    @NotNull
    private String lastName;

    @Column(name = "active")
    @NotNull
    private int active;

    @Column(name = "activation_code")
    private String activationCode;

    @Column(name = "points")
    @NotNull
    private long points;

    @Column(name = "admin")
    @NotNull
    private boolean admin;

    @Column(name = "path")
    @NotNull
    private String path;

    @ManyToMany(cascade = CascadeType.ALL) //relacja wiele do wielu, kaskada All, zeby mozna bylo odczytywac role uzytkownikow
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))//tablica zbierajaca dane z dwoch tablic: jest to tablica user_role, ktora przechowuje id uzytkownika i role jaka pełni
    private List<Role> roles; //kolekcja

    @ManyToMany(cascade = CascadeType.ALL) //relacja wiele do wielu, kaskada All, zeby mozna bylo odczytywac role uzytkownikow
    @JoinTable(name = "group_user", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "group_id"))//tablica zbierajaca dane z dwoch tablic: jest to tablica user_role, ktora przechowuje id uzytkownika i role jaka pełni
    private List<Group> groups; //kolekcja

    @Transient//Hibernate olewa tą składową
    private String operacja;

    @Transient//Hibernate olewa tą składową
    private int nrRoli;

    @Transient//Hibernate olewa tą składową
    private String newPassword;

    @Transient//Hibernate olewa tą składową
    private int nrTaska;


}
