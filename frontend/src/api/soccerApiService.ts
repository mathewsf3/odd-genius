import axios from 'axios';

const API_BASE_URL = 'http://localhost:5000/api';

export interface Match {
  id: string;
  league: {
    id: string;
    name: string;
    logo: string;
  };
  homeTeam: {
    id: string;
    name: string;
    logo: string;
    rating?: number;
  };
  awayTeam: {
    id: string;
    name: string;
    logo: string;
    rating?: number;
  };
  date: string;
  time: string;
  status: 'LIVE' | 'NS' | 'FT' | 'HT' | 'CANC';
  elapsed?: number;
  venue: string;
  score?: {
    home: number;
    away: number;
  };
  odds: {
    home: number;
    draw: number;
    away: number;
  };
  probability: {
    home: string;
    draw: string;
    away: string;
  };
  recommended?: 'home' | 'draw' | 'away';
  algorithm?: {
    recommendation: string;
    confidence: number;
    type: string;
  };
  isPromo?: boolean;
}

export interface StatsData {
  roi: {
    daily: Array<{date: string, value: number}>;
    weekly: number;
    monthly: number;
  };
  bets: {
    daily: Array<{date: string, wins: number, losses: number}>;
    totalWins: number;
    totalLosses: number;
    winRate: number;
  };
}

const soccerApiService = {
  getLiveMatches: async (): Promise<Match[]> => {
    try {
      console.log('Fetching live matches from API');
      const response = await axios.get(`${API_BASE_URL}/matches/live`);
      console.log('API response for live matches:', response.data);
      
      if (!response.data || !response.data.result) {
        throw new Error('Invalid API response format');
      }
      
      return response.data.result;
    } catch (error) {
      console.error('Error fetching live matches:', error);
      throw error; // Don't return empty array - throw error to prevent fallback data use
    }
  },
  
  getUpcomingMatches: async (hours = 24): Promise<Match[]> => {
    try {
      console.log(`Fetching upcoming matches for next ${hours} hours from API`);
      const response = await axios.get(`${API_BASE_URL}/matches/upcoming?hours=${hours}`);
      console.log('API response for upcoming matches:', response.data);
      
      if (!response.data || !response.data.result) {
        throw new Error('Invalid API response format');
      }
      
      return response.data.result;
    } catch (error) {
      console.error('Error fetching upcoming matches:', error);
      throw error; // Don't return empty array - throw error to prevent fallback data use
    }
  },
  
  getStats: async (period = 'week'): Promise<StatsData> => {
    try {
      console.log(`Fetching stats for period ${period} from API`);
      const response = await axios.get(`${API_BASE_URL}/stats?period=${period}`);
      console.log('API response for stats:', response.data);
      
      if (!response.data || !response.data.result) {
        throw new Error('Invalid API response format');
      }
      
      return response.data.result;
    } catch (error) {
      console.error('Error fetching stats:', error);
      throw error; // Don't return empty array - throw error to prevent fallback data use
    }
  }
};

export default soccerApiService;