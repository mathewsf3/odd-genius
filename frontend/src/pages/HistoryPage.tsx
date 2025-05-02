import React from 'react';
import styled from 'styled-components';
import DashboardLayout from '../components/layout/DashboardLayout';

const ContentContainer = styled.div`
  padding: 1rem 0;
`;

const PageHeader = styled.div`
  margin-bottom: 2rem;
  
  h1 {
    font-size: 1.75rem;
    margin-bottom: 0.5rem;
  }
  
  p {
    color: var(--color-text-secondary);
  }
`;

const HistoryPage: React.FC = () => {
  return (
    <DashboardLayout>
      <ContentContainer>
        <PageHeader>
          <h1>Match History</h1>
          <p>Review past matches and betting results</p>
        </PageHeader>
        
        <div>
          <p style={{ color: 'var(--color-text-secondary)' }}>
            Match history data will appear here in the full version.
          </p>
        </div>
      </ContentContainer>
    </DashboardLayout>
  );
};

export default HistoryPage;