import React, { useState, useEffect } from 'react';
import { useCart } from './CartContext';

import './Style/ShoppingCart.css';

const ShoppingCart = () => {
  const [cartItems, setCartItems] = useState([]);
  const [orderPlaced, setOrderPlaced] = useState(false);

  const updateQuantity = async (itemId, newQuantity) => {
    try {
      const existingCartItem = cartItems.find(item => item.id === itemId);
      if (!existingCartItem) {
        console.error('Cart item not found.');
        return;
      }
  
      const { id, userId, productId } = existingCartItem;
  
      // Log the data before inserting
      console.log('Data before inserting:', { id, userId, productId, quantity: newQuantity });
  
      // Update item quantity in the database
      await fetch(`http://localhost:5025/api/cart/${itemId}`, {
        method: 'PUT',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({
          id: id,
          user_id: userId,
          product_id: productId,
          quantity: newQuantity,
        }),
      });
  
      // Update the local state
      setCartItems(prevItems =>
        prevItems.map(item => (item.id === itemId ? { ...item, quantity: newQuantity } : item))
      );
    } catch (error) {
      console.error('Error updating quantity:', error);
    }
  };

  const removeFromCart = async (itemId) => {
    try {
      // Remove item from the database
      await fetch(`http://localhost:5025/api/cart/${itemId}`, {
        method: 'DELETE',
        headers: {
          'Content-Type': 'application/json',
        },
      });

      // Update the local state
      setCartItems((prevItems) => prevItems.filter((item) => item.id !== itemId));
    } catch (error) {
      console.error('Error removing item:', error);
    }
  };


  useEffect(() => {
    const fetchCartItems = async () => {
      try {
        const response = await fetch('http://localhost:5025/api/cart');
        const cartItemsWithDetails = await response.json();
  
        // Now cartItemsWithDetails should contain all the necessary data for creating an order
        setCartItems(cartItemsWithDetails);
      } catch (error) {
        console.error('Error fetching cart items:', error);
      }
    };
  
    fetchCartItems();
  }, []);

  const calculateTotal = () => {
    const total = cartItems.reduce((acc, item) => {
      const itemPrice = parseFloat(item.productPricing) || 0;
      const itemQuantity = parseFloat(item.quantity) || 0;
      return acc + itemPrice * itemQuantity;
    }, 0);
    return total.toFixed(2);
  };

  const handleFinalizePurchase = async () => {
    try {
        // Iterate over each order in cartItems and send a POST request for each order
        for (const item of cartItems) {
            const orderData = {
                user_id: item.userId,
                product_id: item.productId,
                quantity: parseInt(item.quantity, 10),
                total_amount: item.productPricing * parseInt(item.quantity, 10),
            };

            // Log order data to console
            console.log('Order Data:', orderData);

            // Send a POST request to insert order into the database
            const apiUrl = 'http://localhost:5025/api/order';
            const response = await fetch(apiUrl, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify(orderData),
            });

            if (!response.ok) {
                // If the response is not successful, throw an error
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
        }

        // After all orders are successfully processed, clear the cartItems
        setCartItems([]);

        // Delete items from the cart table (if needed)
        await fetch('http://localhost:5025/api/cart', {
          method: 'DELETE',
        });

        // Set the orderPlaced state to true
        setOrderPlaced(true);
    } catch (error) {
        // Log any errors that occurred during the process
        console.error('Error finalizing purchase:', error);
    }
};

  
  return (
    <div className="container2">
      <h2>Shopping Cart</h2>
      <table className="shopping-cart-table">
        <thead>
          <tr>
            <th>Image</th>
            <th>Name</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Total</th>
            <th>Action</th>
          </tr>
        </thead>
        <tbody>
          {cartItems.map((item) => (
            <tr key={item.id}>
              <td>
                <img src={`/Images/${item.productImage}`}  alt={item.productName} className="cart-item-image" />
              </td>
              <td>
                {item.productName}
              </td>
              <td>
                <button onClick={() => updateQuantity(item.id, parseInt(item.quantity, 10) - 1)}>-</button>
                {parseInt(item.quantity, 10)}
                <button onClick={() => updateQuantity(item.id, parseInt(item.quantity, 10) + 1)}>+</button>
              </td>
              <td>${item.productPricing}</td>
              <td>${item.productPricing * item.quantity}</td>
              <td>
                <button onClick={() => removeFromCart(item.id)}>Remove</button>
              </td>
            </tr>
          ))}
        </tbody>
        <tfoot>
          <tr className="total-row">
            <td colSpan="4">Total</td>
            <td>${calculateTotal()}</td>
            <td></td>
          </tr>
        </tfoot>
      </table>
      {orderPlaced ? (
        <p>Order placed successfully! Thank you for shopping with us.</p>
      ) : (
        <button onClick={handleFinalizePurchase} className="button">
          Finalize Purchase
        </button>
      )}
    </div>
  );
};

export default ShoppingCart;
