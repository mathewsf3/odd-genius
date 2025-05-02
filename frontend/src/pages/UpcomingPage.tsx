import React from 'react';
import styled from 'styled-components';
import DashboardLayout from '../components/layout/DashboardLayout';

const PageTitle = styled.h1`
  font-size: 2rem;
  font-weight: 600;
  margin-bottom: 1.5rem;
`;

const FiltersContainer = styled.div`
  display: flex;
  gap: 1rem;
  margin-bottom: 1.5rem;
  flex-wrap: wrap;
`;

const FilterButton = styled.button<{active?: boolean}>`
  padding: 0.5rem 1rem;
  border-radius: 999px;
  background-color: ${props => props.active ? '#6366F1' : '#252535'};
  color: ${props => props.active ? 'white' : '#B4B4C6'};
  border: none;
  cursor: pointer;
  font-size: 0.875rem;
  transition: all 0.2s;
  
  &:hover {
    background-color: ${props => props.active ? '#5D5FE4' : '#2A2A3C'};
  }
`;

const MatchesGrid = styled.div`
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(320px, 1fr));
  gap: 1.5rem;
  margin-top: 1.5rem;
`;

const MatchCard = styled.div`
  background-color: #1E1E2D;
  border-radius: 10px;
  overflow: hidden;
  display: flex;
  flex-direction: column;
  position: relative;
`;

const LeagueHeader = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  background-color: #252535;
  padding: 0.75rem 1rem;
`;

const LeagueName = styled.div`
  font-weight: 500;
  font-size: 0.875rem;
  color: #B4B4C6;
`;

const MatchTime = styled.div`
  font-size: 0.875rem;
  color: #B4B4C6;
`;

const TeamsContainer = styled.div`
  padding: 1.25rem;
  display: flex;
  justify-content: space-between;
  align-items: center;
`;

const TeamInfo = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  width: 40%;
`;

const TeamName = styled.div`
  font-weight: 500;
  margin-top: 0.5rem;
  text-align: center;
`;

const TeamRating = styled.div`
  font-size: 0.75rem;
  color: #B4B4C6;
  margin-top: 0.25rem;
`;

const VersusContainer = styled.div`
  font-size: 1rem;
  font-weight: 600;
  color: #8A8AA3;
`;

const TeamLogo = styled.div`
  width: 50px;
  height: 50px;
  border-radius: 50%;
  background-color: #2A2A3C;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: 700;
  font-size: 0.875rem;
`;

const Venue = styled.div`
  padding: 0.75rem 1.25rem;
  font-size: 0.75rem;
  color: #8A8AA3;
  display: flex;
  align-items: center;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
  
  svg {
    margin-right: 0.5rem;
  }
`;

const BettingInfo = styled.div`
  padding: 1.25rem;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
`;

const BettingOdds = styled.div`
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 0.5rem;
  margin-top: 1rem;
`;

const OddButton = styled.div<{isHighlighted?: boolean}>`
  background-color: ${props => props.isHighlighted ? 'rgba(99, 102, 241, 0.2)' : '#252535'};
  color: ${props => props.isHighlighted ? '#6366F1' : 'white'};
  border: ${props => props.isHighlighted ? '1px solid #6366F1' : '1px solid transparent'};
  padding: 0.5rem;
  border-radius: 8px;
  display: flex;
  flex-direction: column;
  align-items: center;
  cursor: pointer;
  transition: all 0.2s;
  
  &:hover {
    background-color: ${props => props.isHighlighted ? 'rgba(99, 102, 241, 0.3)' : '#2A2A3C'};
  }
`;

const OddType = styled.div`
  font-size: 0.75rem;
  color: #B4B4C6;
  margin-bottom: 0.25rem;
`;

const OddValue = styled.div`
  font-weight: 600;
`;

const Percentage = styled.div`
  font-size: 0.625rem;
  color: #8A8AA3;
  margin-top: 0.25rem;
`;

const AlgorithmRecommendation = styled.div`
  background-color: rgba(52, 211, 153, 0.1);
  border-left: 3px solid #34D399;
  padding: 1rem;
  margin-bottom: 1rem;
  
  h4 {
    color: #34D399;
    font-size: 0.875rem;
    margin-bottom: 0.5rem;
  }
  
  p {
    font-size: 0.75rem;
    color: #B4B4C6;
    line-height: 1.5;
  }
`;

const PromoLabel = styled.div`
  position: absolute;
  top: 0;
  left: 0;
  background-color: #F59E0B;
  color: white;
  font-weight: 600;
  font-size: 0.75rem;
  padding: 0.25rem 0.75rem;
  transform: rotate(-45deg) translate(-30%, -100%);
  transform-origin: top left;
`;

const ProbabilityBadge = styled.div`
  position: absolute;
  top: 0.75rem;
  right: 0.75rem;
  background-color: #10B981;
  color: white;
  border-radius: 999px;
  font-size: 0.75rem;
  font-weight: 600;
  padding: 0.25rem 0.75rem;
`;

// Icons
const StadiumIcon = () => (
  <svg width="16" height="16" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
    <path d="M12 22C17.5228 22 22 17.5228 22 12C22 6.47715 17.5228 2 12 2C6.47715 2 2 6.47715 2 12C2 17.5228 6.47715 22 12 22Z" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
    <path d="M12 16C14.2091 16 16 14.2091 16 12C16 9.79086 14.2091 8 12 8C9.79086 8 8 9.79086 8 12C8 14.2091 9.79086 16 12 16Z" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"/>
  </svg>
);

const UpcomingPage: React.FC = () => {
  const upcomingMatches = [
    {
      id: 1,
      league: "Premier League",
      datetime: "03/05 17:30",
      homeTeam: "Brentford",
      awayTeam: "Manchester Utd",
      homeRating: 9.5,
      awayRating: 3.1,
      stadium: "Olech Community Stadium",
      homeOdd: 2.69,
      drawOdd: 2.69,
      awayOdd: 2.14,
      homePercentage: "43%",
      drawPercentage: "18%",
      awayPercentage: "40%",
      recommendation: "Recomendação Algoritmo: Apostar em Dupla Chance - 1X (Odd: 1.37) oferece 83% de chance de vitória com ROI potencial de +14%. Baseado na força das equipes e no local do jogo, a dupla chance 12 (Casa ou Fora) é a aposta mais segura para esta partida com 83% de probabilidade.",
      hasPromo: true,
      probability: 99
    },
    {
      id: 2,
      league: "Premier League",
      datetime: "03/05 15:00",
      homeTeam: "Brighton",
      awayTeam: "Newcastle",
      homeRating: 7.9,
      awayRating: 2.4,
      stadium: "American Express Stadium",
      homeOdd: 1.80,
      drawOdd: 3.11,
      awayOdd: 2.74,
      homePercentage: "41%",
      drawPercentage: "22%",
      awayPercentage: "37%",
      recommendation: "PROBABILIDADE MODERADA: Apostar em Over/Under 0.5 - Under 0.5 (Odd: 11.66) oferece 30% de chance de vitória com ROI potencial de +250%. O Brighton marca em média 1 gols em casa e o Newcastle 0.7 como visitante. Com média combinada de 1.9 gols por jogo e histórico de 70% x 70% de jogos com pelo menos um gol para mandante e visitante, a média de 2.0 gols nos jogos entre estas equipes, o Over 0.5 é uma aposta sólida com 70% de probabilidade.",
      hasPromo: false,
      probability: 99
    },
    {
      id: 3,
      league: "La Liga",
      datetime: "03/05 15:30",
      homeTeam: "Espanyol",
      awayTeam: "Betis",
      homeRating: 6.4,
      awayRating: 4.3,
      stadium: "RCDE Stadium",
      homeOdd: 1.97,
      drawOdd: 3.40,
      awayOdd: 2.51,
      homePercentage: "37%",
      drawPercentage: "21%",
      awayPercentage: "42%",
      recommendation: "ALTA PROBABILIDADE: Apostar em BTTS & Over 2.5 - Não (Odd: 1.74) oferece 81% de chance de vitória com ROI potencial de +41%. A probabilidade de ambas as equipes marcarem é muito baixa por mais que 2.5 gols é baseado no histórico ofensivo das equipes e partidas anteriores.",
      hasPromo: true,
      probability: 97
    }
  ];
  
  return (
    <DashboardLayout>
      <PageTitle>Upcoming Matches</PageTitle>
      
      <FiltersContainer>
        <FilterButton active>All Leagues</FilterButton>
        <FilterButton>Premier League</FilterButton>
        <FilterButton>La Liga</FilterButton>
        <FilterButton>Serie A</FilterButton>
        <FilterButton>Bundesliga</FilterButton>
        <FilterButton>Ligue 1</FilterButton>
      </FiltersContainer>
      
      <MatchesGrid>
        {upcomingMatches.map(match => (
          <MatchCard key={match.id}>
            {match.hasPromo && <PromoLabel>PROMO</PromoLabel>}
            {match.probability && <ProbabilityBadge>{match.probability}%</ProbabilityBadge>}
            <LeagueHeader>
              <LeagueName>{match.league}</LeagueName>
              <MatchTime>{match.datetime}</MatchTime>
            </LeagueHeader>
            
            <TeamsContainer>
              <TeamInfo>
                <TeamLogo>{match.homeTeam.substring(0, 1)}</TeamLogo>
                <TeamName>{match.homeTeam}</TeamName>
                <TeamRating>Rating: {match.homeRating.toFixed(1)}</TeamRating>
              </TeamInfo>
              
              <VersusContainer>VS</VersusContainer>
              
              <TeamInfo>
                <TeamLogo>{match.awayTeam.substring(0, 1)}</TeamLogo>
                <TeamName>{match.awayTeam}</TeamName>
                <TeamRating>Rating: {match.awayRating.toFixed(1)}</TeamRating>
              </TeamInfo>
            </TeamsContainer>
            
            <Venue>
              <StadiumIcon /> {match.stadium}
            </Venue>
            
            <BettingInfo>
              <AlgorithmRecommendation>
                <h4>Recomendação Algoritmo</h4>
                <p>{match.recommendation.substring(0, 150)}...</p>
              </AlgorithmRecommendation>
              
              <BettingOdds>
                <OddButton isHighlighted={match.id === 1}>
                  <OddType>Casa (1)</OddType>
                  <OddValue>{match.homeOdd.toFixed(2)}</OddValue>
                  <Percentage>{match.homePercentage}</Percentage>
                </OddButton>
                
                <OddButton>
                  <OddType>Empate (X)</OddType>
                  <OddValue>{match.drawOdd.toFixed(2)}</OddValue>
                  <Percentage>{match.drawPercentage}</Percentage>
                </OddButton>
                
                <OddButton isHighlighted={match.id === 3}>
                  <OddType>Fora (2)</OddType>
                  <OddValue>{match.awayOdd.toFixed(2)}</OddValue>
                  <Percentage>{match.awayPercentage}</Percentage>
                </OddButton>
              </BettingOdds>
            </BettingInfo>
          </MatchCard>
        ))}
      </MatchesGrid>
    </DashboardLayout>
  );
};

export default UpcomingPage;