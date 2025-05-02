const express = require('express');
const router = express.Router();
const logger = require('../utils/logger');
const allSportsApiService = require('../services/allSportsApiService');

// Error handler middleware
const asyncHandler = fn => (req, res, next) => {
  Promise.resolve(fn(req, res, next)).catch(next);
};

// Live matches endpoint
router.get('/matches/live', asyncHandler(async (req, res) => {
  logger.info('API Request: Get live matches', { service: 'odd-genius-api' });
  
  const liveMatches = await allSportsApiService.getLiveMatches();
  
  res.json({
    success: true,
    result: liveMatches
  });
}));

// Upcoming matches endpoint
router.get('/matches/upcoming', asyncHandler(async (req, res) => {
  // Get hours parameter with default of 24
  const hours = parseInt(req.query.hours) || 24;
  
  logger.info(`API Request: Get upcoming matches for next ${hours} hours`, { service: 'odd-genius-api' });
  
  const upcomingMatches = await allSportsApiService.getUpcomingMatches(hours);
  
  res.json({
    success: true,
    result: upcomingMatches
  });
}));

// Stats endpoint
router.get('/stats', asyncHandler(async (req, res) => {
  // Get period parameter with default of 'week'
  const period = req.query.period || 'week';
  
  logger.info(`API Request: Get stats for period: ${period}`, { service: 'odd-genius-api' });
  
  const statsData = await allSportsApiService.getStats(period);
  
  res.json({
    success: true,
    result: statsData
  });
}));

// Health check endpoint
router.get('/health', (req, res) => {
  res.json({
    status: 'UP',
    timestamp: new Date().toISOString()
  });
});

module.exports = router;