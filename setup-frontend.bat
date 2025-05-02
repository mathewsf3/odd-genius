@echo off
setlocal enabledelayedexpansion

echo Creating Odd Genius Frontend Structure...

REM Create main directories
mkdir "C:\Users\mathe\OneDrive\Desktop\odd-genius\frontend"
cd "C:\Users\mathe\OneDrive\Desktop\odd-genius\frontend"

mkdir public
mkdir public\assets
mkdir public\assets\logos
mkdir public\assets\icons

mkdir src
mkdir src\components
mkdir src\components\layout
mkdir src\components\dashboard
mkdir src\components\match
mkdir src\components\match\tabs
mkdir src\components\common

mkdir src\pages
mkdir src\api
mkdir src\api\services
mkdir src\hooks
mkdir src\context
mkdir src\styles
mkdir src\types
mkdir src\assets

REM Create package.json
echo {> package.json
echo   "name": "odd-genius-frontend",>> package.json
echo   "version": "0.1.0",>> package.json
echo   "private": true,>> package.json
echo   "dependencies": {>> package.json
echo     "@testing-library/jest-dom": "^5.16.5",>> package.json
echo     "@testing-library/react": "^13.4.0",>> package.json
echo     "@testing-library/user-event": "^13.5.0",>> package.json
echo     "@types/jest": "^27.5.2",>> package.json
echo     "@types/node": "^16.18.23",>> package.json
echo     "@types/react": "^18.0.33",>> package.json
echo     "@types/react-dom": "^18.0.11",>> package.json
echo     "axios": "^1.3.5",>> package.json
echo     "date-fns": "^2.29.3",>> package.json
echo     "react": "^18.2.0",>> package.json
echo     "react-dom": "^18.2.0",>> package.json
echo     "react-router-dom": "^6.10.0",>> package.json
echo     "react-scripts": "5.0.1",>> package.json
echo     "styled-components": "^5.3.9",>> package.json
echo     "typescript": "^4.9.5",>> package.json
echo     "web-vitals": "^2.1.4">> package.json
echo   },>> package.json
echo   "scripts": {>> package.json
echo     "start": "react-scripts start",>> package.json
echo     "build": "react-scripts build",>> package.json
echo     "test": "react-scripts test",>> package.json
echo     "eject": "react-scripts eject",>> package.json
echo     "lint": "eslint src/**/*.{ts,tsx}">> package.json
echo   },>> package.json
echo   "eslintConfig": {>> package.json
echo     "extends": [>> package.json
echo       "react-app",>> package.json
echo       "react-app/jest">> package.json
echo     ]>> package.json
echo   },>> package.json
echo   "browserslist": {>> package.json
echo     "production": [>> package.json
echo       ">0.2%%",>> package.json
echo       "not dead",>> package.json
echo       "not op_mini all">> package.json
echo     ],>> package.json
echo     "development": [>> package.json
echo       "last 1 chrome version",>> package.json
echo       "last 1 firefox version",>> package.json
echo       "last 1 safari version">> package.json
echo     ]>> package.json
echo   },>> package.json
echo   "devDependencies": {>> package.json
echo     "@types/styled-components": "^5.1.26">> package.json
echo   }>> package.json
echo }>> package.json

REM Create .env file
echo REACT_APP_API_URL=http://localhost:5000/api> .env

REM Create public files
echo ^<!DOCTYPE html^>> public\index.html
echo ^<html lang="en"^>>> public\index.html
echo ^<head^>>> public\index.html
echo   ^<meta charset="utf-8" /^>>> public\index.html
echo   ^<link rel="icon" href="%%PUBLIC_URL%%/favicon.ico" /^>>> public\index.html
echo   ^<meta name="viewport" content="width=device-width, initial-scale=1" /^>>> public\index.html
echo   ^<meta name="theme-color" content="#000000" /^>>> public\index.html
echo   ^<meta name="description" content="Odd Genius - Soccer Betting Platform" /^>>> public\index.html
echo   ^<link rel="apple-touch-icon" href="%%PUBLIC_URL%%/logo192.png" /^>>> public\index.html
echo   ^<link rel="manifest" href="%%PUBLIC_URL%%/manifest.json" /^>>> public\index.html
echo   ^<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" /^>>> public\index.html
echo   ^<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet"^>>> public\index.html
echo   ^<title^>Odd Genius^</title^>>> public\index.html
echo ^</head^>>> public\index.html
echo ^<body^>>> public\index.html
echo   ^<noscript^>You need to enable JavaScript to run this app.^</noscript^>>> public\index.html
echo   ^<div id="root"^>^</div^>>> public\index.html
echo ^</body^>>> public\index.html
echo ^</html^>>> public\index.html

echo {> public\manifest.json
echo   "short_name": "Odd Genius",>> public\manifest.json
echo   "name": "Odd Genius Soccer Betting Platform",>> public\manifest.json
echo   "icons": [>> public\manifest.json
echo     {>> public\manifest.json
echo       "src": "favicon.ico",>> public\manifest.json
echo       "sizes": "64x64 32x32 24x24 16x16",>> public\manifest.json
echo       "type": "image/x-icon">> public\manifest.json
echo     }>> public\manifest.json
echo   ],>> public\manifest.json
echo   "start_url": ".",>> public\manifest.json
echo   "display": "standalone",>> public\manifest.json
echo   "theme_color": "#1E1E2A",>> public\manifest.json
echo   "background_color": "#1E1E2A">> public\manifest.json
echo }>> public\manifest.json

REM Create core React files
echo import React from 'react';> src\index.tsx
echo import ReactDOM from 'react-dom/client';>> src\index.tsx
echo import { BrowserRouter } from 'react-router-dom';>> src\index.tsx
echo import App from './App';>> src\index.tsx
echo import { GlobalStyles } from './styles/GlobalStyles';>> src\index.tsx
echo import { ApiStatusProvider } from './context/ApiStatusContext';>> src\index.tsx
echo import reportWebVitals from './reportWebVitals';>> src\index.tsx
echo. >> src\index.tsx
echo const root = ReactDOM.createRoot(>> src\index.tsx
echo   document.getElementById('root') as HTMLElement>> src\index.tsx
echo );>> src\index.tsx
echo. >> src\index.tsx
echo root.render(>> src\index.tsx
echo   ^<React.StrictMode^>>> src\index.tsx
echo     ^<BrowserRouter^>>> src\index.tsx
echo       ^<ApiStatusProvider^>>> src\index.tsx
echo         ^<GlobalStyles /^>>> src\index.tsx
echo         ^<App /^>>> src\index.tsx
echo       ^</ApiStatusProvider^>>> src\index.tsx
echo     ^</BrowserRouter^>>> src\index.tsx
echo   ^</React.StrictMode^>>> src\index.tsx
echo );>> src\index.tsx
echo. >> src\index.tsx
echo // If you want to start measuring performance in your app, pass a function>> src\index.tsx
echo // to log results (for example: reportWebVitals(console.log))>> src\index.tsx
echo // or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals>> src\index.tsx
echo reportWebVitals();>> src\index.tsx

echo // reportWebVitals.ts> src\reportWebVitals.ts
echo import { ReportHandler } from 'web-vitals';>> src\reportWebVitals.ts
echo. >> src\reportWebVitals.ts
echo const reportWebVitals = (onPerfEntry?: ReportHandler) => {>> src\reportWebVitals.ts
echo   if (onPerfEntry && onPerfEntry instanceof Function) {>> src\reportWebVitals.ts
echo     import('web-vitals').then(({ getCLS, getFID, getFCP, getLCP, getTTFB }) => {>> src\reportWebVitals.ts
echo       getCLS(onPerfEntry);>> src\reportWebVitals.ts
echo       getFID(onPerfEntry);>> src\reportWebVitals.ts
echo       getFCP(onPerfEntry);>> src\reportWebVitals.ts
echo       getLCP(onPerfEntry);>> src\reportWebVitals.ts
echo       getTTFB(onPerfEntry);>> src\reportWebVitals.ts
echo     });>> src\reportWebVitals.ts
echo   }>> src\reportWebVitals.ts
echo };>> src\reportWebVitals.ts
echo. >> src\reportWebVitals.ts
echo export default reportWebVitals;>> src\reportWebVitals.ts

echo import React from 'react';> src\App.tsx
echo import { Routes, Route, Navigate } from 'react-router-dom';>> src\App.tsx
echo import Dashboard from './pages/Dashboard';>> src\App.tsx
echo import LivePage from './pages/LivePage';>> src\App.tsx
echo import UpcomingPage from './pages/UpcomingPage';>> src\App.tsx
echo import HistoryPage from './pages/HistoryPage';>> src\App.tsx
echo import StatsPage from './pages/StatsPage';>> src\App.tsx
echo import SettingsPage from './pages/SettingsPage';>> src\App.tsx
echo import NotFoundPage from './pages/NotFoundPage';>> src\App.tsx
echo. >> src\App.tsx
echo const App: React.FC = () => {>> src\App.tsx
echo   return (>> src\App.tsx
echo     ^<Routes^>>> src\App.tsx
echo       ^<Route path="/" element={^<Dashboard /^>} /^>>> src\App.tsx
echo       ^<Route path="/live" element={^<LivePage /^>} /^>>> src\App.tsx
echo       ^<Route path="/upcoming" element={^<UpcomingPage /^>} /^>>> src\App.tsx
echo       ^<Route path="/history" element={^<HistoryPage /^>} /^>>> src\App.tsx
echo       ^<Route path="/statistics" element={^<StatsPage /^>} /^>>> src\App.tsx
echo       ^<Route path="/settings" element={^<SettingsPage /^>} /^>>> src\App.tsx
echo       ^<Route path="/404" element={^<NotFoundPage /^>} /^>>> src\App.tsx
echo       ^<Route path="*" element={^<Navigate to="/404" replace /^>} /^>>> src\App.tsx
echo     ^</Routes^>>> src\App.tsx
echo   );>> src\App.tsx
echo };>> src\App.tsx
echo. >> src\App.tsx
echo export default App;>> src\App.tsx

REM Create styles
echo import { createGlobalStyle } from 'styled-components';> src\styles\GlobalStyles.ts
echo. >> src\styles\GlobalStyles.ts
echo export const GlobalStyles = createGlobalStyle`>> src\styles\GlobalStyles.ts
echo   :root {>> src\styles\GlobalStyles.ts
echo     --color-bg-primary: #1E1E2A;>> src\styles\GlobalStyles.ts
echo     --color-bg-secondary: #252535;>> src\styles\GlobalStyles.ts
echo     --color-bg-tertiary: #2A2A3C;>> src\styles\GlobalStyles.ts
echo     --color-text-primary: #FFFFFF;>> src\styles\GlobalStyles.ts
echo     --color-text-secondary: #B4B4C6;>> src\styles\GlobalStyles.ts
echo     --color-text-tertiary: #8A8AA3;>> src\styles\GlobalStyles.ts
echo     --color-accent-primary: #6366F1;>> src\styles\GlobalStyles.ts
echo     --color-accent-secondary: #4F46E5;>> src\styles\GlobalStyles.ts
echo     --color-success: #34D399;>> src\styles\GlobalStyles.ts
echo     --color-warning: #FBBF24;>> src\styles\GlobalStyles.ts
echo     --color-danger: #F87171;>> src\styles\GlobalStyles.ts
echo     --color-live: #EF4444;>> src\styles\GlobalStyles.ts
echo     --border-radius-sm: 4px;>> src\styles\GlobalStyles.ts
echo     --border-radius-md: 8px;>> src\styles\GlobalStyles.ts
echo     --border-radius-lg: 12px;>> src\styles\GlobalStyles.ts
echo     --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);>> src\styles\GlobalStyles.ts
echo     --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1);>> src\styles\GlobalStyles.ts
echo     --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1);>> src\styles\GlobalStyles.ts
echo   }>> src\styles\GlobalStyles.ts
echo   >> src\styles\GlobalStyles.ts
echo   * {>> src\styles\GlobalStyles.ts
echo     margin: 0;>> src\styles\GlobalStyles.ts
echo     padding: 0;>> src\styles\GlobalStyles.ts
echo     box-sizing: border-box;>> src\styles\GlobalStyles.ts
echo   }>> src\styles\GlobalStyles.ts
echo   >> src\styles\GlobalStyles.ts
echo   html, body {>> src\styles\GlobalStyles.ts
echo     font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen,>> src\styles\GlobalStyles.ts
echo       Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;>> src\styles\GlobalStyles.ts
echo     background-color: var(--color-bg-primary);>> src\styles\GlobalStyles.ts
echo     color: var(--color-text-primary);>> src\styles\GlobalStyles.ts
echo     line-height: 1.5;>> src\styles\GlobalStyles.ts
echo   }>> src\styles\GlobalStyles.ts
echo   >> src\styles\GlobalStyles.ts
echo   a {>> src\styles\GlobalStyles.ts
echo     color: var(--color-accent-primary);>> src\styles\GlobalStyles.ts
echo     text-decoration: none;>> src\styles\GlobalStyles.ts
echo     >> src\styles\GlobalStyles.ts
echo     &:hover {>> src\styles\GlobalStyles.ts
echo       text-decoration: underline;>> src\styles\GlobalStyles.ts
echo     }>> src\styles\GlobalStyles.ts
echo   }>> src\styles\GlobalStyles.ts
echo `;>> src\styles\GlobalStyles.ts

echo const theme = {> src\styles\theme.ts
echo   colors: {>> src\styles\theme.ts
echo     background: {>> src\styles\theme.ts
echo       primary: '#1E1E2A',>> src\styles\theme.ts
echo       secondary: '#252535',>> src\styles\theme.ts
echo       tertiary: '#2A2A3C',>> src\styles\theme.ts
echo     },>> src\styles\theme.ts
echo     text: {>> src\styles\theme.ts
echo       primary: '#FFFFFF',>> src\styles\theme.ts
echo       secondary: '#B4B4C6',>> src\styles\theme.ts
echo       tertiary: '#8A8AA3',>> src\styles\theme.ts
echo     },>> src\styles\theme.ts
echo     accent: {>> src\styles\theme.ts
echo       primary: '#6366F1',>> src\styles\theme.ts
echo       secondary: '#4F46E5',>> src\styles\theme.ts
echo     },>> src\styles\theme.ts
echo     status: {>> src\styles\theme.ts
echo       success: '#34D399',>> src\styles\theme.ts
echo       warning: '#FBBF24',>> src\styles\theme.ts
echo       danger: '#F87171',>> src\styles\theme.ts
echo       live: '#EF4444',>> src\styles\theme.ts
echo     }>> src\styles\theme.ts
echo   },>> src\styles\theme.ts
echo   fonts: {>> src\styles\theme.ts
echo     body: "'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif",>> src\styles\theme.ts
echo     heading: "'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif",>> src\styles\theme.ts
echo     mono: "SFMono-Regular, Menlo, Monaco, Consolas, 'Liberation Mono', monospace",>> src\styles\theme.ts
echo   },>> src\styles\theme.ts
echo   fontSizes: {>> src\styles\theme.ts
echo     xs: '0.75rem',>> src\styles\theme.ts
echo     sm: '0.875rem',>> src\styles\theme.ts
echo     md: '1rem',>> src\styles\theme.ts
echo     lg: '1.125rem',>> src\styles\theme.ts
echo     xl: '1.25rem',>> src\styles\theme.ts
echo     '2xl': '1.5rem',>> src\styles\theme.ts
echo     '3xl': '1.875rem',>> src\styles\theme.ts
echo     '4xl': '2.25rem',>> src\styles\theme.ts
echo   },>> src\styles\theme.ts
echo   fontWeights: {>> src\styles\theme.ts
echo     normal: 400,>> src\styles\theme.ts
echo     medium: 500,>> src\styles\theme.ts
echo     semibold: 600,>> src\styles\theme.ts
echo     bold: 700,>> src\styles\theme.ts
echo   },>> src\styles\theme.ts
echo   radii: {>> src\styles\theme.ts
echo     sm: '4px',>> src\styles\theme.ts
echo     md: '8px',>> src\styles\theme.ts
echo     lg: '12px',>> src\styles\theme.ts
echo     round: '9999px',>> src\styles\theme.ts
echo   },>> src\styles\theme.ts
echo   shadows: {>> src\styles\theme.ts
echo     sm: '0 1px 2px rgba(0, 0, 0, 0.05)',>> src\styles\theme.ts
echo     md: '0 4px 6px -1px rgba(0, 0, 0, 0.1)',>> src\styles\theme.ts
echo     lg: '0 10px 15px -3px rgba(0, 0, 0, 0.1)',>> src\styles\theme.ts
echo   },>> src\styles\theme.ts
echo   breakpoints: {>> src\styles\theme.ts
echo     sm: '640px',>> src\styles\theme.ts
echo     md: '768px',>> src\styles\theme.ts
echo     lg: '1024px',>> src\styles\theme.ts
echo     xl: '1280px',>> src\styles\theme.ts
echo     '2xl': '1536px',>> src\styles\theme.ts
echo   },>> src\styles\theme.ts
echo   transition: {>> src\styles\theme.ts
echo     fast: '0.1s ease',>> src\styles\theme.ts
echo     normal: '0.2s ease',>> src\styles\theme.ts
echo     slow: '0.3s ease',>> src\styles\theme.ts
echo   }>> src\styles\theme.ts
echo };>> src\styles\theme.ts
echo. >> src\styles\theme.ts
echo export default theme;>> src\styles\theme.ts
echo export type Theme = typeof theme;>> src\styles\theme.ts

REM Create context files
echo import React, { createContext, useState, useContext } from 'react';> src\context\ApiStatusContext.tsx
echo. >> src\context\ApiStatusContext.tsx
echo interface ApiStatusContextType {>> src\context\ApiStatusContext.tsx
echo   isConnected: boolean;>> src\context\ApiStatusContext.tsx
echo   setConnected: () => void;>> src\context\ApiStatusContext.tsx
echo   setDisconnected: () => void;>> src\context\ApiStatusContext.tsx
echo }>> src\context\ApiStatusContext.tsx
echo. >> src\context\ApiStatusContext.tsx
echo const ApiStatusContext = createContext^<ApiStatusContextType^>({>> src\context\ApiStatusContext.tsx
echo   isConnected: true,>> src\context\ApiStatusContext.tsx
echo   setConnected: () => {},>> src\context\ApiStatusContext.tsx
echo   setDisconnected: () => {},>> src\context\ApiStatusContext.tsx
echo });>> src\context\ApiStatusContext.tsx
echo. >> src\context\ApiStatusContext.tsx
echo interface ApiStatusProviderProps {>> src\context\ApiStatusContext.tsx
echo   children: React.ReactNode;>> src\context\ApiStatusContext.tsx
echo }>> src\context\ApiStatusContext.tsx
echo. >> src\context\ApiStatusContext.tsx
echo export const ApiStatusProvider: React.FC^<ApiStatusProviderProps^> = ({ children }) => {>> src\context\ApiStatusContext.tsx
echo   const [isConnected, setIsConnected] = useState^<boolean^>(true);>> src\context\ApiStatusContext.tsx
echo   >> src\context\ApiStatusContext.tsx
echo   const setConnected = () => {>> src\context\ApiStatusContext.tsx
echo     setIsConnected(true);>> src\context\ApiStatusContext.tsx
echo   };>> src\context\ApiStatusContext.tsx
echo   >> src\context\ApiStatusContext.tsx
echo   const setDisconnected = () => {>> src\context\ApiStatusContext.tsx
echo     setIsConnected(false);>> src\context\ApiStatusContext.tsx
echo   };>> src\context\ApiStatusContext.tsx
echo   >> src\context\ApiStatusContext.tsx
echo   return (>> src\context\ApiStatusContext.tsx
echo     ^<ApiStatusContext.Provider value={{ isConnected, setConnected, setDisconnected }}^>>> src\context\ApiStatusContext.tsx
echo       {children}>> src\context\ApiStatusContext.tsx
echo     ^</ApiStatusContext.Provider^>>> src\context\ApiStatusContext.tsx
echo   );>> src\context\ApiStatusContext.tsx
echo };>> src\context\ApiStatusContext.tsx
echo. >> src\context\ApiStatusContext.tsx
echo export const useApiStatus = () => useContext(ApiStatusContext);>> src\context\ApiStatusContext.tsx

echo import React, { createContext, useContext, useState } from 'react';> src\context\MatchContext.tsx
echo import { Fixture } from '../types/api.types';>> src\context\MatchContext.tsx
echo. >> src\context\MatchContext.tsx
echo interface MatchContextType {>> src\context\MatchContext.tsx
echo   selectedMatch: Fixture | null;>> src\context\MatchContext.tsx
echo   setSelectedMatch: (match: Fixture | null) => void;>> src\context\MatchContext.tsx
echo   isModalOpen: boolean;>> src\context\MatchContext.tsx
echo   openModal: () => void;>> src\context\MatchContext.tsx
echo   closeModal: () => void;>> src\context\MatchContext.tsx
echo }>> src\context\MatchContext.tsx
echo. >> src\context\MatchContext.tsx
echo const MatchContext = createContext^<MatchContextType^>({>> src\context\MatchContext.tsx
echo   selectedMatch: null,>> src\context\MatchContext.tsx
echo   setSelectedMatch: () => {},>> src\context\MatchContext.tsx
echo   isModalOpen: false,>> src\context\MatchContext.tsx
echo   openModal: () => {},>> src\context\MatchContext.tsx
echo   closeModal: () => {},>> src\context\MatchContext.tsx
echo });>> src\context\MatchContext.tsx
echo. >> src\context\MatchContext.tsx
echo interface MatchProviderProps {>> src\context\MatchContext.tsx
echo   children: React.ReactNode;>> src\context\MatchContext.tsx
echo }>> src\context\MatchContext.tsx
echo. >> src\context\MatchContext.tsx
echo export const MatchProvider: React.FC^<MatchProviderProps^> = ({ children }) => {>> src\context\MatchContext.tsx
echo   const [selectedMatch, setSelectedMatch] = useState^<Fixture | null^>(null);>> src\context\MatchContext.tsx
echo   const [isModalOpen, setIsModalOpen] = useState^<boolean^>(false);>> src\context\MatchContext.tsx
echo   >> src\context\MatchContext.tsx
echo   const openModal = () => {>> src\context\MatchContext.tsx
echo     setIsModalOpen(true);>> src\context\MatchContext.tsx
echo   };>> src\context\MatchContext.tsx
echo   >> src\context\MatchContext.tsx
echo   const closeModal = () => {>> src\context\MatchContext.tsx
echo     setIsModalOpen(false);>> src\context\MatchContext.tsx
echo   };>> src\context\MatchContext.tsx
echo   >> src\context\MatchContext.tsx
echo   return (>> src\context\MatchContext.tsx
echo     ^<MatchContext.Provider >> src\context\MatchContext.tsx
echo       value={{ >> src\context\MatchContext.tsx
echo         selectedMatch, >> src\context\MatchContext.tsx
echo         setSelectedMatch, >> src\context\MatchContext.tsx
echo         isModalOpen, >> src\context\MatchContext.tsx
echo         openModal, >> src\context\MatchContext.tsx
echo         closeModal >> src\context\MatchContext.tsx
echo       }}>> src\context\MatchContext.tsx
echo     ^>>> src\context\MatchContext.tsx
echo       {children}>> src\context\MatchContext.tsx
echo     ^</MatchContext.Provider^>>> src\context\MatchContext.tsx
echo   );>> src\context\MatchContext.tsx
echo };>> src\context\MatchContext.tsx
echo. >> src\context\MatchContext.tsx
echo export const useMatch = () => useContext(MatchContext);>> src\context\MatchContext.tsx

REM Create API client
echo import axios from 'axios';> src\api\apiClient.ts
echo. >> src\api\apiClient.ts
echo const API_URL = process.env.REACT_APP_API_URL || 'http://localhost:5000/api';>> src\api\apiClient.ts
echo. >> src\api\apiClient.ts
echo // Create axios instance with default config>> src\api\apiClient.ts
echo export const apiClient = axios.create({>> src\api\apiClient.ts
echo   baseURL: API_URL,>> src\api\apiClient.ts
echo   headers: {>> src\api\apiClient.ts
echo     'Content-Type': 'application/json',>> src\api\apiClient.ts
echo   },>> src\api\apiClient.ts
echo   timeout: 10000,>> src\api\apiClient.ts
echo });>> src\api\apiClient.ts
echo. >> src\api\apiClient.ts
echo // Add a request interceptor for auth token (if needed later)>> src\api\apiClient.ts
echo apiClient.interceptors.request.use(>> src\api\apiClient.ts
echo   (config) => {>> src\api\apiClient.ts
echo     return config;>> src\api\apiClient.ts
echo   },>> src\api\apiClient.ts
echo   (error) => Promise.reject(error)>> src\api\apiClient.ts
echo );>> src\api\apiClient.ts
echo. >> src\api\apiClient.ts
echo // Add a response interceptor for error handling>> src\api\apiClient.ts
echo apiClient.interceptors.response.use(>> src\api\apiClient.ts
echo   (response) => response,>> src\api\apiClient.ts
echo   (error) => {>> src\api\apiClient.ts
echo     // Handle network errors>> src\api\apiClient.ts
echo     if (!error.response) {>> src\api\apiClient.ts
echo       return Promise.reject(new Error('Erro de rede. Verifique sua conexão.'));>> src\api\apiClient.ts
echo     }>> src\api\apiClient.ts
echo     >> src\api\apiClient.ts
echo     // Handle API errors>> src\api\apiClient.ts
echo     const { status, data } = error.response;>> src\api\apiClient.ts
echo     >> src\api\apiClient.ts
echo     switch (status) {>> src\api\apiClient.ts
echo       case 404:>> src\api\apiClient.ts
echo         return Promise.reject(new Error('Recurso não encontrado.'));>> src\api\apiClient.ts
echo       case 500:>> src\api\apiClient.ts
echo         return Promise.reject(new Error('Erro interno do servidor.'));>> src\api\apiClient.ts
echo       default:>> src\api\apiClient.ts
echo         return Promise.reject(>> src\api\apiClient.ts
echo           new Error(data?.message || 'Algo deu errado. Tente novamente.')>> src\api\apiClient.ts
echo         );>> src\api\apiClient.ts
echo     }>> src\api\apiClient.ts
echo   }>> src\api\apiClient.ts
echo );>> src\api\apiClient.ts

REM Create types
echo // Generic API response> src\types\api.types.ts
echo export interface ApiResponse^<T^> {>> src\types\api.types.ts
echo   success: number;>> src\types\api.types.ts
echo   result: T;>> src\types\api.types.ts
echo }>> src\types\api.types.ts
echo. >> src\types\api.types.ts
echo // Country>> src\types\api.types.ts
echo export interface Country {>> src\types\api.types.ts
echo   country_key: string;>> src\types\api.types.ts
echo   country_name: string;>> src\types\api.types.ts
echo   country_logo: string;>> src\types\api.types.ts
echo }>> src\types\api.types.ts
echo. >> src\types\api.types.ts
echo export type CountryListResponse = ApiResponse^<Country[]^>;>> src\types\api.types.ts
echo. >> src\types\api.types.ts
echo // League>> src\types\api.types.ts
echo export interface League {>> src\types\api.types.ts
echo   league_key: string;>> src\types\api.types.ts
echo   league_name: string;>> src\types\api.types.ts
echo   country_key: string;>> src\types\api.types.ts
echo   country_name?: string;>> src\types\api.types.ts
echo   league_logo: string;>> src\types\api.types.ts
echo }>> src\types\api.types.ts
echo. >> src\types\api.types.ts
echo export type LeagueListResponse = ApiResponse^<League[]^>;>> src\types\api.types.ts
echo. >> src\types\api.types.ts
echo // Fixture/Match>> src\types\api.types.ts
echo export interface Fixture {>> src\types\api.types.ts
echo   event_key: string;>> src\types\api.types.ts
echo   event_date: string;>> src\types\api.types.ts
echo   event_time: string;>> src\types\api.types.ts
echo   event_home_team: string;>> src\types\api.types.ts
echo   event_away_team: string;>> src\types\api.types.ts
echo   event_home_team_id: string;>> src\types\api.types.ts
echo   event_away_team_id: string;>> src\types\api.types.ts
echo   event_status: string;>> src\types\api.types.ts
echo   event_final_result?: string;>> src\types\api.types.ts
echo   event_home_team_logo: string;>> src\types\api.types.ts
echo   event_away_team_logo: string;>> src\types\api.types.ts
echo   league_name: string;>> src\types\api.types.ts
echo   league_key: string;>> src\types\api.types.ts
echo   event_stadium?: string;>> src\types\api.types.ts
echo   home_team_logo?: string;  // Some API responses use this format>> src\types\api.types.ts
echo   away_team_logo?: string;>> src\types\api.types.ts
echo   country_name?: string;>> src\types\api.types.ts
echo   league_logo?: string;>> src\types\api.types.ts
echo }>> src\types\api.types.ts
echo. >> src\types\api.types.ts
echo export type FixtureListResponse = ApiResponse^<Fixture[]^>;>> src\types\api.types.ts
echo export type FixtureResponse = ApiResponse^<Fixture^>;>> src\types\api.types.ts

REM Create basic page components
echo import React from 'react';> src\pages\Dashboard.tsx
echo import styled from 'styled-components';>> src\pages\Dashboard.tsx
echo import DashboardLayout from '../components/layout/DashboardLayout';>> src\pages\Dashboard.tsx
echo import KPIRow from '../components/dashboard/KPIRow';>> src\pages\Dashboard.tsx
echo. >> src\pages\Dashboard.tsx
echo const GridLayout = styled.div`>> src\pages\Dashboard.tsx
echo   display: grid;>> src\pages\Dashboard.tsx
echo   grid-template-columns: repeat(12, 1fr);>> src\pages\Dashboard.tsx
echo   gap: 1.5rem;>> src\pages\Dashboard.tsx
echo   >> src\pages\Dashboard.tsx
echo   @media (max-width: 992px) {>> src\pages\Dashboard.tsx
echo     grid-template-columns: 1fr;>> src\pages\Dashboard.tsx
echo   }>> src\pages\Dashboard.tsx
echo `;>> src\pages\Dashboard.tsx
echo. >> src\pages\Dashboard.tsx
echo const Dashboard: React.FC = () => {>> src\pages\Dashboard.tsx
echo   return (>> src\pages\Dashboard.tsx
echo     ^<DashboardLayout^>>> src\pages\Dashboard.tsx
echo       ^<KPIRow /^>>> src\pages\Dashboard.tsx
echo       ^<GridLayout^>>> src\pages\Dashboard.tsx
echo         ^<div^>Odd Genius Platform^</div^>>> src\pages\Dashboard.tsx
echo       ^</GridLayout^>>> src\pages\Dashboard.tsx
echo     ^</DashboardLayout^>>> src\pages\Dashboard.tsx
echo   );>> src\pages\Dashboard.tsx
echo };>> src\pages\Dashboard.tsx
echo. >> src\pages\Dashboard.tsx
echo export default Dashboard;>> src\pages\Dashboard.tsx

echo import React from 'react';> src\pages\LivePage.tsx
echo import styled from 'styled-components';>> src\pages\LivePage.tsx
echo import DashboardLayout from '../components/layout/DashboardLayout';>> src\pages\LivePage.tsx
echo. >> src\pages\LivePage.tsx
echo const LivePageContainer = styled.div`>> src\pages\LivePage.tsx
echo   padding: 1rem;>> src\pages\LivePage.tsx
echo `;>> src\pages\LivePage.tsx
echo. >> src\pages\LivePage.tsx
echo const LivePage: React.FC = () => {>> src\pages\LivePage.tsx
echo   return (>> src\pages\LivePage.tsx
echo     ^<DashboardLayout^>>> src\pages\LivePage.tsx
echo       ^<LivePageContainer^>>> src\pages\LivePage.tsx
echo         ^<h1^>Partidas ao Vivo^</h1^>>> src\pages\LivePage.tsx
echo       ^</LivePageContainer^>>> src\pages\LivePage.tsx
echo     ^</DashboardLayout^>>> src\pages\LivePage.tsx
echo   );>> src\pages\LivePage.tsx
echo };>> src\pages\LivePage.tsx
echo. >> src\pages\LivePage.tsx
echo export default LivePage;>> src\pages\LivePage.tsx

echo import React from 'react';> src\pages\UpcomingPage.tsx
echo import styled from 'styled-components';>> src\pages\UpcomingPage.tsx
echo import DashboardLayout from '../components/layout/DashboardLayout';>> src\pages\UpcomingPage.tsx
echo. >> src\pages\UpcomingPage.tsx
echo const UpcomingPageContainer = styled.div`>> src\pages\UpcomingPage.tsx
echo   padding: 1rem;>> src\pages\UpcomingPage.tsx
echo `;>> src\pages\UpcomingPage.tsx
echo. >> src\pages\UpcomingPage.tsx
echo const UpcomingPage: React.FC = () => {>> src\pages\UpcomingPage.tsx
echo   return (>> src\pages\UpcomingPage.tsx
echo     ^<DashboardLayout^>>> src\pages\UpcomingPage.tsx
echo       ^<UpcomingPageContainer^>>> src\pages\UpcomingPage.tsx
echo         ^<h1^>Próximas Partidas^</h1^>>> src\pages\UpcomingPage.tsx
echo       ^</UpcomingPageContainer^>>> src\pages\UpcomingPage.tsx
echo     ^</DashboardLayout^>>> src\pages\UpcomingPage.tsx
echo   );>> src\pages\UpcomingPage.tsx
echo };>> src\pages\UpcomingPage.tsx
echo. >> src\pages\UpcomingPage.tsx
echo export default UpcomingPage;>> src\pages\UpcomingPage.tsx

echo import React from 'react';> src\pages\HistoryPage.tsx
echo import styled from 'styled-components';>> src\pages\HistoryPage.tsx
echo import DashboardLayout from '../components/layout/DashboardLayout';>> src\pages\HistoryPage.tsx
echo. >> src\pages\HistoryPage.tsx
echo const HistoryPageContainer = styled.div`>> src\pages\HistoryPage.tsx
echo   padding: 1rem;>> src\pages\HistoryPage.tsx
echo `;>> src\pages\HistoryPage.tsx
echo. >> src\pages\HistoryPage.tsx
echo const HistoryPage: React.FC = () => {>> src\pages\HistoryPage.tsx
echo   return (>> src\pages\HistoryPage.tsx
echo     ^<DashboardLayout^>>> src\pages\HistoryPage.tsx
echo       ^<HistoryPageContainer^>>> src\pages\HistoryPage.tsx
echo         ^<h1^>Histórico^</h1^>>> src\pages\HistoryPage.tsx
echo       ^</HistoryPageContainer^>>> src\pages\HistoryPage.tsx
echo     ^</DashboardLayout^>>> src\pages\HistoryPage.tsx
echo   );>> src\pages\HistoryPage.tsx
echo };>> src\pages\HistoryPage.tsx
echo. >> src\pages\HistoryPage.tsx
echo export default HistoryPage;>> src\pages\HistoryPage.tsx

echo import React from 'react';> src\pages\StatsPage.tsx
echo import styled from 'styled-components';>> src\pages\StatsPage.tsx
echo import DashboardLayout from '../components/layout/DashboardLayout';>> src\pages\StatsPage.tsx
echo. >> src\pages\StatsPage.tsx
echo const StatsPageContainer = styled.div`>> src\pages\StatsPage.tsx
echo   padding: 1rem;>> src\pages\StatsPage.tsx
echo `;>> src\pages\StatsPage.tsx
echo. >> src\pages\StatsPage.tsx
echo const StatsPage: React.FC = () => {>> src\pages\StatsPage.tsx
echo   return (>> src\pages\StatsPage.tsx
echo     ^<DashboardLayout^>>> src\pages\StatsPage.tsx
echo       ^<StatsPageContainer^>>> src\pages\StatsPage.tsx
echo         ^<h1^>Estatísticas^</h1^>>> src\pages\StatsPage.tsx
echo       ^</StatsPageContainer^>>> src\pages\StatsPage.tsx
echo     ^</DashboardLayout^>>> src\pages\StatsPage.tsx
echo   );>> src\pages\StatsPage.tsx
echo };>> src\pages\StatsPage.tsx
echo. >> src\pages\StatsPage.tsx
echo export default StatsPage;>> src\pages\StatsPage.tsx

echo import React from 'react';> src\pages\SettingsPage.tsx
echo import styled from 'styled-components';>> src\pages\SettingsPage.tsx
echo import DashboardLayout from '../components/layout/DashboardLayout';>> src\pages\SettingsPage.tsx
echo. >> src\pages\SettingsPage.tsx
echo const SettingsPageContainer = styled.div`>> src\pages\SettingsPage.tsx
echo   padding: 1rem;>> src\pages\SettingsPage.tsx
echo `;>> src\pages\SettingsPage.tsx
echo. >> src\pages\SettingsPage.tsx
echo const SettingsPage: React.FC = () => {>> src\pages\SettingsPage.tsx
echo   return (>> src\pages\SettingsPage.tsx
echo     ^<DashboardLayout^>>> src\pages\SettingsPage.tsx
echo       ^<SettingsPageContainer^>>> src\pages\SettingsPage.tsx
echo         ^<h1^>Configurações^</h1^>>> src\pages\SettingsPage.tsx
echo       ^</SettingsPageContainer^>>> src\pages\SettingsPage.tsx
echo     ^</DashboardLayout^>>> src\pages\SettingsPage.tsx
echo   );>> src\pages\SettingsPage.tsx
echo };>> src\pages\SettingsPage.tsx
echo. >> src\pages\SettingsPage.tsx
echo export default SettingsPage;>> src\pages\SettingsPage.tsx

echo import React from 'react';> src\pages\NotFoundPage.tsx
echo import styled from 'styled-components';>> src\pages\NotFoundPage.tsx
echo import { Link } from 'react-router-dom';>> src\pages\NotFoundPage.tsx
echo. >> src\pages\NotFoundPage.tsx
echo const NotFoundContainer = styled.div`>> src\pages\NotFoundPage.tsx
echo   display: flex;>> src\pages\NotFoundPage.tsx
echo   flex-direction: column;>> src\pages\NotFoundPage.tsx
echo   align-items: center;>> src\pages\NotFoundPage.tsx
echo   justify-content: center;>> src\pages\NotFoundPage.tsx
echo   height: 100vh;>> src\pages\NotFoundPage.tsx
echo   text-align: center;>> src\pages\NotFoundPage.tsx
echo   padding: 1rem;>> src\pages\NotFoundPage.tsx
echo `;>> src\pages\NotFoundPage.tsx
echo. >> src\pages\NotFoundPage.tsx
echo const Title = styled.h1`>> src\pages\NotFoundPage.tsx
echo   font-size: 6rem;>> src\pages\NotFoundPage.tsx
echo   margin-bottom: 1rem;>> src\pages\NotFoundPage.tsx
echo   color: var(--color-accent-primary);>> src\pages\NotFoundPage.tsx
echo `;>> src\pages\NotFoundPage.tsx
echo. >> src\pages\NotFoundPage.tsx
echo const Subtitle = styled.h2`>> src\pages\NotFoundPage.tsx
echo   font-size: 1.5rem;>> src\pages\NotFoundPage.tsx
echo   margin-bottom: 2rem;>> src\pages\NotFoundPage.tsx
echo `;>> src\pages\NotFoundPage.tsx
echo. >> src\pages\NotFoundPage.tsx
echo const HomeLink = styled(Link)`>> src\pages\NotFoundPage.tsx
echo   padding: 0.75rem 1.5rem;>> src\pages\NotFoundPage.tsx
echo   background-color: var(--color-accent-primary);>> src\pages\NotFoundPage.tsx
echo   color: white;>> src\pages\NotFoundPage.tsx
echo   border-radius: var(--border-radius-md);>> src\pages\NotFoundPage.tsx
echo   text-decoration: none;>> src\pages\NotFoundPage.tsx
echo   >> src\pages\NotFoundPage.tsx
echo   &:hover {>> src\pages\NotFoundPage.tsx
echo     background-color: var(--color-accent-secondary);>> src\pages\NotFoundPage.tsx
echo     text-decoration: none;>> src\pages\NotFoundPage.tsx
echo   }>> src\pages\NotFoundPage.tsx
echo `;>> src\pages\NotFoundPage.tsx
echo. >> src\pages\NotFoundPage.tsx
echo const NotFoundPage: React.FC = () => {>> src\pages\NotFoundPage.tsx
echo   return (>> src\pages\NotFoundPage.tsx
echo     ^<NotFoundContainer^>>> src\pages\NotFoundPage.tsx
echo       ^<Title^>404^</Title^>>> src\pages\NotFoundPage.tsx
echo       ^<Subtitle^>Página não encontrada^</Subtitle^>>> src\pages\NotFoundPage.tsx
echo       ^<HomeLink to="/"^>Voltar ao Início^</HomeLink^>>> src\pages\NotFoundPage.tsx
echo     ^</NotFoundContainer^>>> src\pages\NotFoundPage.tsx
echo   );>> src\pages\NotFoundPage.tsx
echo };>> src\pages\NotFoundPage.tsx
echo. >> src\pages\NotFoundPage.tsx
echo export default NotFoundPage;>> src\pages\NotFoundPage.tsx

REM Create layout components
echo import React from 'react';> src\components\layout\Header.tsx
echo import styled from 'styled-components';>> src\components\layout\Header.tsx
echo import { useApiStatus } from '../../hooks/useApiStatus';>> src\components\layout\Header.tsx
echo import { Link, useLocation } from 'react-router-dom';>> src\components\layout\Header.tsx
echo. >> src\components\layout\Header.tsx
echo const HeaderContainer = styled.header`>> src\components\layout\Header.tsx
echo   display: flex;>> src\components\layout\Header.tsx
echo   align-items: center;>> src\components\layout\Header.tsx
echo   justify-content: space-between;>> src\components\layout\Header.tsx
echo   background-color: #1E1E2A;>> src\components\layout\Header.tsx
echo   padding: 0.75rem 1.5rem;>> src\components\layout\Header.tsx
echo   box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);>> src\components\layout\Header.tsx
echo `;>> src\components\layout\Header.tsx
echo. >> src\components\layout\Header.tsx
echo const LogoContainer = styled.div`>> src\components\layout\Header.tsx
echo   display: flex;>> src\components\layout\Header.tsx
echo   align-items: center;>> src\components\layout\Header.tsx
echo   >> src\components\layout\Header.tsx
echo   img {>> src\components\layout\Header.tsx
echo     height: 32px;>> src\components\layout\Header.tsx
echo     margin-right: 0.5rem;>> src\components\layout\Header.tsx
echo   }>> src\components\layout\Header.tsx
echo   >> src\components\layout\Header.tsx
echo   h1 {>> src\components\layout\Header.tsx
echo     font-size: 1.25rem;>> src\components\layout\Header.tsx
echo     color: #ffffff;>> src\components\layout\Header.tsx
echo     font-weight: 600;>> src\components\layout\Header.tsx
echo   }>> src\components\layout\Header.tsx
echo `;>> src\components\layout\Header.tsx
echo. >> src\components\layout\Header.tsx
echo const NavMenu = styled.nav`>> src\components\layout\Header.tsx
echo   display: flex;>> src\components\layout\Header.tsx
echo   align-items: center;>> src\components\layout\Header.tsx
echo   >> src\components\layout\Header.tsx
echo   @media (max-width: 768px) {>> src\components\layout\Header.tsx
echo     display: none;>> src\components\layout\Header.tsx
echo   }>> src\components\layout\Header.tsx
echo `;>> src\components\layout\Header.tsx
echo. >> src\components\layout\Header.tsx
echo const NavLink = styled(Link)^<{ active: boolean }^>`>> src\components\layout\Header.tsx
echo   color: ${props => props.active ? '#ffffff' : '#B4B4C6'};>> src\components\layout\Header.tsx
echo   margin: 0 1rem;>> src\components\layout\Header.tsx
echo   padding: 0.5rem 0;>> src\components\layout\Header.tsx
echo   font-weight: 500;>> src\components\layout\Header.tsx
echo   text-decoration: none;>> src\components\layout\Header.tsx
echo   position: relative;>> src\components\layout\Header.tsx
echo   transition: color 0.2s ease;>> src\components\layout\Header.tsx
echo   >> src\components\layout\Header.tsx
echo   &:hover {>> src\components\layout\Header.tsx
echo     color: #ffffff;>> src\components\layout\Header.tsx
echo   }>> src\components\layout\Header.tsx
echo   >> src\components\layout\Header.tsx
echo   ${props => props.active && `>> src\components\layout\Header.tsx
echo     &:after {>> src\components\layout\Header.tsx
echo       content: '';>> src\components\layout\Header.tsx
echo       position: absolute;>> src\components\layout\Header.tsx
echo       bottom: -4px;>> src\components\layout\Header.tsx
echo       left: 0;>> src\components\layout\Header.tsx
echo       right: 0;>> src\components\layout\Header.tsx
echo       height: 3px;>> src\components\layout\Header.tsx
echo       background: #6366F1;>> src\components\layout\Header.tsx
echo       border-radius: 3px;>> src\components\layout\Header.tsx
echo     }>> src\components\layout\Header.tsx
echo   `}>> src\components\layout\Header.tsx
echo `;>> src\components\layout\Header.tsx
echo. >> src\components\layout\Header.tsx
echo const StatusGroup = styled.div`>> src\components\layout\Header.tsx
echo   display: flex;>> src\components\layout\Header.tsx
echo   align-items: center;>> src\components\layout\Header.tsx
echo `;>> src\components\layout\Header.tsx
echo. >> src\components\layout\Header.tsx
echo const ApiStatus = styled.div^<{ isConnected: boolean }^>`>> src\components\layout\Header.tsx
echo   display: flex;>> src\components\layout\Header.tsx
echo   align-items: center;>> src\components\layout\Header.tsx
echo   margin-right: 1.5rem;>> src\components\layout\Header.tsx
echo   >> src\components\layout\Header.tsx
echo   .indicator {>> src\components\layout\Header.tsx
echo     width: 10px;>> src\components\layout\Header.tsx
echo     height: 10px;>> src\components\layout\Header.tsx
echo     border-radius: 50%;>> src\components\layout\Header.tsx
echo     background-color: ${props => props.isConnected ? '#34D399' : '#F87171'};>> src\components\layout\Header.tsx
echo     margin-right: 0.5rem;>> src\components\layout\Header.tsx
echo   }>> src\components\layout\Header.tsx
echo   >> src\components\layout\Header.tsx
echo   span {>> src\components\layout\Header.tsx
echo     color: #B4B4C6;>> src\components\layout\Header.tsx
echo     font-size: 0.875rem;>> src\components\layout\Header.tsx
echo   }>> src\components\layout\Header.tsx
echo `;>> src\components\layout\Header.tsx
echo. >> src\components\layout\Header.tsx
echo const NotificationBadge = styled.div`>> src\components\layout\Header.tsx
echo   position: relative;>> src\components\layout\Header.tsx
echo   margin-left: 1rem;>> src\components\layout\Header.tsx
echo   >> src\components\layout\Header.tsx
echo   .icon {>> src\components\layout\Header.tsx
echo     color: #B4B4C6;>> src\components\layout\Header.tsx
echo     font-size: 1.25rem;>> src\components\layout\Header.tsx
echo     cursor: pointer;>> src\components\layout\Header.tsx
echo   }>> src\components\layout\Header.tsx
echo   >> src\components\layout\Header.tsx
echo   .badge {>> src\components\layout\Header.tsx
echo     position: absolute;>> src\components\layout\Header.tsx
echo     top: -5px;>> src\components\layout\Header.tsx
echo     right: -5px;>> src\components\layout\Header.tsx
echo     background-color: #EF4444;>> src\components\layout\Header.tsx
echo     color: white;>> src\components\layout\Header.tsx
echo     border-radius: 50%;>> src\components\layout\Header.tsx
echo     width: 16px;>> src\components\layout\Header.tsx
echo     height: 16px;>> src\components\layout\Header.tsx
echo     font-size: 0.7rem;>> src\components\layout\Header.tsx
echo     display: flex;>> src\components\layout\Header.tsx
echo     align-items: center;>> src\components\layout\Header.tsx
echo     justify-content: center;>> src\components\layout\Header.tsx
echo   }>> src\components\layout\Header.tsx
echo `;>> src\components\layout\Header.tsx
echo. >> src\components\layout\Header.tsx
echo const Header: React.FC = () => {>> src\components\layout\Header.tsx
echo   // In a real implementation, you would use the useApiStatus hook>> src\components\layout\Header.tsx
echo   // But for this simple version, we'll just hardcode it>> src\components\layout\Header.tsx
echo   const isConnected = true;>> src\components\layout\Header.tsx
echo   const location = useLocation();>> src\components\layout\Header.tsx
echo   >> src\components\layout\Header.tsx
echo   const navItems = [>> src\components\layout\Header.tsx
echo     { name: 'Home', path: '/' },>> src\components\layout\Header.tsx
echo     { name: 'Ao Vivo', path: '/live' },>> src\components\layout\Header.tsx
echo     { name: 'Próximas', path: '/upcoming' },>> src\components\layout\Header.tsx
echo     { name: 'Histórico', path: '/history' },>> src\components\layout\Header.tsx
echo     { name: 'Estatísticas', path: '/statistics' },>> src\components\layout\Header.tsx
echo     { name: 'Configurações', path: '/settings' }>> src\components\layout\Header.tsx
echo   ];>> src\components\layout\Header.tsx
echo   >> src\components\layout\Header.tsx
echo   return (>> src\components\layout\Header.tsx
echo     ^<HeaderContainer^>>> src\components\layout\Header.tsx
echo       ^<LogoContainer^>>> src\components\layout\Header.tsx
echo         ^<h1^>Odd Genius^</h1^>>> src\components\layout\Header.tsx
echo       ^</LogoContainer^>>> src\components\layout\Header.tsx
echo       >> src\components\layout\Header.tsx
echo       ^<NavMenu^>>> src\components\layout\Header.tsx
echo         {navItems.map(item => (>> src\components\layout\Header.tsx
echo           ^<NavLink >> src\components\layout\Header.tsx
echo             key={item.path} >> src\components\layout\Header.tsx
echo             to={item.path} >> src\components\layout\Header.tsx
echo             active={location.pathname === item.path}>> src\components\layout\Header.tsx
echo           ^>>> src\components\layout\Header.tsx
echo             {item.name}>> src\components\layout\Header.tsx
echo           ^</NavLink^>>> src\components\layout\Header.tsx
echo         ))}>> src\components\layout\Header.tsx
echo       ^</NavMenu^>>> src\components\layout\Header.tsx
echo       >> src\components\layout\Header.tsx
echo       ^<StatusGroup^>>> src\components\layout\Header.tsx
echo         ^<ApiStatus isConnected={isConnected}^>>> src\components\layout\Header.tsx
echo           ^<div className="indicator" /^>>> src\components\layout\Header.tsx
echo           ^<span^>{isConnected ? 'API Conectada' : 'API Desconectada'}^</span^>>> src\components\layout\Header.tsx
echo         ^</ApiStatus^>>> src\components\layout\Header.tsx
echo         >> src\components\layout\Header.tsx
echo         ^<NotificationBadge^>>> src\components\layout\Header.tsx
echo           ^<i className="icon fas fa-bell" /^>>> src\components\layout\Header.tsx
echo           ^<div className="badge"^>3^</div^>>> src\components\layout\Header.tsx
echo         ^</NotificationBadge^>>> src\components\layout\Header.tsx
echo       ^</StatusGroup^>>> src\components\layout\Header.tsx
echo     ^</HeaderContainer^>>> src\components\layout\Header.tsx
echo   );>> src\components\layout\Header.tsx
echo };>> src\components\layout\Header.tsx
echo. >> src\components\layout\Header.tsx
echo export default Header;>> src\components\layout\Header.tsx

echo import React from 'react';> src\components\layout\DashboardLayout.tsx
echo import styled from 'styled-components';>> src\components\layout\DashboardLayout.tsx
echo import Header from './Header';>> src\components\layout\DashboardLayout.tsx
echo import { MatchProvider } from '../../context/MatchContext';>> src\components\layout\DashboardLayout.tsx
echo. >> src\components\layout\DashboardLayout.tsx
echo const LayoutContainer = styled.div`>> src\components\layout\DashboardLayout.tsx
echo   min-height: 100vh;>> src\components\layout\DashboardLayout.tsx
echo   background-color: var(--color-bg-primary);>> src\components\layout\DashboardLayout.tsx
echo `;>> src\components\layout\DashboardLayout.tsx
echo. >> src\components\layout\DashboardLayout.tsx
echo const MainContent = styled.main`>> src\components\layout\DashboardLayout.tsx
echo   padding: 1.5rem;>> src\components\layout\DashboardLayout.tsx
echo   max-width: 1400px;>> src\components\layout\DashboardLayout.tsx
echo   margin: 0 auto;>> src\components\layout\DashboardLayout.tsx
echo `;>> src\components\layout\DashboardLayout.tsx
echo. >> src\components\layout\DashboardLayout.tsx
echo interface DashboardLayoutProps {>> src\components\layout\DashboardLayout.tsx
echo   children: React.ReactNode;>> src\components\layout\DashboardLayout.tsx
echo }>> src\components\layout\DashboardLayout.tsx
echo. >> src\components\layout\DashboardLayout.tsx
echo const DashboardLayout: React.FC^<DashboardLayoutProps^> = ({ children }) => {>> src\components\layout\DashboardLayout.tsx
echo   return (>> src\components\layout\DashboardLayout.tsx
echo     ^<MatchProvider^>>> src\components\layout\DashboardLayout.tsx
echo       ^<LayoutContainer^>>> src\components\layout\DashboardLayout.tsx
echo         ^<Header /^>>> src\components\layout\DashboardLayout.tsx
echo         ^<MainContent^>{children}^</MainContent^>>> src\components\layout\DashboardLayout.tsx
echo       ^</LayoutContainer^>>> src\components\layout\DashboardLayout.tsx
echo     ^</MatchProvider^>>> src\components\layout\DashboardLayout.tsx
echo   );>> src\components\layout\DashboardLayout.tsx
echo };>> src\components\layout\DashboardLayout.tsx
echo. >> src\components\layout\DashboardLayout.tsx
echo export default DashboardLayout;>> src\components\layout\DashboardLayout.tsx

REM Create dashboard components
echo import React from 'react';> src\components\dashboard\KPIRow.tsx
echo import styled from 'styled-components';>> src\components\dashboard\KPIRow.tsx
echo. >> src\components\dashboard\KPIRow.tsx
echo const KPIContainer = styled.div`>> src\components\dashboard\KPIRow.tsx
echo   display: grid;>> src\components\dashboard\KPIRow.tsx
echo   grid-template-columns: repeat(4, 1fr);>> src\components\dashboard\KPIRow.tsx
echo   gap: 1rem;>> src\components\dashboard\KPIRow.tsx
echo   margin-bottom: 1.5rem;>> src\components\dashboard\KPIRow.tsx
echo   >> src\components\dashboard\KPIRow.tsx
echo   @media (max-width: 992px) {>> src\components\dashboard\KPIRow.tsx
echo     grid-template-columns: repeat(2, 1fr);>> src\components\dashboard\KPIRow
echo   }>> src\components\dashboard\KPIRow.tsx
echo   >> src\components\dashboard\KPIRow.tsx
echo   @media (max-width: 576px) {>> src\components\dashboard\KPIRow.tsx
echo     grid-template-columns: 1fr;>> src\components\dashboard\KPIRow.tsx
echo   }>> src\components\dashboard\KPIRow.tsx
echo `;>> src\components\dashboard\KPIRow.tsx
echo. >> src\components\dashboard\KPIRow.tsx
echo const KPICard = styled.div`>> src\components\dashboard\KPIRow.tsx
echo   background-color: var(--color-bg-secondary);>> src\components\dashboard\KPIRow.tsx
echo   border-radius: var(--border-radius-lg);>> src\components\dashboard\KPIRow.tsx
echo   padding: 1.25rem;>> src\components\dashboard\KPIRow.tsx
echo   display: flex;>> src\components\dashboard\KPIRow.tsx
echo   flex-direction: column;>> src\components\dashboard\KPIRow.tsx
echo   box-shadow: var(--shadow-sm);>> src\components\dashboard\KPIRow.tsx
echo `;>> src\components\dashboard\KPIRow.tsx
echo. >> src\components\dashboard\KPIRow.tsx
echo const KPITitle = styled.h3`>> src\components\dashboard\KPIRow.tsx
echo   font-size: 0.875rem;>> src\components\dashboard\KPIRow.tsx
echo   color: var(--color-text-secondary);>> src\components\dashboard\KPIRow.tsx
echo   margin-bottom: 0.5rem;>> src\components\dashboard\KPIRow.tsx
echo   font-weight: 500;>> src\components\dashboard\KPIRow.tsx
echo `;>> src\components\dashboard\KPIRow.tsx
echo. >> src\components\dashboard\KPIRow.tsx
echo const KPIValue = styled.div`>> src\components\dashboard\KPIRow.tsx
echo   font-size: 1.5rem;>> src\components\dashboard\KPIRow.tsx
echo   font-weight: 600;>> src\components\dashboard\KPIRow.tsx
echo   color: var(--color-text-primary);>> src\components\dashboard\KPIRow.tsx
echo `;>> src\components\dashboard\KPIRow.tsx
echo. >> src\components\dashboard\KPIRow.tsx
echo const KPISubtext = styled.div`>> src\components\dashboard\KPIRow.tsx
echo   font-size: 0.75rem;>> src\components\dashboard\KPIRow.tsx
echo   color: var(--color-text-tertiary);>> src\components\dashboard\KPIRow.tsx
echo   margin-top: 0.5rem;>> src\components\dashboard\KPIRow.tsx
echo `;>> src\components\dashboard\KPIRow.tsx
echo. >> src\components\dashboard\KPIRow.tsx
echo const KPIRow: React.FC = () => {>> src\components\dashboard\KPIRow.tsx
echo   // In a real app, these would come from an API or context>> src\components\dashboard\KPIRow.tsx
echo   const kpiData = [>> src\components\dashboard\KPIRow.tsx
echo     {>> src\components\dashboard\KPIRow.tsx
echo       title: 'ROI Médio',>> src\components\dashboard\KPIRow.tsx
echo       value: '+12.3%%',>> src\components\dashboard\KPIRow.tsx
echo       subtext: 'Últimos 30 dias',>> src\components\dashboard\KPIRow.tsx
echo       positive: true>> src\components\dashboard\KPIRow.tsx
echo     },>> src\components\dashboard\KPIRow.tsx
echo     {>> src\components\dashboard\KPIRow.tsx
echo       title: 'Taxa de Acerto',>> src\components\dashboard\KPIRow.tsx
echo       value: '68%%',>> src\components\dashboard\KPIRow.tsx
echo       subtext: '52 de 76 apostas',>> src\components\dashboard\KPIRow.tsx
echo       positive: true>> src\components\dashboard\KPIRow.tsx
echo     },>> src\components\dashboard\KPIRow.tsx
echo     {>> src\components\dashboard\KPIRow.tsx
echo       title: 'Partidas Hoje',>> src\components\dashboard\KPIRow.tsx
echo       value: '87',>> src\components\dashboard\KPIRow.tsx
echo       subtext: '14 ligas',>> src\components\dashboard\KPIRow.tsx
echo       positive: null>> src\components\dashboard\KPIRow.tsx
echo     },>> src\components\dashboard\KPIRow.tsx
echo     {>> src\components\dashboard\KPIRow.tsx
echo       title: 'Ao Vivo',>> src\components\dashboard\KPIRow.tsx
echo       value: '23',>> src\components\dashboard\KPIRow.tsx
echo       subtext: 'Agora',>> src\components\dashboard\KPIRow.tsx
echo       positive: null>> src\components\dashboard\KPIRow.tsx
echo     }>> src\components\dashboard\KPIRow.tsx
echo   ];>> src\components\dashboard\KPIRow.tsx
echo   >> src\components\dashboard\KPIRow.tsx
echo   return (>> src\components\dashboard\KPIRow.tsx
echo     ^<KPIContainer^>>> src\components\dashboard\KPIRow.tsx
echo       {kpiData.map((kpi, index) => (>> src\components\dashboard\KPIRow.tsx
echo         ^<KPICard key={index}^>>> src\components\dashboard\KPIRow.tsx
echo           ^<KPITitle^>{kpi.title}^</KPITitle^>>> src\components\dashboard\KPIRow.tsx
echo           ^<KPIValue >> src\components\dashboard\KPIRow.tsx
echo             style={{ >> src\components\dashboard\KPIRow.tsx
echo               color: kpi.positive === true >> src\components\dashboard\KPIRow.tsx
echo                 ? 'var(--color-success)' >> src\components\dashboard\KPIRow.tsx
echo                 : (kpi.positive === false ? 'var(--color-danger)' : 'var(--color-text-primary)')>> src\components\dashboard\KPIRow.tsx
echo             }}>> src\components\dashboard\KPIRow.tsx
echo           ^>>> src\components\dashboard\KPIRow.tsx
echo             {kpi.value}>> src\components\dashboard\KPIRow.tsx
echo           ^</KPIValue^>>> src\components\dashboard\KPIRow.tsx
echo           ^<KPISubtext^>{kpi.subtext}^</KPISubtext^>>> src\components\dashboard\KPIRow.tsx
echo         ^</KPICard^>>> src\components\dashboard\KPIRow.tsx
echo       ))}>> src\components\dashboard\KPIRow.tsx
echo     ^</KPIContainer^>>> src\components\dashboard\KPIRow.tsx
echo   );>> src\components\dashboard\KPIRow.tsx
echo };>> src\components\dashboard\KPIRow.tsx
echo. >> src\components\dashboard\KPIRow.tsx
echo export default KPIRow;>> src\components\dashboard\KPIRow.tsx

echo import React from 'react';> src\components\dashboard\DateSelector.tsx
echo import styled from 'styled-components';>> src\components\dashboard\DateSelector.tsx
echo. >> src\components\dashboard\DateSelector.tsx
echo const DateSelectorContainer = styled.div`>> src\components\dashboard\DateSelector.tsx
echo   display: flex;>> src\components\dashboard\DateSelector.tsx
echo   align-items: center;>> src\components\dashboard\DateSelector.tsx
echo   justify-content: space-between;>> src\components\dashboard\DateSelector.tsx
echo   background-color: var(--color-bg-tertiary);>> src\components\dashboard\DateSelector.tsx
echo   border-radius: var(--border-radius-md);>> src\components\dashboard\DateSelector.tsx
echo   padding: 0.5rem 1rem;>> src\components\dashboard\DateSelector.tsx
echo   margin-bottom: 1rem;>> src\components\dashboard\DateSelector.tsx
echo `;>> src\components\dashboard\DateSelector.tsx
echo. >> src\components\dashboard\DateSelector.tsx
echo const ArrowButton = styled.button`>> src\components\dashboard\DateSelector.tsx
echo   background: none;>> src\components\dashboard\DateSelector.tsx
echo   border: none;>> src\components\dashboard\DateSelector.tsx
echo   color: var(--color-text-secondary);>> src\components\dashboard\DateSelector.tsx
echo   cursor: pointer;>> src\components\dashboard\DateSelector.tsx
echo   font-size: 1rem;>> src\components\dashboard\DateSelector.tsx
echo   display: flex;>> src\components\dashboard\DateSelector.tsx
echo   align-items: center;>> src\components\dashboard\DateSelector.tsx
echo   justify-content: center;>> src\components\dashboard\DateSelector.tsx
echo   padding: 0.5rem;>> src\components\dashboard\DateSelector.tsx
echo   border-radius: var(--border-radius-sm);>> src\components\dashboard\DateSelector.tsx
echo   >> src\components\dashboard\DateSelector.tsx
echo   &:hover {>> src\components\dashboard\DateSelector.tsx
echo     color: var(--color-text-primary);>> src\components\dashboard\DateSelector.tsx
echo     background-color: rgba(255, 255, 255, 0.05);>> src\components\dashboard\DateSelector.tsx
echo   }>> src\components\dashboard\DateSelector.tsx
echo   >> src\components\dashboard\DateSelector.tsx
echo   &:focus {>> src\components\dashboard\DateSelector.tsx
echo     outline: none;>> src\components\dashboard\DateSelector.tsx
echo   }>> src\components\dashboard\DateSelector.tsx
echo `;>> src\components\dashboard\DateSelector.tsx
echo. >> src\components\dashboard\DateSelector.tsx
echo const DateDisplay = styled.div`>> src\components\dashboard\DateSelector.tsx
echo   color: var(--color-text-primary);>> src\components\dashboard\DateSelector.tsx
echo   font-weight: 500;>> src\components\dashboard\DateSelector.tsx
echo   text-align: center;>> src\components\dashboard\DateSelector.tsx
echo   flex: 1;>> src\components\dashboard\DateSelector.tsx
echo `;>> src\components\dashboard\DateSelector.tsx
echo. >> src\components\dashboard\DateSelector.tsx
echo const TodayButton = styled.button`>> src\components\dashboard\DateSelector.tsx
echo   background-color: var(--color-accent-primary);>> src\components\dashboard\DateSelector.tsx
echo   color: white;>> src\components\dashboard\DateSelector.tsx
echo   border: none;>> src\components\dashboard\DateSelector.tsx
echo   padding: 0.25rem 0.75rem;>> src\components\dashboard\DateSelector.tsx
echo   border-radius: var(--border-radius-md);>> src\components\dashboard\DateSelector.tsx
echo   margin-left: 1rem;>> src\components\dashboard\DateSelector.tsx
echo   font-size: 0.75rem;>> src\components\dashboard\DateSelector.tsx
echo   font-weight: 500;>> src\components\dashboard\DateSelector.tsx
echo   cursor: pointer;>> src\components\dashboard\DateSelector.tsx
echo   >> src\components\dashboard\DateSelector.tsx
echo   &:hover {>> src\components\dashboard\DateSelector.tsx
echo     background-color: var(--color-accent-secondary);>> src\components\dashboard\DateSelector.tsx
echo   }>> src\components\dashboard\DateSelector.tsx
echo   >> src\components\dashboard\DateSelector.tsx
echo   &:focus {>> src\components\dashboard\DateSelector.tsx
echo     outline: none;>> src\components\dashboard\DateSelector.tsx
echo   }>> src\components\dashboard\DateSelector.tsx
echo `;>> src\components\dashboard\DateSelector.tsx
echo. >> src\components\dashboard\DateSelector.tsx
echo interface DateSelectorProps {>> src\components\dashboard\DateSelector.tsx
echo   date: Date;>> src\components\dashboard\DateSelector.tsx
echo   formattedDate: string;>> src\components\dashboard\DateSelector.tsx
echo   onPrevious: () => void;>> src\components\dashboard\DateSelector.tsx
echo   onNext: () => void;>> src\components\dashboard\DateSelector.tsx
echo   onToday: () => void;>> src\components\dashboard\DateSelector.tsx
echo   showTodayButton?: boolean;>> src\components\dashboard\DateSelector.tsx
echo }>> src\components\dashboard\DateSelector.tsx
echo. >> src\components\dashboard\DateSelector.tsx
echo const DateSelector: React.FC^<DateSelectorProps^> = ({>> src\components\dashboard\DateSelector.tsx
echo   date,>> src\components\dashboard\DateSelector.tsx
echo   formattedDate,>> src\components\dashboard\DateSelector.tsx
echo   onPrevious,>> src\components\dashboard\DateSelector.tsx
echo   onNext,>> src\components\dashboard\DateSelector.tsx
echo   onToday,>> src\components\dashboard\DateSelector.tsx
echo   showTodayButton = true>> src\components\dashboard\DateSelector.tsx
echo }) => {>> src\components\dashboard\DateSelector.tsx
echo   return (>> src\components\dashboard\DateSelector.tsx
echo     ^<DateSelectorContainer^>>> src\components\dashboard\DateSelector.tsx
echo       ^<ArrowButton onClick={onPrevious} title="Dia anterior"^>>> src\components\dashboard\DateSelector.tsx
echo         ^<i className="fas fa-chevron-left" /^>>> src\components\dashboard\DateSelector.tsx
echo       ^</ArrowButton^>>> src\components\dashboard\DateSelector.tsx
echo       >> src\components\dashboard\DateSelector.tsx
echo       ^<DateDisplay^>{formattedDate}^</DateDisplay^>>> src\components\dashboard\DateSelector.tsx
echo       >> src\components\dashboard\DateSelector.tsx
echo       ^<div^>>> src\components\dashboard\DateSelector.tsx
echo         ^<ArrowButton onClick={onNext} title="Próximo dia"^>>> src\components\dashboard\DateSelector.tsx
echo           ^<i className="fas fa-chevron-right" /^>>> src\components\dashboard\DateSelector.tsx
echo         ^</ArrowButton^>>> src\components\dashboard\DateSelector.tsx
echo         >> src\components\dashboard\DateSelector.tsx
echo         {showTodayButton && (>> src\components\dashboard\DateSelector.tsx
echo           ^<TodayButton onClick={onToday}^>>> src\components\dashboard\DateSelector.tsx
echo             Hoje>> src\components\dashboard\DateSelector.tsx
echo           ^</TodayButton^>>> src\components\dashboard\DateSelector.tsx
echo         )}>> src\components\dashboard\DateSelector.tsx
echo       ^</div^>>> src\components\dashboard\DateSelector.tsx
echo     ^</DateSelectorContainer^>>> src\components\dashboard\DateSelector.tsx
echo   );>> src\components\dashboard\DateSelector.tsx
echo };>> src\components\dashboard\DateSelector.tsx
echo. >> src\components\dashboard\DateSelector.tsx
echo export default DateSelector;>> src\components\dashboard\DateSelector.tsx

REM Create hooks
echo import { useState } from 'react';> src\hooks\useApiStatus.ts
echo import { useApiStatus as useContextApiStatus } from '../context/ApiStatusContext';>> src\hooks\useApiStatus.ts
echo. >> src\hooks\useApiStatus.ts
echo export const useApiStatus = () => {>> src\hooks\useApiStatus.ts
echo   const context = useContextApiStatus();>> src\hooks\useApiStatus.ts
echo   return context;>> src\hooks\useApiStatus.ts
echo };>> src\hooks\useApiStatus.ts

echo Frontend setup completed successfully!