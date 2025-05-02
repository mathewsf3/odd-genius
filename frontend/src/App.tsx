// Try this dynamic import approach
import React from 'react';
import { Routes, Route, Navigate } from 'react-router-dom';
import { ThemeProvider } from 'styled-components';

// Dynamic import with React.lazy
const Dashboard = React.lazy(() => import('./pages/Dashboard'));

// Theme definition and other components...

const App: React.FC = () => {
  return (
    <ThemeProvider theme={theme}>
      <React.Suspense fallback={<div>Loading...</div>}>
        <Routes>
          <Route path="/" element={<Dashboard />} />
          <Route path="/live" element={<LivePage />} />
          {/* Other routes */}
        </Routes>
      </React.Suspense>
    </ThemeProvider>
  );
};

export default App;