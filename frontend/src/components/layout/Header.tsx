import React from 'react';
import styled from 'styled-components';
import { Link, useLocation } from 'react-router-dom';

const HeaderContainer = styled.header`
  display: flex;
  align-items: center;
  justify-content: space-between;
  background-color: #1a1a2e;
  padding: 1rem 2rem;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
`;

const Logo = styled(Link)`
  font-size: 1.25rem;
  font-weight: 600;
  color: white;
  text-decoration: none;
`;

const NavContainer = styled.nav`
  display: flex;
  align-items: center;
`;

const NavLink = styled(Link)<{ active: boolean }>`
  color: ${props => props.active ? '#ffffff' : 'rgba(255, 255, 255, 0.7)'};
  margin: 0 1rem;
  padding: 0.5rem 0;
  font-weight: 500;
  text-decoration: none;
  position: relative;
  transition: color 0.2s ease;
  
  &:hover {
    color: #ffffff;
  }
  
  ${props => props.active && `
    &:after {
      content: '';
      position: absolute;
      bottom: -2px;
      left: 0;
      right: 0;
      height: 2px;
      background: #6366F1;
    }
  `}
`;

const Header: React.FC = () => {
  const location = useLocation();
  
  const navItems = [
    { name: 'Dashboard', path: '/' },
    { name: 'Live', path: '/live' },
    { name: 'Upcoming', path: '/upcoming' },
    { name: 'History', path: '/history' },
    { name: 'Statistics', path: '/statistics' },
    { name: 'Settings', path: '/settings' }
  ];
  
  return (
    <HeaderContainer>
      <Logo to="/">Odd Genius</Logo>
      <NavContainer>
        {navItems.map(item => (
          <NavLink 
            key={item.path} 
            to={item.path} 
            active={location.pathname === item.path || 
                   (item.path === '/' && location.pathname === '/')}
          >
            {item.name}
          </NavLink>
        ))}
      </NavContainer>
    </HeaderContainer>
  );
};

export default Header;