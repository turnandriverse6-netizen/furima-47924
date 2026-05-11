function priceCalculator() {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

   if (!priceInput) return null;

  priceInput.addEventListener("input", () => {
    const price = priceInput.value;

    const fee = Math.floor(price * 0.1);
    const gain = price - fee;

    addTaxPrice.innerHTML = fee;
    profit.innerHTML = gain;
  });
}

window.addEventListener("turbo:load", priceCalculator);
window.addEventListener("turbo:render", priceCalculator);