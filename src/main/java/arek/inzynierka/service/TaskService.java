package arek.inzynierka.service;

import arek.inzynierka.model.Task;
import arek.inzynierka.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.time.LocalDateTime;
import java.util.List;

public interface TaskService {
    public void updateTask(String newName, String newDescription, String newComment, int newCountYang, LocalDateTime newDueDate, int id);

    Task createFirstTask(List<Task> taskToDo, List<Task> taskInProgress, List<Task> taskDone);
}
