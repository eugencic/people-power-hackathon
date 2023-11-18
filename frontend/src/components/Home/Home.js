import './Home.css';
import { useRef } from 'react';
import MySvg from '../../assets/map.svg';
import { ReactSVG } from 'react-svg';
import { useNavigate } from 'react-router-dom';

function Home() {
  const tooltipRef = useRef();
  const navigate = useNavigate();

  const handlePathClick = (id) => {
    navigate(`/regions/${id}`);
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
        path.addEventListener('click', () => {
          handlePathClick(path.getAttribute('id'));
        });
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

export default Home;
