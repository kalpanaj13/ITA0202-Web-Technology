const form = document.getElementById("resultForm");
const tableBody = document.querySelector("#resultsTable tbody");

// Store student results in an array of objects
let students = [];

form.addEventListener("submit", function(event) {
  event.preventDefault();

  let name = document.getElementById("name").value.trim();
  let marksInput = document.getElementById("marks").value.trim();

  // Convert marks string to array of numbers
  let marks = marksInput.split(",").map(m => parseInt(m));

  // Calculate total, average, highest, lowest
  let total = marks.reduce((sum, val) => sum + val, 0);
  let average = total / marks.length;
  let highest = Math.max(...marks);
  let lowest = Math.min(...marks);

  // Conditional statement for pass/fail
  let status = average >= 40 ? "Pass ✅" : "Fail ❌";

  // Create student object
  let student = {
    name,
    marks,
    total,
    average,
    highest,
    lowest,
    status
  };

  // Add to array
  students.push(student);

  // Update table
  displayResults();
  form.reset();
});

function displayResults() {
  tableBody.innerHTML = "";

  // Loop through students array
  students.forEach(student => {
    let row = document.createElement("tr");

    row.innerHTML = `
      <td>${student.name}</td>
      <td>${student.marks.join(", ")}</td>
      <td>${student.total}</td>
      <td>${student.average.toFixed(2)}</td>
      <td>${student.highest}</td>
      <td>${student.lowest}</td>
      <td>${student.status}</td>
    `;

    tableBody.appendChild(row);
  });
}
