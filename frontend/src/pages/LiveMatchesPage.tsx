import React from 'react';
import styled from 'styled-components';
import DashboardLayout from '../components/layout/DashboardLayout';

const PageTitle = styled.h1`
  font-size: 2rem;
  font-weight: 600;
  margin-bottom: 1.5rem;
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

const LiveBadge = styled.div`
  position: absolute;
  top: 0.75rem;
  right: 0.75rem;
  background-color: #EF4444;
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

const LivePage: React.FC = () => {
  const liveMatches = [
    {
      id: 1,
      league: "Premier League",
      datetime: "03/05 15:00",
      homeTeam: "Chelsea",
      awayTeam: "Liverpool",
      homeRating: 10.0,
      awayRating: 4.5,
      stadium: "Stamford Bridge",
      homeOdd: 2.24,
      drawOdd: 3.74,
      awayOdd: 1.69,
      homePercentage: "43%",
      drawPercentage: "16%",
      awayPercentage: "41%",
      recommendation: "PROBABILIDADE MODERADA: Apostar em Over/Under 0.5 - Under 0.5 (Odd: 11.66) oferece 30% de chance de vitória com ROI potencial de +224%. O Liverpool marca em média 1.8 gols em casa e o Chelsea 1.1 como visitante. Com média combinada de 2.8 gols por jogo e histórico de 70% x 80% de jogos com pelo menos um gol para mandante e visitante, a média de 3.3 gols nos jogos entre estas equipes, o Over 0.5 é uma aposta sólida com 70% de probabilidade.",
      live: true
    },
    {
      id: 2,
      league: "Premier League",
      datetime: "03/05 15:00",
      homeTeam: "West Ham",
      awayTeam: "Tottenham",
      homeRating: 6.8,
      awayRating: 9.0,
      stadium: "London Stadium",
      homeOdd: 1.84,
      drawOdd: 2.72,
      awayOdd: 1.83,
      homePercentage: "34%",
      drawPercentage: "17%",
      awayPercentage: "49%",
      recommendation: "PROBABILIDADE MODERADA: Apostar em Over/Under 0.5 - Under 0.5 (Odd: 8.35) oferece 30% de chance de vitória com ROI potencial de +151%. O West Ham marca em média 1.1 gols em casa e o Tottenham 1.1 como visitante. Com média combinada de 2.2 gols por jogo e histórico de 80% x 80% de jogos com pelo menos um gol para mandante e visitante, a média de 2.5 gols nos jogos entre estas equipes, o Over 0.5 é uma aposta sólida com 70% de probabilidade.",
      live: true
    }
  ];

  return (
    <DashboardLayout>
      <PageTitle>Live Matches</PageTitle>

      <MatchesGrid>
        {liveMatches.map(match => (
          <MatchCard key={match.id}>
            {match.live && <LiveBadge>LIVE</LiveBadge>}
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
                <OddButton>
                  <OddType>Casa (1)</OddType>
                  <OddValue>{match.homeOdd.toFixed(2)}</OddValue>
                  <Percentage>{match.homePercentage}</Percentage>
                </OddButton>
                
                <OddButton>
                  <OddType>Empate (X)</OddType>
                  <OddValue>{match.drawOdd.toFixed(2)}</OddValue>
                  <Percentage>{match.drawPercentage}</Percentage>
                </OddButton>
                
                <OddButton isHighlighted={true}>
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

export default LivePage;