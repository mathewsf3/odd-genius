/**
 * Application constants
 */
require('dotenv').config();

module.exports = {
  // API configuration
  API_BASE_URL: process.env.API_BASE_URL || 'https://apiv2.allsportsapi.com/football/',
  API_KEY: process.env.API_KEY || 'd4e800d180f7468086f825f802ae848340b70118044168db9533c1058ff3d840',
  
  // Server configuration
  PORT: process.env.PORT || 5000,
  NODE_ENV: process.env.NODE_ENV || 'development',
  
  // Cache configuration
  CACHE_DURATION: {
    SHORT: 60 * 5, // 5 minutes (for frequently changing data)
    MEDIUM: 60 * 60, // 1 hour (for semi-static data)
    LONG: 60 * 60 * 24, // 24 hours (for static data like countries)
  },
  
  // Rate limiting
  RATE_LIMIT: {
    WINDOW_MS: 15 * 60 * 1000, // 15 minutes
    MAX_REQUESTS: 100, // limit each IP to 100 requests per windowMs
  },
  
  // Endpoints
  ENDPOINTS: {
    COUNTRIES: 'Countries',
    LEAGUES: 'Leagues',
    FIXTURES: 'Fixtures',
    LIVESCORE: 'Livescore',
    H2H: 'H2H',
    STANDINGS: 'Standings',
    ODDS: 'Odds',
    PROBABILITIES: 'Probabilities',
  },
};