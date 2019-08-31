package arek.pracadyplomowa.service;

import arek.pracadyplomowa.model.Task;
import arek.pracadyplomowa.repository.TaskRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service("taskService")
@Transactional
public class TaskServiceImplementation implements TaskService{

    @Autowired
    @Qualifier("taskRepository")
    private TaskRepository taskRepository;

    @Override
    public void updateTask(String newName, String newDescription, String newComment, int newCountYang, LocalDateTime newDueDate, int id) {
        taskRepository.updateTask(newName, newDescription, newComment, newCountYang ,newDueDate, id);
    }

    @Override
    public Task createFirstTask(List<Task> taskToDo, List<Task> taskInProgress, List<Task> taskDone) {
        Task firstTask;
        if(!taskToDo.isEmpty())
        {
            firstTask=taskToDo.get(0);
        }
        else if(!taskInProgress.isEmpty())
        {
            firstTask=taskInProgress.get(0);

        }
        else if(!taskDone.isEmpty())
        {
            firstTask=taskInProgress.get(0);
        }
        else
        {
            firstTask= new Task();
            firstTask.setCountYang(0);
            firstTask.setName("Pusto");
            firstTask.setComment("Pusto");
        }
        return firstTask;
    }


}
