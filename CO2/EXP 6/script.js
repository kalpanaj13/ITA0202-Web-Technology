const taskInput = document.getElementById("taskInput");
const addBtn = document.getElementById("addBtn");
const taskList = document.getElementById("taskList");

let tasks = []; // Array to store task objects

// Add Task
addBtn.addEventListener("click", () => {
  const taskText = taskInput.value.trim();
  if (taskText === "") return alert("Please enter a task!");

  const task = { id: Date.now(), text: taskText };
  tasks.push(task);
  taskInput.value = "";
  displayTasks();
});

// Display Tasks
function displayTasks() {
  taskList.innerHTML = "";
  tasks.forEach(task => {
    const li = document.createElement("li");
    const span = document.createElement("span");
    span.textContent = task.text;

    const editBtn = document.createElement("button");
    editBtn.textContent = "Edit";
    editBtn.className = "edit";
    editBtn.addEventListener("click", () => editTask(task.id));

    const deleteBtn = document.createElement("button");
    deleteBtn.textContent = "Delete";
    deleteBtn.className = "delete";
    deleteBtn.addEventListener("click", () => deleteTask(task.id));

    li.appendChild(span);
    li.appendChild(editBtn);
    li.appendChild(deleteBtn);
    taskList.appendChild(li);
  });
}

// Edit Task
function editTask(id) {
  const task = tasks.find(t => t.id === id);
  const newText = prompt("Edit your task:", task.text);
  if (newText !== null && newText.trim() !== "") {
    task.text = newText.trim();
    displayTasks();
  }
}

// Delete Task
function deleteTask(id) {
  tasks = tasks.filter(t => t.id !== id);
  displayTasks();
}
