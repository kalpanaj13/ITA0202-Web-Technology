const form = document.getElementById("productForm");
const cartTableBody = document.querySelector("#cartTable tbody");
const discountEl = document.getElementById("discount");
const taxEl = document.getElementById("tax");
const totalEl = document.getElementById("total");

let cart = [];

// Add product to cart
form.addEventListener("submit", function(event) {
  event.preventDefault();

  const product = document.getElementById("product").value.trim();
  const price = parseFloat(document.getElementById("price").value);
  const quantity = parseInt(document.getElementById("quantity").value);

  if (!product || price <= 0 || quantity <= 0) {
    alert("Please enter valid product details.");
    return;
  }

  const item = { product, price, quantity };
  cart.push(item);

  form.reset();
  displayCart();
});

// Display cart items
function displayCart() {
  cartTableBody.innerHTML = "";

  cart.forEach((item, index) => {
    const row = document.createElement("tr");

    row.innerHTML = `
      <td>${item.product}</td>
      <td>₹${item.price.toFixed(2)}</td>
      <td>${item.quantity}</td>
      <td>₹${(item.price * item.quantity).toFixed(2)}</td>
      <td><button class="delete" onclick="removeItem(${index})">Delete</button></td>
    `;

    cartTableBody.appendChild(row);
  });

  calculateBill();
}

// Remove item
function removeItem(index) {
  cart.splice(index, 1);
  displayCart();
}

// Calculate billing
function calculateBill() {
  let subtotal = cart.reduce((sum, item) => sum + item.price * item.quantity, 0);

  // Discount: 10% if subtotal > 1000
  let discount = subtotal > 1000 ? subtotal * 0.1 : 0;

  // Tax: 10% on subtotal after discount
  let taxableAmount = subtotal - discount;
  let tax = taxableAmount * 0.1;

  let total = taxableAmount + tax;

  discountEl.textContent = `Discount: ₹${discount.toFixed(2)}`;
  taxEl.textContent = `Tax (10%): ₹${tax.toFixed(2)}`;
  totalEl.textContent = `Total: ₹${total.toFixed(2)}`;
}
