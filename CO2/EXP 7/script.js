// Array of quiz questions
const quizData = [
  {
    question: "Which language runs in a web browser?",
    options: ["Java", "C", "Python", "JavaScript"],
    answer: "JavaScript"
  },
  {
    question: "What does CSS stand for?",
    options: ["Central Style Sheets", "Cascading Style Sheets", "Computer Style Sheets", "Creative Style System"],
    answer: "Cascading Style Sheets"
  },
  {
    question: "What does HTML stand for?",
    options: ["HyperText Markup Language", "HyperText Markdown Language", "Hyper Transfer Markup Language", "HighText Machine Language"],
    answer: "HyperText Markup Language"
  },
  {
    question: "Which year was JavaScript launched?",
    options: ["1996", "1995", "1994", "None of the above"],
    answer: "1995"
  }
];

const quizContainer = document.getElementById("quiz");
const submitBtn = document.getElementById("submitBtn");
const resultContainer = document.getElementById("result");

// Display quiz questions
function loadQuiz() {
  quizData.forEach((q, index) => {
    const card = document.createElement("div");
    card.classList.add("card");

    const questionEl = document.createElement("h3");
    questionEl.textContent = `${index + 1}. ${q.question}`;
    card.appendChild(questionEl);

    q.options.forEach(option => {
      const label = document.createElement("label");
      const input = document.createElement("input");
      input.type = "radio";
      input.name = `question${index}`;
      input.value = option;

      label.appendChild(input);
      label.appendChild(document.createTextNode(option));
      card.appendChild(label);
      card.appendChild(document.createElement("br"));
    });

    quizContainer.appendChild(card);
  });
}

// Calculate score
function calculateScore() {
  let score = 0;

  quizData.forEach((q, index) => {
    const selected = document.querySelector(`input[name="question${index}"]:checked`);
    if (selected && selected.value === q.answer) {
      score++;
    }
  });

  resultContainer.textContent = `You scored ${score} out of ${quizData.length}`;
}

// Event listener
submitBtn.addEventListener("click", calculateScore);

// Load quiz on page load
loadQuiz();
