import React, { useState, useEffect } from 'react';
import { BrowserRouter as Router, Route, Routes, Link } from 'react-router-dom';

import ProductsList from './ProductsList';
import ShoppingCart from './ShoppingCart';
import AccountPage from './AccountPage';
import ProductDetails from './ProductDetails';

import { CartProvider } from './CartContext';
import { UserProvider } from './UserContext';

import './App.css';

const App = () => {
  const [products, setProducts] = useState([]);

  useEffect(() => {
    const fetchProducts = async () => {
      try {
        const response = await fetch('http://localhost:5025/api/product');
        const data = await response.json();
        setProducts(data);
      } catch (error) {
        console.error('Error fetching product data:', error);
      }
    };

    fetchProducts();
  }, []);

  const handleCreateAccount = (userData) => {
    console.log('User data:', userData);
  };

  return (
    <Router>
      <UserProvider>
        <CartProvider>
          <header className="App-header">
            <h1>Kids Fashion Shop</h1>
          </header>
          <div class="nav-container">
            <div class="navigation">
              <ul>
                  <li>
                      <Link to="/">
                          <span class="icon"><img src="/Images/home.png" alt="Home Icon"></img></span>
                          <span class="title">Home</span>
                      </Link>
                  </li>

                  <li>
                      <Link to="/cart">
                          <span class="icon"><img src="/Images/cart.png" alt="Cart Icon"></img></span>
                          <span class="title">Cart</span>
                      </Link>
                  </li>

                  <li>
                      <Link to="/account">
                          <span class="icon"><img src="/Images/profile.png" alt="Profile Icon"></img></span>
                          <span class="title">Profile</span>
                      </Link>
                  </li>
                </ul>
              </div>  
            <div className="content-container">
              <Routes>
                <Route path="/" element={<ProductsList products={products} />} />
                <Route path="/cart" element={<ShoppingCart />} />
                <Route path="/account" element={<AccountPage />} />
                <Route path="/product/:productId" element={<ProductDetails products={products} />} />
              </Routes>
            </div>
          </div>
        </CartProvider>
      </UserProvider>
    </Router>
  );
};

export default App;
