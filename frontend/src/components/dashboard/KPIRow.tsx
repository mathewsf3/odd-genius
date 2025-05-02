import React from 'react';
import styled from 'styled-components';

const KPIContainer = styled.div`
  display: grid;
  grid-template-columns: repeat(4, 1fr);
  gap: 1rem;
  margin: 2rem 0;
  
  @media (max-width: 992px) {
    grid-template-columns: repeat(2, 1fr);
  }
  
  @media (max-width: 576px) {
    grid-template-columns: 1fr;
  }
`;

const KPICard = styled.div`
  background-color: #252535;
  border-radius: 8px;
  padding: 1.5rem;
  display: flex;
  flex-direction: column;
`;

const KPITitle = styled.h3`
  font-size: 0.875rem;
  color: #B4B4C6;
  margin-bottom: 0.5rem;
  font-weight: 500;
`;

const KPIValue = styled.div<{ positive?: boolean | null }>`
  font-size: 2rem;
  font-weight: 600;
  margin: 0.5rem 0;
  color: ${props => props.positive === true ? '#34D399' : 
               (props.positive === false ? '#F87171' : '#FFFFFF')};
`;

const KPISubtext = styled.div`
  font-size: 0.75rem;
  color: #8A8AA3;
  margin-top: 0.25rem;
`;

const KPIRow: React.FC = () => {
  const kpiData = [
    {
      title: 'Average ROI',
      value: '+12.3%',
      subtext: 'Last 30 days',
      positive: true
    },
    {
      title: 'Success Rate',
      value: '68%',
      subtext: '52 of 76 bets',
      positive: true
    },
    {
      title: 'Matches Today',
      value: '87',
      subtext: '14 leagues',
      positive: null
    },
    {
      title: 'Live Now',
      value: '23',
      subtext: 'Current',
      positive: null
    }
  ];
  
  return (
    <KPIContainer>
      {kpiData.map((kpi, index) => (
        <KPICard key={index}>
          <KPITitle>{kpi.title}</KPITitle>
          <KPIValue positive={kpi.positive}>{kpi.value}</KPIValue>
          <KPISubtext>{kpi.subtext}</KPISubtext>
        </KPICard>
      ))}
    </KPIContainer>
  );
};

export default KPIRow;