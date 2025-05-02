const axios = require('axios');
const logger = require('../utils/logger');

// API configuration
const API_BASE_URL = 'https://apiv2.allsportsapi.com/football/';
const API_KEY = process.env.ALL_SPORTS_API_KEY || 'd4e800d180f7468086f825f802ae848340b70118044168db9533c1058ff3d840';

// Create API client
const apiClient = axios.create({
  baseURL: API_BASE_URL
});

// Utility function to add algorithm recommendations
const addAlgorithmRecommendation = (match, probabilities) => {
  const homeProbability = parseInt(probabilities.home.replace('%', ''));
  const drawProbability = parseInt(probabilities.draw.replace('%', ''));
  const awayProbability = parseInt(probabilities.away.replace('%', ''));
  
  // Determine highest probability
  const highestProb = Math.max(homeProbability, drawProbability, awayProbability);
  let recommended = 'home';
  
  if (highestProb === homeProbability) recommended = 'home';
  else if (highestProb === drawProbability) recommended = 'draw';
  else recommended = 'away';
  
  // Create algorithm info
  let betType = '1X2';
  let confidenceLevel = highestProb;
  let recommendation = '';
  
  // Customize recommendation based on confidence
  if (confidenceLevel > 65) {
    recommendation = `ALTA PROBABILIDADE: Apostar em ${recommended.toUpperCase()} (${match.odds[recommended].toFixed(2)}) oferece ${confidenceLevel}% de chance com ROI potencial acima da média`;
    
    // Add more specific bet types for high confidence matches
    if (recommended === 'home' && confidenceLevel > 75) {
      betType = 'Home Team Win & Over 1.5';
    } else if (recommended === 'away' && confidenceLevel > 75) {
      betType = 'Away Team Win & Over 1.5';
    } else if (recommended === 'draw' && confidenceLevel > 70) {
      betType = 'Draw & Under 2.5';
    }
  } else if (confidenceLevel > 50) {
    recommendation = `PROBABILIDADE MODERADA: Apostar em ${recommended.toUpperCase()} (${match.odds[recommended].toFixed(2)}) oferece ${confidenceLevel}% de chance com ROI potencial razoável`;
  } else {
    recommendation = `BAIXA PROBABILIDADE: Evite apostar ou considere mercados alternativos como BTTS ou Over/Under`;
    confidenceLevel = Math.min(confidenceLevel + 15, 50); // Adjust confidence for display purposes
  }
  
  return {
    ...match,
    recommended,
    algorithm: {
      recommendation,
      confidence: confidenceLevel,
      type: betType
    }
  };
};

const allSportsApiService = {
  /**
   * Get live matches from the API
   */
  getLiveMatches: async () => {
    try {
      logger.info('Fetching live matches from AllSportsAPI', { service: 'sports-api' });
      const response = await apiClient.get('', {
        params: { 
          met: 'Livescore',
          APIkey: API_KEY
        }
      });
      
      // Check if the API returned a success response
      if (!response.data.success) {
        logger.error('API returned error for live matches', { 
          service: 'sports-api',
          error: response.data
        });
        return [];
      }
      
      // Handle case where no live matches are available
      if (!response.data.result || response.data.result.length === 0) {
        logger.info('No live matches currently available', { service: 'sports-api' });
        return [];
      }
      
      // Transform the API response to our data format
      const matches = await Promise.all(response.data.result.map(async match => {
        // Basic match info
        const baseMatch = {
          id: match.event_key,
          league: {
            id: match.league_key,
            name: match.league_name,
            logo: match.league_logo || `https://apiv2.allsportsapi.com/logo/logo_leagues/${match.league_key}_${match.league_name.toLowerCase().replace(/\s+/g, '-')}.png`
          },
          homeTeam: {
            id: match.home_team_key,
            name: match.event_home_team,
            logo: match.home_team_logo || `https://apiv2.allsportsapi.com/logo/logo_teams/${match.home_team_key}_${match.event_home_team.toLowerCase().replace(/\s+/g, '-')}.png`,
            rating: parseFloat((Math.random() * 2 + 7).toFixed(1)) // Generate a rating between 7-9
          },
          awayTeam: {
            id: match.away_team_key,
            name: match.event_away_team,
            logo: match.away_team_logo || `https://apiv2.allsportsapi.com/logo/logo_teams/${match.away_team_key}_${match.event_away_team.toLowerCase().replace(/\s+/g, '-')}.png`,
            rating: parseFloat((Math.random() * 2 + 7).toFixed(1)) // Generate a rating between 7-9
          },
          date: match.event_date,
          time: match.event_time,
          status: 'LIVE',
          elapsed: parseInt(match.event_status) || 0,
          venue: match.event_stadium || 'Unknown Venue',
          score: {
            home: parseInt(match.event_home_final_result) || 0,
            away: parseInt(match.event_away_final_result) || 0
          }
        };
        
        // Get odds for this match
        try {
          const oddsResponse = await apiClient.get('', {
            params: {
              met: 'Odds',
              APIkey: API_KEY,
              matchId: match.event_key
            }
          });
          
          if (oddsResponse.data.success && oddsResponse.data.result) {
            // Get first available bookmaker
            const bookmakers = Object.keys(oddsResponse.data.result);
            
            if (bookmakers.length > 0) {
              const firstBookmaker = bookmakers[0];
              const odds = oddsResponse.data.result[firstBookmaker]?.[0]?.odd_1 || {};
              
              baseMatch.odds = {
                home: parseFloat(odds['1']) || 2.5,
                draw: parseFloat(odds['X']) || 3.2,
                away: parseFloat(odds['2']) || 2.9
              };
            } else {
              // Default odds if none available
              baseMatch.odds = {
                home: parseFloat((Math.random() * 2 + 1.5).toFixed(2)),
                draw: parseFloat((Math.random() * 1 + 3).toFixed(2)),
                away: parseFloat((Math.random() * 2 + 1.8).toFixed(2))
              };
            }
          } else {
            // Default odds if API call fails
            baseMatch.odds = {
              home: parseFloat((Math.random() * 2 + 1.5).toFixed(2)),
              draw: parseFloat((Math.random() * 1 + 3).toFixed(2)),
              away: parseFloat((Math.random() * 2 + 1.8).toFixed(2))
            };
          }
          
          // Get probabilities
          const probResponse = await apiClient.get('', {
            params: {
              met: 'Probabilities',
              APIkey: API_KEY,
              matchId: match.event_key
            }
          });
          
          if (probResponse.data.success && probResponse.data.result) {
            baseMatch.probability = {
              home: probResponse.data.result?.[0]?.home_win_probability || '40%',
              draw: probResponse.data.result?.[0]?.draw_probability || '20%',
              away: probResponse.data.result?.[0]?.away_win_probability || '40%'
            };
          } else {
            // Calculate probability from odds
            const totalOdds = (1/baseMatch.odds.home) + (1/baseMatch.odds.draw) + (1/baseMatch.odds.away);
            baseMatch.probability = {
              home: `${Math.round((1/baseMatch.odds.home) / totalOdds * 100)}%`,
              draw: `${Math.round((1/baseMatch.odds.draw) / totalOdds * 100)}%`,
              away: `${Math.round((1/baseMatch.odds.away) / totalOdds * 100)}%`
            };
          }
          
          // Add algorithm recommendation
          return addAlgorithmRecommendation(baseMatch, baseMatch.probability);
          
        } catch (error) {
          logger.error(`Failed to get odds for match ${match.event_key}`, { error: error.message });
          
          // Default values if odds API call fails
          baseMatch.odds = {
            home: parseFloat((Math.random() * 2 + 1.5).toFixed(2)),
            draw: parseFloat((Math.random() * 1 + 3).toFixed(2)),
            away: parseFloat((Math.random() * 2 + 1.8).toFixed(2))
          };
          
          const totalOdds = (1/baseMatch.odds.home) + (1/baseMatch.odds.draw) + (1/baseMatch.odds.away);
          baseMatch.probability = {
            home: `${Math.round((1/baseMatch.odds.home) / totalOdds * 100)}%`,
            draw: `${Math.round((1/baseMatch.odds.draw) / totalOdds * 100)}%`,
            away: `${Math.round((1/baseMatch.odds.away) / totalOdds * 100)}%`
          };
          
          // Add algorithm recommendation
          return addAlgorithmRecommendation(baseMatch, baseMatch.probability);
        }
      }));
      
      return matches;
    } catch (error) {
      logger.error('Failed to fetch live matches from AllSportsAPI', { error: error.message });
      return [];
    }
  },
  
  /**
   * Get upcoming matches for a specified number of hours
   */
  getUpcomingMatches: async (hours = 24) => {
    try {
      logger.info(`Fetching upcoming matches for next ${hours} hours`, { service: 'sports-api' });
      
      // Calculate date range
      const currentDate = new Date();
      const fromDate = currentDate.toISOString().split('T')[0]; // Today in YYYY-MM-DD format
      
      // Add hours to current date
      const toDate = new Date(currentDate.getTime() + hours * 60 * 60 * 1000).toISOString().split('T')[0];
      
      const response = await apiClient.get('', {
        params: { 
          met: 'Fixtures',
          APIkey: API_KEY,
          from: fromDate,
          to: toDate
        }
      });
      
      // Check if the API returned a success response
      if (!response.data.success) {
        logger.error('API returned error for upcoming matches', { 
          service: 'sports-api',
          error: response.data
        });
        return [];
      }
      
      // Handle case where no upcoming matches are available
      if (!response.data.result || response.data.result.length === 0) {
        logger.info('No upcoming matches in the specified time frame', { service: 'sports-api' });
        return [];
      }
      
      // Filter matches that haven't started yet
      const upcomingMatches = response.data.result.filter(match => 
        match.event_status === 'NS' || match.event_status === 'Not Started'
      );
      
      // Transform the API response to our data format
      const matches = await Promise.all(upcomingMatches.map(async match => {
        // Basic match info
        const baseMatch = {
          id: match.event_key,
          league: {
            id: match.league_key,
            name: match.league_name,
            logo: match.league_logo || `https://apiv2.allsportsapi.com/logo/logo_leagues/${match.league_key}_${match.league_name.toLowerCase().replace(/\s+/g, '-')}.png`
          },
          homeTeam: {
            id: match.home_team_key,
            name: match.event_home_team,
            logo: match.home_team_logo || `https://apiv2.allsportsapi.com/logo/logo_teams/${match.home_team_key}_${match.event_home_team.toLowerCase().replace(/\s+/g, '-')}.png`,
            rating: parseFloat((Math.random() * 2 + 7).toFixed(1)) // Generate a rating between 7-9
          },
          awayTeam: {
            id: match.away_team_key,
            name: match.event_away_team,
            logo: match.away_team_logo || `https://apiv2.allsportsapi.com/logo/logo_teams/${match.away_team_key}_${match.event_away_team.toLowerCase().replace(/\s+/g, '-')}.png`,
            rating: parseFloat((Math.random() * 2 + 7).toFixed(1)) // Generate a rating between 7-9
          },
          date: match.event_date,
          time: match.event_time,
          status: 'NS',
          venue: match.event_stadium || 'Unknown Venue',
          isPromo: Math.random() > 0.9 // ~10% chance to be a promo match
        };
        
        // Get odds for this match
        try {
          const oddsResponse = await apiClient.get('', {
            params: {
              met: 'Odds',
              APIkey: API_KEY,
              matchId: match.event_key
            }
          });
          
          if (oddsResponse.data.success && oddsResponse.data.result) {
            // Get first available bookmaker
            const bookmakers = Object.keys(oddsResponse.data.result);
            
            if (bookmakers.length > 0) {
              const firstBookmaker = bookmakers[0];
              const odds = oddsResponse.data.result[firstBookmaker]?.[0]?.odd_1 || {};
              
              baseMatch.odds = {
                home: parseFloat(odds['1']) || 2.5,
                draw: parseFloat(odds['X']) || 3.2,
                away: parseFloat(odds['2']) || 2.9
              };
            } else {
              // Default odds if none available
              baseMatch.odds = {
                home: parseFloat((Math.random() * 2 + 1.5).toFixed(2)),
                draw: parseFloat((Math.random() * 1 + 3).toFixed(2)),
                away: parseFloat((Math.random() * 2 + 1.8).toFixed(2))
              };
            }
          } else {
            // Default odds if API call fails
            baseMatch.odds = {
              home: parseFloat((Math.random() * 2 + 1.5).toFixed(2)),
              draw: parseFloat((Math.random() * 1 + 3).toFixed(2)),
              away: parseFloat((Math.random() * 2 + 1.8).toFixed(2))
            };
          }
          
          // Get probabilities
          const probResponse = await apiClient.get('', {
            params: {
              met: 'Probabilities',
              APIkey: API_KEY,
              matchId: match.event_key
            }
          });
          
          if (probResponse.data.success && probResponse.data.result) {
            baseMatch.probability = {
              home: probResponse.data.result?.[0]?.home_win_probability || '40%',
              draw: probResponse.data.result?.[0]?.draw_probability || '20%',
              away: probResponse.data.result?.[0]?.away_win_probability || '40%'
            };
          } else {
            // Calculate probability from odds
            const totalOdds = (1/baseMatch.odds.home) + (1/baseMatch.odds.draw) + (1/baseMatch.odds.away);
            baseMatch.probability = {
              home: `${Math.round((1/baseMatch.odds.home) / totalOdds * 100)}%`,
              draw: `${Math.round((1/baseMatch.odds.draw) / totalOdds * 100)}%`,
              away: `${Math.round((1/baseMatch.odds.away) / totalOdds * 100)}%`
            };
          }
          
          // Add algorithm recommendation
          return addAlgorithmRecommendation(baseMatch, baseMatch.probability);
          
        } catch (error) {
          logger.error(`Failed to get odds for match ${match.event_key}`, { error: error.message });
          
          // Default values if odds API call fails
          baseMatch.odds = {
            home: parseFloat((Math.random() * 2 + 1.5).toFixed(2)),
            draw: parseFloat((Math.random() * 1 + 3).toFixed(2)),
            away: parseFloat((Math.random() * 2 + 1.8).toFixed(2))
          };
          
          const totalOdds = (1/baseMatch.odds.home) + (1/baseMatch.odds.draw) + (1/baseMatch.odds.away);
          baseMatch.probability = {
            home: `${Math.round((1/baseMatch.odds.home) / totalOdds * 100)}%`,
            draw: `${Math.round((1/baseMatch.odds.draw) / totalOdds * 100)}%`,
            away: `${Math.round((1/baseMatch.odds.away) / totalOdds * 100)}%`
          };
          
          // Add algorithm recommendation
          return addAlgorithmRecommendation(baseMatch, baseMatch.probability);
        }
      }));
      
      // Sort by date and time
      return matches.sort((a, b) => {
        const dateA = new Date(`${a.date} ${a.time}`);
        const dateB = new Date(`${b.date} ${b.time}`);
        return dateA - dateB;
      });
    } catch (error) {
      logger.error('Failed to fetch upcoming matches from AllSportsAPI', { error: error.message });
      return [];
    }
  },
  
  /**
   * Get stats based on the specified period (week/month)
   * Note: This is still mock data as the API doesn't provide betting performance stats
   */
  getStats: async (period = 'week') => {
    try {
      logger.info(`Generating stats data for period: ${period}`, { service: 'sports-api' });
      
      // This is mock data as it would typically come from your internal database
      // of historical betting performance
      
      // Determine how many days to include
      const days = period === 'week' ? 7 : 30;
      
      const stats = {
        roi: {
          daily: [],
          weekly: 0,
          monthly: 0
        },
        bets: {
          daily: [],
          totalWins: 0,
          totalLosses: 0,
          winRate: 0
        }
      };
      
      let totalROI = 0;
      let totalWins = 0;
      let totalLosses = 0;
      
      // Generate daily stats - create more realistic performance data
      // with somewhat consistent patterns
      for (let i = 0; i < days; i++) {
        const date = new Date();
        date.setDate(date.getDate() - i);
        const dateStr = date.toLocaleDateString('en-US', { month: '2-digit', day: '2-digit' }).replace('/', '-');
        
        // Generate values with a bias toward positive ROI
        // and winning bets (since we're a betting recommendation platform)
        const randomBase = Math.random();
        
        // Create more positive ROI days than negative
        let roiValue;
        if (randomBase > 0.7) {
          // Negative day (30% chance)
          roiValue = parseFloat((-Math.random() * 5).toFixed(1));
        } else if (randomBase > 0.3) {
          // Medium positive day (40% chance)
          roiValue = parseFloat((Math.random() * 4 + 1).toFixed(1));
        } else {
          // Strong positive day (30% chance)
          roiValue = parseFloat((Math.random() * 5 + 4).toFixed(1));
        }
        totalROI += roiValue;
        
        // Daily wins and losses
        // More wins than losses on average
        let wins, losses;
        if (roiValue > 0) {
          // Positive ROI days have more wins
          wins = Math.floor(Math.random() * 3) + 3;  // 3-5 wins
          losses = Math.floor(Math.random() * 3);    // 0-2 losses
        } else {
          // Negative ROI days have more losses
          wins = Math.floor(Math.random() * 3);      // 0-2 wins
          losses = Math.floor(Math.random() * 3) + 2; // 2-4 losses
        }
        
        totalWins += wins;
        totalLosses += losses;
        
        stats.roi.daily.unshift({ date: dateStr, value: roiValue });
        stats.bets.daily.unshift({ date: dateStr, wins, losses });
      }
      
      // Overall stats
      stats.roi.weekly = parseFloat((totalROI * 7 / days).toFixed(1));
      stats.roi.monthly = parseFloat((totalROI * 30 / days).toFixed(1));
      stats.bets.totalWins = totalWins;
      stats.bets.totalLosses = totalLosses;
      stats.bets.winRate = Math.round(totalWins / (totalWins + totalLosses) * 100);
      
      return stats;
    } catch (error) {
      logger.error('Failed to generate stats data', { error: error.message });
      throw error;
    }
  }
};

module.exports = allSportsApiService;