import logo from './logo.svg';
import './App.css';
import { useEffect, useRef } from 'react';
import MySvg from './assets/map.svg'; // Update with your actual file path
import { ReactSVG } from 'react-svg';

function App() {
  const tooltipRef = useRef();
  const handleClickRef = useRef();

  const handlePathClick = (pathData) => {
    console.log('Path clicked:', pathData);
  };

  function mouseEntered(e, data) {
    const target = e.target;

    if (target.nodeName === 'path') {
      target.style.opacity = 0.6;

      tooltipRef.current.style.transform = `translate(${e.offsetX}px, ${e.offsetY}px)`;

      tooltipRef.current.innerHTML = `
        <ul>
            <li><b>Province: ${data.name}</b></li>
        </ul>`;
    }
  }

  function mouseGone(e) {
    const target = e.target;

    if (target.nodeName === 'path') {
      target.style.opacity = 1;
      tooltipRef.current.innerHTML = '';
    }
  }

  const attachClickHandlers = () => {
    const svgElement = document.getElementById('map-svg');

    if (svgElement) {
      const paths = svgElement.querySelectorAll('path');

      paths.forEach((path, index) => {
        handleClickRef.current = () => {
          handlePathClick({ id: index, data: path.getAttribute('name') });
        };

        path.addEventListener('click', handleClickRef.current);
        path.addEventListener('mouseenter', (e) => {
          mouseEntered(e, { name: path.getAttribute('name') });
        });
        path.addEventListener('mouseout', (e) => {
          mouseGone(e);
        });
      });
    }
  };

  return (
    <div className="content">
      <div className="map-wrapper">
        <div id="toolTip" ref={tooltipRef}></div>
        <div>
          <ReactSVG
            src={MySvg}
            afterInjection={() => attachClickHandlers()}
            beforeInjection={(svg) => {
              return svg;
            }}
            evalScripts="always"
            fallback={() => <span>Error loading SVG</span>}
            loading={() => <span>Loading SVG</span>}
            renumerateIRIElements={false}
            wrapper="span"
            className="svg-container"
            id="my-svg"
          />
        </div>
      </div>
    </div>
  );
}

export default App;
