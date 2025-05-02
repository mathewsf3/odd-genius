import React from 'react';
import ReactDOM from 'react-dom/client';
import { BrowserRouter } from 'react-router-dom';
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

// For debugging
console.log("Starting application...");

try {
  const rootElement = document.getElementById('root');
  
  if (!rootElement) {
    console.error("Root element not found!");
    throw new Error('Failed to find the root element');
  }
  
  console.log("Creating React root...");
  const root = ReactDOM.createRoot(rootElement);
  
  console.log("Rendering app...");
  root.render(
    <React.StrictMode>
      <BrowserRouter>
        <App />
      </BrowserRouter>
    </React.StrictMode>
  );
  
  console.log("App rendered successfully");
} catch (error) {
  console.error("Error rendering the application:", error);
}

reportWebVitals();