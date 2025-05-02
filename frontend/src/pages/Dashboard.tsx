import React, { useState, useEffect } from 'react';
import styled, { keyframes, css } from 'styled-components';
import { Link } from 'react-router-dom';
import DashboardLayout from '../components/layout/DashboardLayout';
// Remove unused imports to fix ESLint warnings
import {
  BarChart, Bar, XAxis, YAxis, CartesianGrid, 
  Tooltip, Legend, ResponsiveContainer, AreaChart, Area
} from 'recharts';
import soccerApiService, { Match, StatsData } from '../api/soccerApiService';

// ANIMATIONS
const fadeIn = keyframes`
  from { opacity: 0; transform: translateY(10px); }
  to { opacity: 1; transform: translateY(0); }
`;

const pulse = keyframes`
  0% { opacity: 1; }
  50% { opacity: 0.7; }
  100% { opacity: 1; }
`;

// STYLED COMPONENTS
const DashboardContainer = styled.div`
  display: grid;
  grid-template-columns: 1fr;
  gap: 1.75rem;
  animation: ${css`${fadeIn} 0.5s ease-out forwards`};
`;

const WelcomeSection = styled.div`
  margin: 0.5rem 0 1.5rem;
  position: relative;
`;

const Title = styled.h1`
  font-size: 2.25rem;
  font-weight: 700;
  margin-bottom: 0.5rem;
  background: linear-gradient(45deg, #6366F1, #A855F7);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  letter-spacing: -0.5px;
`;

const Subtitle = styled.p`
  color: #B4B4C6;
  font-size: 1.1rem;
`;

const SectionHeader = styled.div`
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 1.25rem;
`;

const SectionTitle = styled.h2`
  font-size: 1.5rem;
  font-weight: 600;
  display: flex;
  align-items: center;
  
  svg {
    margin-right: 0.75rem;
    color: #6366F1;
  }
`;

const ViewAllButton = styled(Link)`
  font-size: 0.9rem;
  color: #6366F1;
  text-decoration: none;
  display: flex;
  align-items: center;
  font-weight: 500;
  padding: 0.5rem 0.75rem;
  border-radius: 6px;
  transition: all 0.2s;
  
  &:hover {
    background-color: rgba(99, 102, 241, 0.1);
    text-decoration: none;
  }
  
  svg {
    margin-left: 0.375rem;
  }
`;

const StatsGrid = styled.div`
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 1.5rem;
  
  @media (max-width: 1100px) {
    grid-template-columns: 1fr;
  }
`;

const StatsCard = styled.div`
  background: linear-gradient(145deg, #1E1E2D, #252535);
  border-radius: 12px;
  padding: 1.75rem;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
`;

const StatsCardHeader = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 1.5rem;
`;

const StatsCardTitle = styled.h3`
  font-size: 1.125rem;
  font-weight: 600;
  color: #F8FAFC;
`;

const Highlight = styled.span<{positive?: boolean, neutral?: boolean}>`
  color: ${props => props.positive ? '#34D399' : 
         (props.neutral ? '#F59E0B' : 
         (props.positive === false ? '#F87171' : '#6366F1'))};
  font-weight: 600;
`;

const StatFilterTabs = styled.div`
  display: flex;
  gap: 0.5rem;
`;

const StatFilterTab = styled.button<{active: boolean}>`
  background: ${props => props.active ? 'rgba(99, 102, 241, 0.15)' : 'transparent'};
  border: 1px solid ${props => props.active ? '#6366F1' : 'transparent'};
  color: ${props => props.active ? '#6366F1' : '#B4B4C6'};
  border-radius: 6px;
  padding: 0.25rem 0.75rem;
  font-size: 0.75rem;
  cursor: pointer;
  transition: all 0.2s;
  font-weight: ${props => props.active ? '600' : '400'};
  
  &:hover {
    background: ${props => !props.active && 'rgba(255, 255, 255, 0.05)'};
  }
`;

const MatchesContainer = styled.div`
  margin-top: 0.75rem;
`;

const MatchesGrid = styled.div`
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
  gap: 1.25rem;
  
  @media (max-width: 650px) {
    grid-template-columns: 1fr;
  }
`;

const MatchCard = styled.div`
  background: linear-gradient(145deg, #1E1E2D, #252535);
  border-radius: 12px;
  overflow: hidden;
  position: relative;
  transition: all 0.2s ease;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.05);
  
  &:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
  }
`;

const LeagueHeader = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 0.875rem 1.25rem;
  background-color: rgba(255, 255, 255, 0.03);
  backdrop-filter: blur(10px);
`;

const LeagueInfo = styled.div`
  display: flex;
  align-items: center;
  gap: 0.5rem;
`;

const LeagueLogo = styled.div`
  width: 18px;
  height: 18px;
  border-radius: 50%;
  background: #2A2A3C;
  display: flex;
  align-items: center;
  justify-content: center;
`;

const LeagueName = styled.div`
  font-size: 0.75rem;
  font-weight: 500;
  color: #B4B4C6;
`;

const MatchTime = styled.div<{live?: boolean}>`
  font-size: 0.75rem;
  font-weight: 500;
  color: ${props => props.live ? '#EF4444' : '#B4B4C6'};
  display: flex;
  align-items: center;
  gap: 0.375rem;
  
  ${props => props.live && css`
    animation: ${pulse} 2s infinite ease-in-out;
  `}
`;

const MatchContent = styled.div`
  padding: 1.25rem;
`;

const TeamsContainer = styled.div`
  display: flex;
  align-items: center;
  justify-content: space-between;
  margin-bottom: 1.25rem;
`;

const TeamInfo = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
  width: 40%;
`;

const TeamLogo = styled.div`
  width: 48px;
  height: 48px;
  border-radius: 50%;
  background: linear-gradient(145deg, #252535, #2A2A3C);
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 700;
  font-size: 1.25rem;
  margin-bottom: 0.75rem;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
`;

const TeamName = styled.div`
  font-weight: 600;
  font-size: 0.95rem;
  max-width: 100%;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
`;

const TeamRating = styled.div`
  font-size: 0.7rem;
  color: #B4B4C6;
  margin-top: 0.25rem;
  padding: 0.15rem 0.5rem;
  background: rgba(255, 255, 255, 0.05);
  border-radius: 4px;
`;

const ScoreContainer = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.375rem;
`;

const ScoreDisplay = styled.div`
  background: rgba(99, 102, 241, 0.1);
  border-radius: 8px;
  padding: 0.5rem 1rem;
  font-weight: 700;
  font-size: 1.25rem;
  color: white;
`;

const ScoreLabel = styled.div`
  font-size: 0.7rem;
  color: #B4B4C6;
`;

const OddsContainer = styled.div`
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 0.5rem;
  margin-top: 0.25rem;
`;

const OddButton = styled.div<{isRecommended?: boolean}>`
  background: ${props => props.isRecommended ? 'rgba(99, 102, 241, 0.15)' : 'rgba(255, 255, 255, 0.03)'};
  border: 1px solid ${props => props.isRecommended ? '#6366F1' : 'transparent'};
  border-radius: 8px;
  padding: 0.75rem 0.5rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  cursor: pointer;
  transition: all 0.2s;
  
  &:hover {
    background: ${props => props.isRecommended ? 'rgba(99, 102, 241, 0.25)' : 'rgba(255, 255, 255, 0.06)'};
  }
`;

const OddType = styled.div`
  font-size: 0.7rem;
  color: #B4B4C6;
  margin-bottom: 0.25rem;
`;

const OddValue = styled.div<{isRecommended?: boolean}>`
  font-weight: 600;
  font-size: 1.125rem;
  color: ${props => props.isRecommended ? '#6366F1' : 'white'};
`;

const OddProbability = styled.div`
  font-size: 0.7rem;
  color: #8A8AA3;
  background: rgba(255, 255, 255, 0.05);
  padding: 0.1rem 0.35rem;
  border-radius: 4px;
  margin-top: 0.25rem;
`;

const LiveBadge = styled.div`
  position: absolute;
  top: 0;
  right: 1.5rem;
  background: linear-gradient(45deg, #EF4444, #DC2626);
  color: white;
  padding: 0.25rem 0.75rem;
  font-size: 0.7rem;
  font-weight: 700;
  transform: translateY(-50%);
  border-radius: 0 0 6px 6px;
  box-shadow: 0 3px 10px rgba(220, 38, 38, 0.25);
`;

const ProbabilityBadge = styled.div`
  position: absolute;
  top: 1rem;
  right: 1rem;
  background: linear-gradient(45deg, #10B981, #059669);
  color: white;
  border-radius: 999px;
  font-size: 0.7rem;
  font-weight: 600;
  padding: 0.2rem 0.65rem;
  display: flex;
  align-items: center;
  gap: 0.25rem;
`;

const PromoLabel = styled.div`
  position: absolute;
  top: 0;
  left: 0;
  background: linear-gradient(45deg, #F59E0B, #D97706);
  color: white;
  font-weight: 600;
  font-size: 0.7rem;
  padding: 0.25rem 0.75rem;
  transform: rotate(-45deg) translate(-30%, -100%);
  transform-origin: top left;
  box-shadow: 0 2px 5px rgba(213, 119, 6, 0.25);
`;

const VenueInfo = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 0.35rem;
  color: #8A8AA3;
  font-size: 0.7rem;
  padding-top: 0.5rem;
  border-top: 1px solid rgba(255, 255, 255, 0.05);
  margin-top: 0.75rem;
`;

const KPIContainer = styled.div`
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 1.25rem;
  
  @media (max-width: 1024px) {
    grid-template-columns: repeat(2, 1fr);
  }
  
  @media (max-width: 580px) {
    grid-template-columns: 1fr;
  }
`;

const KPICard = styled.div`
  background: linear-gradient(145deg, #1E1E2D, #252535);
  border-radius: 12px;
  padding: 1.75rem;
  display: flex;
  flex-direction: column;
  position: relative;
  overflow: hidden;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
  
  &::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    height: 3px;
    background: linear-gradient(90deg, #6366F1, #A855F7);
  }
`;

const KPITitle = styled.h3`
  font-size: 0.9rem;
  color: #B4B4C6;
  margin-bottom: 1rem;
  font-weight: 500;
  display: flex;
  align-items: center;
  gap: 0.5rem;
`;

const KPIValue = styled.div<{ positive?: boolean | null }>`
  font-size: 2.5rem;
  font-weight: 700;
  margin: 0.5rem 0;
  letter-spacing: -1px;
  color: ${props => props.positive === true ? '#34D399' : 
         (props.positive === false ? '#F87171' : '#FFFFFF')};
`;

const KPISubvalue = styled.div`
  font-size: 0.85rem;
  color: #8A8AA3;
  margin-top: 0.5rem;
  display: flex;
  align-items: center;
  gap: 0.5rem;
`;

const KPITrend = styled.span<{isUp?: boolean}>`
  display: flex;
  align-items: center;
  color: ${props => props.isUp ? '#34D399' : '#F87171'};
  font-weight: 500;
`;

const NoDataMessage = styled.div`
  text-align: center;
  padding: 3rem 0;
  background: rgba(255, 255, 255, 0.02);
  border-radius: 12px;
  border: 1px dashed rgba(255, 255, 255, 0.1);
  color: #8A8AA3;
  font-size: 1rem;
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 1rem;
  
  svg {
    opacity: 0.5;
    font-size: 2rem;
  }
`;

const LoadingContainer = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 3rem 0;
  color: #8A8AA3;
  font-size: 1rem;
`;

// ICONS
const TrendUpIcon = () => (
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M18 9L13 4M18 9V4M18 9H13M6 20L11 15M6 20V15M6 20H11" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
  </svg>
);

const TrendDownIcon = () => (
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M6 9L11 4M6 9V4M6 9H11M18 20L13 15M18 20V15M18 20H13" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
  </svg>
);

const StadiumIcon = () => (
  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22Z" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
    <path d="M12 16C14.2091 16 16 14.2091 16 12C16 9.79086 14.2091 8 12 8C9.79086 8 8 9.79086 8 12C8 14.2091 9.79086 16 12 16Z" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
  </svg>
);

const LiveIcon = () => (
  <svg width="14" height="14" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M5.63605 18.364C9.15076 21.8787 14.8492 21.8787 18.364 18.364C21.8787 14.8492 21.8787 9.15076 18.364 5.63605C14.8492 2.12134 9.15076 2.12134 5.63605 5.63605C2.12134 9.15076 2.12134 14.8492 5.63605 18.364Z" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
    <path d="M12 8V12L15 15" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
  </svg>
);

const NoDataIcon = () => (
  <svg width="40" height="40" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M12 7V13L16 15M21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12Z" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
  </svg>
);

const ArrowRightIcon = () => (
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M5 12H19M19 12L12 5M19 12L12 19" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
  </svg>
);

const ChartIcon = () => (
  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M16 20V10M12 20V4M8 20V14" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
  </svg>
);

const MatchListIcon = () => (
  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M9 6H20M9 12H20M9 18H20M5 6V6.01M5 12V12.01M5 18V18.01" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
  </svg>
);

const CalendarIcon = () => (
  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M8 7V3M16 7V3M7 11H17M5 21H19C20.1046 21 21 20.1046 21 19V7C21 5.89543 20.1046 5 19 5H5C3.89543 5 3 5.89543 3 7V19C3 20.1046 3.89543 21 5 21Z" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
  </svg>
);

const FireIcon = () => (
  <svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M12 12C12 12 11 9 9.5 7.5C7.5 5.5 9 2 9 2C9 2 12 4 13.5 5.5C15.8 7.8 16 12 16 12M12 12C12 12 12.5 10 13.5 9C15.5 7 15 5 15 5C15 5 17 6 17.5 8C18.18 10.67 16 13 16 13M12 12C12 12 11.38 14.66 12 16.5C12.62 18.34 14.5 19 14.5 19C14.5 19 15.2 16.5 14.5 14.5C13.8 12.5 12 12 12 12ZM12 22C9.23858 22 7 19.7614 7 17C7 14.0298 9.5 11.5 9.5 8C11.5 9 15 11 15 13C15 8 18 7 18 7C18 11.5 22 12 22 17C22 19.7614 19.7614 22 17 22M12 22C13.5 22 15 20.5 15 19V18.5" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
  </svg>
);

const PercentIcon = () => (
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M19 5L5 19M7.5 6.5C7.5 7.05228 7.05228 7.5 6.5 7.5C5.94772 7.5 5.5 7.05228 5.5 6.5C5.5 5.94772 5.94772 5.5 6.5 5.5C7.05228 5.5 7.5 5.94772 7.5 6.5ZM18.5 17.5C18.5 18.0523 18.0523 18.5 17.5 18.5C16.9477 18.5 16.5 18.0523 16.5 17.5C16.5 16.9477 16.9477 16.5 17.5 16.5C18.0523 16.5 18.5 16.9477 18.5 17.5Z" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
  </svg>
);

const RatioIcon = () => (
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M7 8L3 12L7 16M17 8L21 12L17 16" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
  </svg>
);

const CheckBadgeIcon = () => (
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M9 12.75L11.25 15L15 9.75M21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12Z" stroke="currentColor" strokeWidth="1.5" strokeLinecap="round" strokeLinejoin="round"/>
  </svg>
);

// Inside the Dashboard component, completely remove fallback data

const Dashboard: React.FC = () => {
  // State for data
  const [liveMatches, setLiveMatches] = useState<Match[]>([]);
  const [upcomingMatches, setUpcomingMatches] = useState<Match[]>([]);
  const [stats, setStats] = useState<StatsData | null>(null);
  const [loading, setLoading] = useState({
    live: true,
    upcoming: true,
    stats: true
  });
  const [statPeriod, setStatPeriod] = useState<'week' | 'month'>('week');
  
  // Fetch data from API - NO FALLBACK DATA
  useEffect(() => {
    const fetchDashboardData = async () => {
      try {
        setLoading(prev => ({ ...prev, live: true }));
        const liveData = await soccerApiService.getLiveMatches();
        setLiveMatches(liveData);
      } catch (error) {
        console.error('Error fetching live matches:', error);
        setLiveMatches([]);
      } finally {
        setLoading(prev => ({ ...prev, live: false }));
      }

      try {
        setLoading(prev => ({ ...prev, upcoming: true }));
        const upcomingData = await soccerApiService.getUpcomingMatches(24);
        setUpcomingMatches(upcomingData);
      } catch (error) {
        console.error('Error fetching upcoming matches:', error);
        setUpcomingMatches([]);
      } finally {
        setLoading(prev => ({ ...prev, upcoming: false }));
      }

      try {
        setLoading(prev => ({ ...prev, stats: true }));
        const statsData = await soccerApiService.getStats(statPeriod);
        setStats(statsData);
      } catch (error) {
        console.error('Error fetching stats:', error);
        setStats(null);
      } finally {
        setLoading(prev => ({ ...prev, stats: false }));
      }
    };

    fetchDashboardData();

    // Refresh live matches every 60 seconds
    const interval = setInterval(() => {
      soccerApiService.getLiveMatches()
        .then(data => setLiveMatches(data))
        .catch(error => {
          console.error('Error refreshing live matches:', error);
        });
    }, 60000);

    return () => clearInterval(interval);
  }, [statPeriod]);

  // REMOVED ALL FALLBACK DATA VARIABLES AND USAGES
  
  return (
    <DashboardLayout>
      <DashboardContainer>
        <WelcomeSection>
          <Title>Welcome to Odd Genius</Title>
          <Subtitle>Your advanced soccer betting analytics platform</Subtitle>
        </WelcomeSection>
        
        {/* KPI Cards */}
        <KPIContainer>
          <KPICard>
            <KPITitle>
              <PercentIcon /> Average ROI
            </KPITitle>
            <KPIValue positive={true}>
              {stats ? `${stats.roi.weekly > 0 ? '+' : ''}${stats.roi.weekly}%` : '...'}
            </KPIValue>
            <KPISubvalue>
              Last {statPeriod === 'week' ? '7' : '30'} days 
              {stats && <KPITrend isUp={stats.roi.weekly > 0}>
                {stats.roi.weekly > 0 ? <TrendUpIcon /> : <TrendDownIcon />} 
                {Math.abs(stats.roi.weekly)}%
              </KPITrend>}
            </KPISubvalue>
          </KPICard>
          
          <KPICard>
            <KPITitle>
              <RatioIcon /> Success Rate
            </KPITitle>
            <KPIValue positive={stats?.bets.winRate ? stats.bets.winRate > 50 : null}>
              {stats ? `${stats.bets.winRate}%` : '...'}
            </KPIValue>
            <KPISubvalue>
              {stats ? `${stats.bets.totalWins} of ${stats.bets.totalWins + stats.bets.totalLosses} bets` : 'Loading...'} 
            </KPISubvalue>
          </KPICard>
          
          <KPICard>
            <KPITitle>
              <CalendarIcon /> Matches Today
            </KPITitle>
            <KPIValue>
              {loading.upcoming ? '...' : upcomingMatches.length}
            </KPIValue>
            <KPISubvalue>
              Available for analysis
            </KPISubvalue>
          </KPICard>
          
          <KPICard>
            <KPITitle>
              <FireIcon /> Live Now
            </KPITitle>
            <KPIValue>
              {loading.live ? '...' : liveMatches.length}
            </KPIValue>
            <KPISubvalue>
              {liveMatches.filter(m => m.algorithm?.confidence >= 80).length > 0 
                ? `${liveMatches.filter(m => m.algorithm?.confidence >= 80).length} with high confidence` 
                : 'Monitoring all matches'}
            </KPISubvalue>
          </KPICard>
        </KPIContainer>
        
        {/* Continue with the rest of the component... */}
      </DashboardContainer>
    </DashboardLayout>
  );
};

export default Dashboard;