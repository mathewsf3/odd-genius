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

const SettingsPage: React.FC = () => {
  return (
    <DashboardLayout>
      <ContentContainer>
        <PageHeader>
          <h1>Settings</h1>
          <p>Configure your account and preferences</p>
        </PageHeader>
        
        <div>
          <p style={{ color: 'var(--color-text-secondary)' }}>
            Settings options will appear here in the full version.
          </p>
        </div>
      </ContentContainer>
    </DashboardLayout>
  );
};

export default SettingsPage;