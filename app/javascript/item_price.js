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

function disableSubmitButton() {
  const form = document.getElementById("item-form");
  const submitButton = document.getElementById("sell-submit-btn");

  if (!form || !submitButton) return;

  form.addEventListener("submit", () => {
    submitButton.disabled = true;
    submitButton.value = "出品中...";
  });
}

window.addEventListener("turbo:load", priceCalculator);
window.addEventListener("turbo:render", priceCalculator);

window.addEventListener("turbo:load", disableSubmitButton);
window.addEventListener("turbo:render", disableSubmitButton);