package arek.inzynierka.repository;


import arek.inzynierka.model.Task;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;


@Repository("taskRepository")
public interface TaskRepository extends JpaRepository<Task,Integer> {

    Task findById(int id);

    @Modifying
    @Query("UPDATE Task task SET task.name = :newName, task.description = :newDescription, task.comment = :newComment, task.countYang = :newCountYang, task.createDate = :newCreateDate WHERE task.id= :id")
    public void updateTask(@Param("newName") String newName, @Param("newDescription") String newDescription,
                           @Param("newComment") String newComment, @Param("newCountYang") Integer newCountYang, @Param("newCreateDate") LocalDateTime newCreateDate, @Param("id") Integer id);
}
