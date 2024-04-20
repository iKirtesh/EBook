// Sample cart data
const cartData = [
    { id: 1, name: 'Product 1', description: 'Description 1', price: 12, quantity: 1, image: 'https://m.media-amazon.com/images/I/819DmGB3vhL._AC_UF1000,1000_QL80_.jpg' },
    { id: 2, name: 'Product 2', description: 'Description 2', price: 15, quantity: 2, image: 'https://example.com/product2.jpg' },
    // Add more items as needed
];

function renderCartItems() {
    const cartList = document.getElementById('cartList');
    cartList.innerHTML = ''; // Clear existing items

    cartData.forEach(item => {
        const listItem = document.getElementById("cartItemTemplate").content.cloneNode(true);

        listItem.querySelector("#productName").textContent = item.name;
        listItem.querySelector("#productDescription").textContent = item.description;
        listItem.querySelector(".quantity").textContent = item.quantity;
        listItem.querySelector("#productPrice").textContent = `$${item.price}`;
        listItem.querySelector("img").src = item.image;

        cartList.appendChild(listItem);
    });
}

renderCartItems(); // Initial rendering of cart items

function adjustQuantity(action, itemId) {
    const item = cartData.find(item => item.id === itemId);

    if (item) {
        if (action === 'decrease' && item.quantity > 1) {
            item.quantity--;
        } else if (action === 'increase') {
            item.quantity++;
        }

        renderCartItems(); // Update cart items after adjusting quantity
    }

    updateButtons(); // Update button icons based on quantity
}

function updateButtons() {
    const quantityButtons = document.querySelectorAll(".quantity-button");

    cartData.forEach(item => {
        const quantitySpan = document.querySelector(`.quantity[data-id="${item.id}"]`);

        if (quantitySpan) {
            quantitySpan.textContent = item.quantity;
        }
    });

    // Update button icons based on quantity
    quantityButtons.forEach(button => {
        const itemId = button.nextElementSibling.dataset.id;
        const item = cartData.find(item => item.id == itemId);

        if (item) {
            if (item.quantity === 1) {
                button.innerHTML = '<i class="bi bi-trash"></i>';
            } else {
                button.innerHTML = '<i class="bi bi-file-minus"></i>';
            }
        }
    });
}
