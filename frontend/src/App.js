import './App.css';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Region from './components/Region/Region';
import Home from './components/Home/Home';

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="regions" element={<Region />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
