package arek.pracadyplomowa.service;

import arek.pracadyplomowa.model.Task;

import java.time.LocalDateTime;
import java.util.List;

public interface TaskService {
    public void updateTask(String newName, String newDescription, String newComment, int newCountYang, LocalDateTime newDueDate, int id);

    Task createFirstTask(List<Task> taskToDo, List<Task> taskInProgress, List<Task> taskDone);
}
