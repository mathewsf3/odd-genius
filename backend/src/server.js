// Load environment variables
require('dotenv').config();

const express = require('express');
const cors = require('cors');
const logger = require('./utils/logger');
const apiRoutes = require('./routes/api');

// Create Express app
const app = express();

// CORS Configuration
const corsOptions = {
  origin: ['http://localhost:3000', 'https://odd-genius.example.com'],
  methods: ['GET', 'POST', 'PUT', 'DELETE'],
  allowedHeaders: ['Content-Type', 'Authorization']
};

// Middleware
app.use(cors(corsOptions));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Request logging middleware
app.use((req, res, next) => {
  logger.info(`${req.method} ${req.url}`, { 
    service: 'odd-genius-api',
    ip: req.ip,
    userAgent: req.get('User-Agent')
  });
  next();
});

// API Routes
app.use('/api', apiRoutes);

// Root endpoint
app.get('/', (req, res) => {
  res.json({
    message: 'Welcome to Odd Genius API',
    version: '1.0.0',
    endpoints: ['/api/matches/live', '/api/matches/upcoming', '/api/stats']
  });
});

// 404 handler
app.use((req, res) => {
  logger.warn(`Route not found: ${req.method} ${req.url}`, { service: 'odd-genius-api' });
  res.status(404).json({
    success: false,
    message: 'Resource not found'
  });
});

// Error handling middleware
app.use((err, req, res, next) => {
  logger.error(`Error: ${err.message}`, { 
    service: 'odd-genius-api',
    error: err.stack,
    path: req.path
  });
  
  res.status(500).json({
    success: false,
    message: 'Internal Server Error',
    error: process.env.NODE_ENV === 'development' ? err.message : undefined
  });
});

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  logger.info(`Server running on port ${PORT}`, { service: 'odd-genius-api' });
  logger.info(`Environment: ${process.env.NODE_ENV || 'development'}`, { 
    service: 'odd-genius-api',
    apiKeyConfigured: process.env.RAPID_API_KEY ? 'Yes' : 'No'
  });
});

process.on('unhandledRejection', (reason, promise) => {
  logger.error(`Unhandled Rejection at: ${promise}, reason: ${reason}`, { service: 'odd-genius-api' });
});