let display = document.getElementById("display");

function insert(value) {
  display.value += value;
}

function clearDisplay() {
  display.value = "";
}

function deleteChar() {
  display.value = display.value.slice(0, -1);
}

function calculate() {
  try {
    display.value = eval(display.value);
  } catch {
    display.value = "Error";
  }
}

// Scientific functions
function sqrt() {
  display.value = Math.sqrt(parseFloat(display.value));
}

function pow() {
  display.value = Math.pow(parseFloat(display.value), 2);
}

function sin() {
  display.value = Math.sin(parseFloat(display.value));
}

function cos() {
  display.value = Math.cos(parseFloat(display.value));
}

function tan() {
  display.value = Math.tan(parseFloat(display.value));
}

function log() {
  display.value = Math.log(parseFloat(display.value));
}
