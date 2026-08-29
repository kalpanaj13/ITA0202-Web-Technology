document.getElementById("showBtn").addEventListener("click", () => {
  try {
    // Corrected ID reference
    let msg = document.getElementById("message");
    console.log("Message element found:", msg);

    // Optional breakpoint for debugging
    debugger;

    msg.textContent = "Hello! Debugging successful.";
  } catch (error) {
    console.error("Error caught:", error);
    alert("Something went wrong. Check console for details.");
  }
});
