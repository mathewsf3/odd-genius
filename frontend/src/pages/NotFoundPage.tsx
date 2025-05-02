import React from 'react';
import styled from 'styled-components';
import { Link } from 'react-router-dom';

const Container = styled.div`
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  height: 100vh;
  padding: 2rem;
  text-align: center;
  background-color: var(--color-bg-primary);
`;

const Title = styled.h1`
  font-size: 6rem;
  margin-bottom: 1rem;
  color: var(--color-accent-primary);
`;

const Subtitle = styled.h2`
  font-size: 1.5rem;
  margin-bottom: 2rem;
  color: var(--color-text-primary);
`;

const HomeButton = styled(Link)`
  padding: 0.75rem 1.5rem;
  background-color: var(--color-accent-primary);
  color: white;
  border-radius: var(--border-radius-md);
  text-decoration: none;
  
  &:hover {
    background-color: var(--color-accent-secondary);
    text-decoration: none;
  }
`;

const NotFoundPage: React.FC = () => {
  return (
    <Container>
      <Title>404</Title>
      <Subtitle>Page not found</Subtitle>
      <HomeButton to="/">Return to Dashboard</HomeButton>
    </Container>
  );
};

export default NotFoundPage;