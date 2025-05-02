/**
 * API Service for AllSportsAPI
 * Handles all external API calls to the football data provider
 */
const axios = require('axios');
const { API_BASE_URL, API_KEY } = require('../config/constants');
const logger = require('../utils/logger');
const cacheService = require('./cacheService');

class ApiService {
  constructor() {
    this.client = axios.create({
      baseURL: API_BASE_URL,
    });
    
    // Add response interceptor for error handling
    this.client.interceptors.response.use(
      response => response,
      error => {
        logger.error(`API Error: ${error.message}`, { 
          url: error.config?.url, 
          status: error.response?.status 
        });
        return Promise.reject(error);
      }
    );
  }

  /**
   * Make a GET request to the AllSportsAPI
   * @param {string} endpoint - API endpoint
   * @param {Object} params - URL parameters
   * @param {boolean} useCache - Whether to use caching
   * @returns {Promise<Object>} API response data
   */
  async get(endpoint, params = {}, useCache = true) {
    // Add API key to all requests
    const queryParams = { ...params, APIkey: API_KEY };
    
    // Generate cache key if caching is enabled
    const cacheKey = useCache ? `${endpoint}_${JSON.stringify(queryParams)}` : null;
    
    // Check cache first
    if (useCache) {
      const cachedData = await cacheService.get(cacheKey);
      if (cachedData) {
        logger.info(`Cache hit for ${cacheKey}`);
        return cachedData;
      }
    }
    
    try {
      const response = await this.client.get(endpoint, { params: queryParams });
      
      // Validate response structure
      if (response.data && response.data.success === 1) {
        // Store in cache if caching is enabled
        if (useCache) {
          await cacheService.set(cacheKey, response.data);
        }
        return response.data;
      } else {
        throw new Error(`API returned error: ${JSON.stringify(response.data)}`);
      }
    } catch (error) {
      logger.error(`Failed to fetch data from ${endpoint}`, { error: error.message });
      throw error;
    }
  }
}

module.exports = new ApiService();