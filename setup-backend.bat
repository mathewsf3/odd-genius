@echo off
setlocal enabledelayedexpansion

echo Creating Odd Genius Backend Structure...

REM Create main directories
mkdir "C:\Users\mathe\OneDrive\Desktop\odd-genius\backend"
cd "C:\Users\mathe\OneDrive\Desktop\odd-genius\backend"

mkdir src
mkdir src\api
mkdir src\api\controllers
mkdir src\api\routes
mkdir src\config
mkdir src\middleware
mkdir src\services
mkdir src\utils
mkdir logs

REM Create package.json
echo {> package.json
echo   "name": "odd-genius-backend",>> package.json
echo   "version": "1.0.0",>> package.json
echo   "description": "Backend API for Odd Genius soccer betting platform",>> package.json
echo   "main": "src/server.js",>> package.json
echo   "scripts": {>> package.json
echo     "start": "node src/server.js",>> package.json
echo     "dev": "nodemon src/server.js",>> package.json
echo     "test": "jest">> package.json
echo   },>> package.json
echo   "dependencies": {>> package.json
echo     "axios": "^1.4.0",>> package.json
echo     "compression": "^1.7.4",>> package.json
echo     "cors": "^2.8.5",>> package.json
echo     "dotenv": "^16.0.3",>> package.json
echo     "express": "^4.18.2",>> package.json
echo     "express-rate-limit": "^6.7.0",>> package.json
echo     "helmet": "^7.0.0",>> package.json
echo     "memory-cache": "^0.2.0",>> package.json
echo     "morgan": "^1.10.0",>> package.json
echo     "winston": "^3.8.2">> package.json
echo   },>> package.json
echo   "devDependencies": {>> package.json
echo     "jest": "^29.5.0",>> package.json
echo     "nodemon": "^2.0.22",>> package.json
echo     "supertest": "^6.3.3">> package.json
echo   }>> package.json
echo }>> package.json

REM Create environment file
echo # API Configuration> .env
echo API_KEY=d4e800d180f7468086f825f802ae848340b70118044168db9533c1058ff3d840>> .env
echo API_BASE_URL=https://apiv2.allsportsapi.com/football/>> .env
echo. >> .env
echo # Server Configuration>> .env
echo PORT=5000>> .env
echo NODE_ENV=development>> .env
echo. >> .env
echo # Cache Configuration>> .env
echo CACHE_TTL=300>> .env

REM Create example environment file
echo # API Configuration> .env.example
echo API_KEY=your_api_key_here>> .env.example
echo API_BASE_URL=https://apiv2.allsportsapi.com/football/>> .env.example
echo. >> .env.example
echo # Server Configuration>> .env.example
echo PORT=5000>> .env.example
echo NODE_ENV=development>> .env.example
echo. >> .env.example
echo # Cache Configuration>> .env.example
echo CACHE_TTL=300>> .env.example

REM Create core backend files
echo /**> src\server.js
echo  * Server entry point>> src\server.js
echo  */>> src\server.js
echo require('dotenv').config();>> src\server.js
echo const app = require('./app');>> src\server.js
echo const { PORT } = require('./config/constants');>> src\server.js
echo const logger = require('./utils/logger');>> src\server.js
echo. >> src\server.js
echo // Start the server>> src\server.js
echo const port = PORT || 5000;>> src\server.js
echo app.listen(port, () => {>> src\server.js
echo   logger.info(`Server running on port ${port}`);>> src\server.js
echo   logger.info(`Environment: ${process.env.NODE_ENV || 'development'}`);>> src\server.js
echo });>> src\server.js
echo. >> src\server.js
echo // Handle uncaught exceptions>> src\server.js
echo process.on('uncaughtException', (error) => {>> src\server.js
echo   logger.error('Uncaught Exception:', error);>> src\server.js
echo   // Graceful shutdown>> src\server.js
echo   process.exit(1);>> src\server.js
echo });>> src\server.js
echo. >> src\server.js
echo // Handle unhandled promise rejections>> src\server.js
echo process.on('unhandledRejection', (reason, promise) => {>> src\server.js
echo   logger.error('Unhandled Rejection at:', promise, 'reason:', reason);>> src\server.js
echo   // Graceful shutdown>> src\server.js
echo   process.exit(1);>> src\server.js
echo });>> src\server.js

echo /**> src\app.js
echo  * Express application setup>> src\app.js
echo  */>> src\app.js
echo const express = require('express');>> src\app.js
echo const cors = require('cors');>> src\app.js
echo const helmet = require('helmet');>> src\app.js
echo const compression = require('compression');>> src\app.js
echo const morgan = require('morgan');>> src\app.js
echo const rateLimit = require('express-rate-limit');>> src\app.js
echo const { RATE_LIMIT } = require('./config/constants');>> src\app.js
echo const routes = require('./api/routes');>> src\app.js
echo const errorMiddleware = require('./middleware/errorMiddleware');>> src\app.js
echo const logger = require('./utils/logger');>> src\app.js
echo. >> src\app.js
echo // Initialize express app>> src\app.js
echo const app = express();>> src\app.js
echo. >> src\app.js
echo // Security headers>> src\app.js
echo app.use(helmet());>> src\app.js
echo. >> src\app.js
echo // CORS setup>> src\app.js
echo app.use(cors());>> src\app.js
echo. >> src\app.js
echo // HTTP request logging>> src\app.js
echo app.use(morgan('dev'));>> src\app.js
echo. >> src\app.js
echo // Compress responses>> src\app.js
echo app.use(compression());>> src\app.js
echo. >> src\app.js
echo // Request parsing>> src\app.js
echo app.use(express.json());>> src\app.js
echo app.use(express.urlencoded({ extended: true }));>> src\app.js
echo. >> src\app.js
echo // Rate limiting>> src\app.js
echo const limiter = rateLimit({>> src\app.js
echo   windowMs: RATE_LIMIT.WINDOW_MS,>> src\app.js
echo   max: RATE_LIMIT.MAX_REQUESTS,>> src\app.js
echo   standardHeaders: true,>> src\app.js
echo   message: {>> src\app.js
echo     status: 429,>> src\app.js
echo     message: 'Too many requests, please try again later',>> src\app.js
echo   },>> src\app.js
echo });>> src\app.js
echo app.use(limiter);>> src\app.js
echo. >> src\app.js
echo // Request logging>> src\app.js
echo app.use((req, res, next) => {>> src\app.js
echo   logger.info(`${req.method} ${req.url}`);>> src\app.js
echo   next();>> src\app.js
echo });>> src\app.js
echo. >> src\app.js
echo // API routes>> src\app.js
echo app.use('/api', routes);>> src\app.js
echo. >> src\app.js
echo // Health check endpoint>> src\app.js
echo app.get('/health', (req, res) => {>> src\app.js
echo   res.status(200).json({ status: 'ok', timestamp: new Date().toISOString() });>> src\app.js
echo });>> src\app.js
echo. >> src\app.js
echo // Error handling>> src\app.js
echo app.use(errorMiddleware);>> src\app.js
echo. >> src\app.js
echo // 404 handler>> src\app.js
echo app.use((req, res) => {>> src\app.js
echo   res.status(404).json({>> src\app.js
echo     status: 404,>> src\app.js
echo     message: 'Resource not found',>> src\app.js
echo   });>> src\app.js
echo });>> src\app.js
echo. >> src\app.js
echo module.exports = app;>> src\app.js

REM Create configuration files
echo /**> src\config\constants.js
echo  * Application constants>> src\config\constants.js
echo  */>> src\config\constants.js
echo require('dotenv').config();>> src\config\constants.js
echo. >> src\config\constants.js
echo module.exports = {>> src\config\constants.js
echo   // API configuration>> src\config\constants.js
echo   API_BASE_URL: process.env.API_BASE_URL || 'https://apiv2.allsportsapi.com/football/',>> src\config\constants.js
echo   API_KEY: process.env.API_KEY || 'd4e800d180f7468086f825f802ae848340b70118044168db9533c1058ff3d840',>> src\config\constants.js
echo   >> src\config\constants.js
echo   // Server configuration>> src\config\constants.js
echo   PORT: process.env.PORT || 5000,>> src\config\constants.js
echo   NODE_ENV: process.env.NODE_ENV || 'development',>> src\config\constants.js
echo   >> src\config\constants.js
echo   // Cache configuration>> src\config\constants.js
echo   CACHE_DURATION: {>> src\config\constants.js
echo     SHORT: 60 * 5, // 5 minutes (for frequently changing data)>> src\config\constants.js
echo     MEDIUM: 60 * 60, // 1 hour (for semi-static data)>> src\config\constants.js
echo     LONG: 60 * 60 * 24, // 24 hours (for static data like countries)>> src\config\constants.js
echo   },>> src\config\constants.js
echo   >> src\config\constants.js
echo   // Rate limiting>> src\config\constants.js
echo   RATE_LIMIT: {>> src\config\constants.js
echo     WINDOW_MS: 15 * 60 * 1000, // 15 minutes>> src\config\constants.js
echo     MAX_REQUESTS: 100, // limit each IP to 100 requests per windowMs>> src\config\constants.js
echo   },>> src\config\constants.js
echo   >> src\config\constants.js
echo   // Endpoints>> src\config\constants.js
echo   ENDPOINTS: {>> src\config\constants.js
echo     COUNTRIES: 'Countries',>> src\config\constants.js
echo     LEAGUES: 'Leagues',>> src\config\constants.js
echo     FIXTURES: 'Fixtures',>> src\config\constants.js
echo     LIVESCORE: 'Livescore',>> src\config\constants.js
echo     H2H: 'H2H',>> src\config\constants.js
echo     STANDINGS: 'Standings',>> src\config\constants.js
echo     ODDS: 'Odds',>> src\config\constants.js
echo     PROBABILITIES: 'Probabilities',>> src\config\constants.js
echo   },>> src\config\constants.js
echo };>> src\config\constants.js

REM Create utilities
echo /**> src\utils\logger.js
echo  * Logger utility>> src\utils\logger.js
echo  */>> src\utils\logger.js
echo const winston = require('winston');>> src\utils\logger.js
echo const { NODE_ENV } = require('../config/constants');>> src\utils\logger.js
echo. >> src\utils\logger.js
echo // Define log format>> src\utils\logger.js
echo const logFormat = winston.format.combine(>> src\utils\logger.js
echo   winston.format.timestamp({ format: 'YYYY-MM-DD HH:mm:ss' }),>> src\utils\logger.js
echo   winston.format.errors({ stack: true }),>> src\utils\logger.js
echo   winston.format.splat(),>> src\utils\logger.js
echo   winston.format.json()>> src\utils\logger.js
echo );>> src\utils\logger.js
echo. >> src\utils\logger.js
echo // Create console transport with colorization for development>> src\utils\logger.js
echo const consoleTransport = new winston.transports.Console({>> src\utils\logger.js
echo   format: winston.format.combine(>> src\utils\logger.js
echo     winston.format.colorize(),>> src\utils\logger.js
echo     winston.format.printf(({ timestamp, level, message, ...meta }) => {>> src\utils\logger.js
echo       return `${timestamp} [${level}]: ${message} ${>> src\utils\logger.js
echo         Object.keys(meta).length ? JSON.stringify(meta, null, 2) : ''>> src\utils\logger.js
echo       }`;>> src\utils\logger.js
echo     })>> src\utils\logger.js
echo   ),>> src\utils\logger.js
echo });>> src\utils\logger.js
echo. >> src\utils\logger.js
echo // Create the logger>> src\utils\logger.js
echo const logger = winston.createLogger({>> src\utils\logger.js
echo   level: NODE_ENV !== 'production' ? 'debug' : 'info',>> src\utils\logger.js
echo   format: logFormat,>> src\utils\logger.js
echo   defaultMeta: { service: 'odd-genius-api' },>> src\utils\logger.js
echo   transports: [consoleTransport],>> src\utils\logger.js
echo });>> src\utils\logger.js
echo. >> src\utils\logger.js
echo // If we're in production, add file transport>> src\utils\logger.js
echo if (NODE_ENV === 'production') {>> src\utils\logger.js
echo   logger.add(>> src\utils\logger.js
echo     new winston.transports.File({ filename: 'logs/error.log', level: 'error' })>> src\utils\logger.js
echo   );>> src\utils\logger.js
echo   logger.add(new winston.transports.File({ filename: 'logs/combined.log' }));>> src\utils\logger.js
echo }>> src\utils\logger.js
echo. >> src\utils\logger.js
echo module.exports = logger;>> src\utils\logger.js

echo /**> src\utils\errorHandler.js
echo  * Error handling utilities>> src\utils\errorHandler.js
echo  */>> src\utils\errorHandler.js
echo. >> src\utils\errorHandler.js
echo /**>> src\utils\errorHandler.js
echo  * Custom API error class>> src\utils\errorHandler.js
echo  */>> src\utils\errorHandler.js
echo class ApiError extends Error {>> src\utils\errorHandler.js
echo   constructor(statusCode, message, isOperational = true, stack = '') {>> src\utils\errorHandler.js
echo     super(message);>> src\utils\errorHandler.js
echo     this.statusCode = statusCode;>> src\utils\errorHandler.js
echo     this.isOperational = isOperational;>> src\utils\errorHandler.js
echo     >> src\utils\errorHandler.js
echo     if (stack) {>> src\utils\errorHandler.js
echo       this.stack = stack;>> src\utils\errorHandler.js
echo     } else {>> src\utils\errorHandler.js
echo       Error.captureStackTrace(this, this.constructor);>> src\utils\errorHandler.js
echo     }>> src\utils\errorHandler.js
echo   }>> src\utils\errorHandler.js
echo }>> src\utils\errorHandler.js
echo. >> src\utils\errorHandler.js
echo /**>> src\utils\errorHandler.js
echo  * Handle 404 not found error>> src\utils\errorHandler.js
echo  */>> src\utils\errorHandler.js
echo const notFound = (req, res, next) => {>> src\utils\errorHandler.js
echo   const error = new ApiError(404, `Resource not found - ${req.originalUrl}`);>> src\utils\errorHandler.js
echo   next(error);>> src\utils\errorHandler.js
echo };>> src\utils\errorHandler.js
echo. >> src\utils\errorHandler.js
echo /**>> src\utils\errorHandler.js
echo  * Handle all errors>> src\utils\errorHandler.js
echo  */>> src\utils\errorHandler.js
echo const errorHandler = (err, req, res, next) => {>> src\utils\errorHandler.js
echo   const statusCode = err.statusCode || 500;>> src\utils\errorHandler.js
echo   const message = err.message || 'Something went wrong';>> src\utils\errorHandler.js
echo   >> src\utils\errorHandler.js
echo   res.status(statusCode).json({>> src\utils\errorHandler.js
echo     success: false,>> src\utils\errorHandler.js
echo     status: statusCode,>> src\utils\errorHandler.js
echo     message,>> src\utils\errorHandler.js
echo     stack: process.env.NODE_ENV === 'development' ? err.stack : undefined,>> src\utils\errorHandler.js
echo   });>> src\utils\errorHandler.js
echo };>> src\utils\errorHandler.js
echo. >> src\utils\errorHandler.js
echo module.exports = {>> src\utils\errorHandler.js
echo   ApiError,>> src\utils\errorHandler.js
echo   notFound,>> src\utils\errorHandler.js
echo   errorHandler,>> src\utils\errorHandler.js
echo };>> src\utils\errorHandler.js

REM Create middleware
echo /**> src\middleware\errorMiddleware.js
echo  * Error handling middleware>> src\middleware\errorMiddleware.js
echo  */>> src\middleware\errorMiddleware.js
echo const logger = require('../utils/logger');>> src\middleware\errorMiddleware.js
echo. >> src\middleware\errorMiddleware.js
echo const errorMiddleware = (err, req, res, next) => {>> src\middleware\errorMiddleware.js
echo   // Set default values>> src\middleware\errorMiddleware.js
echo   const statusCode = err.statusCode || 500;>> src\middleware\errorMiddleware.js
echo   const message = err.message || 'Something went wrong';>> src\middleware\errorMiddleware.js
echo   >> src\middleware\errorMiddleware.js
echo   // Log the error>> src\middleware\errorMiddleware.js
echo   if (statusCode >= 500) {>> src\middleware\errorMiddleware.js
echo     logger.error(`${statusCode} - ${message}`, { >> src\middleware\errorMiddleware.js
echo       path: req.path,>> src\middleware\errorMiddleware.js
echo       method: req.method,>> src\middleware\errorMiddleware.js
echo       error: err.stack >> src\middleware\errorMiddleware.js
echo     });>> src\middleware\errorMiddleware.js
echo   } else {>> src\middleware\errorMiddleware.js
echo     logger.warn(`${statusCode} - ${message}`, { >> src\middleware\errorMiddleware.js
echo       path: req.path,>> src\middleware\errorMiddleware.js
echo       method: req.method>> src\middleware\errorMiddleware.js
echo     });>> src\middleware\errorMiddleware.js
echo   }>> src\middleware\errorMiddleware.js
echo   >> src\middleware\errorMiddleware.js
echo   // Send response>> src\middleware\errorMiddleware.js
echo   res.status(statusCode).json({>> src\middleware\errorMiddleware.js
echo     success: false,>> src\middleware\errorMiddleware.js
echo     status: statusCode,>> src\middleware\errorMiddleware.js
echo     message,>> src\middleware\errorMiddleware.js
echo     // Include stack trace only in development>> src\middleware\errorMiddleware.js
echo     ...(process.env.NODE_ENV !== 'production' && { stack: err.stack }),>> src\middleware\errorMiddleware.js
echo   });>> src\middleware\errorMiddleware.js
echo };>> src\middleware\errorMiddleware.js
echo. >> src\middleware\errorMiddleware.js
echo module.exports = errorMiddleware;>> src\middleware\errorMiddleware.js

REM Create services
echo /**> src\services\apiService.js
echo  * API Service for AllSportsAPI>> src\services\apiService.js
echo  * Handles all external API calls to the football data provider>> src\services\apiService.js
echo  */>> src\services\apiService.js
echo const axios = require('axios');>> src\services\apiService.js
echo const { API_BASE_URL, API_KEY } = require('../config/constants');>> src\services\apiService.js
echo const logger = require('../utils/logger');>> src\services\apiService.js
echo const cacheService = require('./cacheService');>> src\services\apiService.js
echo. >> src\services\apiService.js
echo class ApiService {>> src\services\apiService.js
echo   constructor() {>> src\services\apiService.js
echo     this.client = axios.create({>> src\services\apiService.js
echo       baseURL: API_BASE_URL,>> src\services\apiService.js
echo     });>> src\services\apiService.js
echo     >> src\services\apiService.js
echo     // Add response interceptor for error handling>> src\services\apiService.js
echo     this.client.interceptors.response.use(>> src\services\apiService.js
echo       response => response,>> src\services\apiService.js
echo       error => {>> src\services\apiService.js
echo         logger.error(`API Error: ${error.message}`, { >> src\services\apiService.js
echo           url: error.config?.url, >> src\services\apiService.js
echo           status: error.response?.status >> src\services\apiService.js
echo         });>> src\services\apiService.js
echo         return Promise.reject(error);>> src\services\apiService.js
echo       }>> src\services\apiService.js
echo     );>> src\services\apiService.js
echo   }>> src\services\apiService.js
echo. >> src\services\apiService.js
echo   /**>> src\services\apiService.js
echo    * Make a GET request to the AllSportsAPI>> src\services\apiService.js
echo    * @param {string} endpoint - API endpoint>> src\services\apiService.js
echo    * @param {Object} params - URL parameters>> src\services\apiService.js
echo    * @param {boolean} useCache - Whether to use caching>> src\services\apiService.js
echo    * @returns {Promise<Object>} API response data>> src\services\apiService.js
echo    */>> src\services\apiService.js
echo   async get(endpoint, params = {}, useCache = true) {>> src\services\apiService.js
echo     // Add API key to all requests>> src\services\apiService.js
echo     const queryParams = { ...params, APIkey: API_KEY };>> src\services\apiService.js
echo     >> src\services\apiService.js
echo     // Generate cache key if caching is enabled>> src\services\apiService.js
echo     const cacheKey = useCache ? `${endpoint}_${JSON.stringify(queryParams)}` : null;>> src\services\apiService.js
echo     >> src\services\apiService.js
echo     // Check cache first>> src\services\apiService.js
echo     if (useCache) {>> src\services\apiService.js
echo       const cachedData = await cacheService.get(cacheKey);>> src\services\apiService.js
echo       if (cachedData) {>> src\services\apiService.js
echo         logger.info(`Cache hit for ${cacheKey}`);>> src\services\apiService.js
echo         return cachedData;>> src\services\apiService.js
echo       }>> src\services\apiService.js
echo     }>> src\services\apiService.js
echo     >> src\services\apiService.js
echo     try {>> src\services\apiService.js
echo       const response = await this.client.get(endpoint, { params: queryParams });>> src\services\apiService.js
echo       >> src\services\apiService.js
echo       // Validate response structure>> src\services\apiService.js
echo       if (response.data && response.data.success === 1) {>> src\services\apiService.js
echo         // Store in cache if caching is enabled>> src\services\apiService.js
echo         if (useCache) {>> src\services\apiService.js
echo           await cacheService.set(cacheKey, response.data);>> src\services\apiService.js
echo         }>> src\services\apiService.js
echo         return response.data;>> src\services\apiService.js
echo       } else {>> src\services\apiService.js
echo         throw new Error(`API returned error: ${JSON.stringify(response.data)}`);>> src\services\apiService.js
echo       }>> src\services\apiService.js
echo     } catch (error) {>> src\services\apiService.js
echo       logger.error(`Failed to fetch data from ${endpoint}`, { error: error.message });>> src\services\apiService.js
echo       throw error;>> src\services\apiService.js
echo     }>> src\services\apiService.js
echo   }>> src\services\apiService.js
echo }>> src\services\apiService.js
echo. >> src\services\apiService.js
echo module.exports = new ApiService();>> src\services\apiService.js

echo /**> src\services\cacheService.js
echo  * Cache service using memory-cache>> src\services\cacheService.js
echo  */>> src\services\cacheService.js
echo const cache = require('memory-cache');>> src\services\cacheService.js
echo const { CACHE_DURATION } = require('../config/constants');>> src\services\cacheService.js
echo const logger = require('../utils/logger');>> src\services\cacheService.js
echo. >> src\services\cacheService.js
echo class CacheService {>> src\services\cacheService.js
echo   /**>> src\services\cacheService.js
echo    * Get item from cache>> src\services\cacheService.js
echo    * @param {string} key - Cache key>> src\services\cacheService.js
echo    * @returns {Promise<any>} Cached value or null>> src\services\cacheService.js
echo    */>> src\services\cacheService.js
echo   async get(key) {>> src\services\cacheService.js
echo     try {>> src\services\cacheService.js
echo       const value = cache.get(key);>> src\services\cacheService.js
echo       return value || null;>> src\services\cacheService.js
echo     } catch (error) {>> src\services\cacheService.js
echo       logger.error(`Cache get error for key ${key}:`, error);>> src\services\cacheService.js
echo       return null;>> src\services\cacheService.js
echo     }>> src\services\cacheService.js
echo   }>> src\services\cacheService.js
echo. >> src\services\cacheService.js
echo   /**>> src\services\cacheService.js
echo    * Set item in cache with expiration>> src\services\cacheService.js
echo    * @param {string} key - Cache key>> src\services\cacheService.js
echo    * @param {any} value - Value to cache>> src\services\cacheService.js
echo    * @param {number} ttl - Time to live in seconds>> src\services\cacheService.js
echo    * @returns {Promise<boolean>} Success status>> src\services\cacheService.js
echo    */>> src\services\cacheService.js
echo   async set(key, value, ttl = CACHE_DURATION.SHORT) {>> src\services\cacheService.js
echo     try {>> src\services\cacheService.js
echo       cache.put(key, value, ttl * 1000); // Convert seconds to milliseconds>> src\services\cacheService.js
echo       return true;>> src\services\cacheService.js
echo     } catch (error) {>> src\services\cacheService.js
echo       logger.error(`Cache set error for key ${key}:`, error);>> src\services\cacheService.js
echo       return false;>> src\services\cacheService.js
echo     }>> src\services\cacheService.js
echo   }>> src\services\cacheService.js
echo. >> src\services\cacheService.js
echo   /**>> src\services\cacheService.js
echo    * Delete item from cache>> src\services\cacheService.js
echo    * @param {string} key - Cache key>> src\services\cacheService.js
echo    * @returns {Promise<boolean>} Success status>> src\services\cacheService.js
echo    */>> src\services\cacheService.js
echo   async del(key) {>> src\services\cacheService.js
echo     try {>> src\services\cacheService.js
echo       cache.del(key);>> src\services\cacheService.js
echo       return true;>> src\services\cacheService.js
echo     } catch (error) {>> src\services\cacheService.js
echo       logger.error(`Cache delete error for key ${key}:`, error);>> src\services\cacheService.js
echo       return false;>> src\services\cacheService.js
echo     }>> src\services\cacheService.js
echo   }>> src\services\cacheService.js
echo. >> src\services\cacheService.js
echo   /**>> src\services\cacheService.js
echo    * Delete all items from cache>> src\services\cacheService.js
echo    * @returns {Promise<boolean>} Success status>> src\services\cacheService.js
echo    */>> src\services\cacheService.js
echo   async flush() {>> src\services\cacheService.js
echo     try {>> src\services\cacheService.js
echo       cache.clear();>> src\services\cacheService.js
echo       return true;>> src\services\cacheService.js
echo     } catch (error) {>> src\services\cacheService.js
echo       logger.error('Cache flush error:', error);>> src\services\cacheService.js
echo       return false;>> src\services\cacheService.js
echo     }>> src\services\cacheService.js
echo   }>> src\services\cacheService.js
echo }>> src\services\cacheService.js
echo. >> src\services\cacheService.js
echo module.exports = new CacheService();>> src\services\cacheService.js

REM Create API routes
echo /**> src\api\routes\index.js
echo  * API routes index>> src\api\routes\index.js
echo  */>> src\api\routes\index.js
echo const express = require('express');>> src\api\routes\index.js
echo const router = express.Router();>> src\api\routes\index.js
echo. >> src\api\routes\index.js
echo // API status endpoint>> src\api\routes\index.js
echo router.get('/status', (req, res) => {>> src\api\routes\index.js
echo   res.json({>> src\api\routes\index.js
echo     status: 'ok',>> src\api\routes\index.js
echo     timestamp: new Date().toISOString(),>> src\api\routes\index.js
echo     version: '1.0.0'>> src\api\routes\index.js
echo   });>> src\api\routes\index.js
echo });>> src\api\routes\index.js
echo. >> src\api\routes\index.js
echo module.exports = router;>> src\api\routes\index.js

echo Backend setup completed successfully!