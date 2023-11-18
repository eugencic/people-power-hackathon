import logo from './logo.svg';
import './App.css';
import { useEffect } from 'react';

function App() {
  // var map = document.getElementById('map').contentDocument.querySelector('svg');
  // var toolTip = document.getElementById('toolTip');
  //
  // function mouseEntered(e) {
  //   var target = e.target;
  //   if (target.nodeName == 'path') {
  //     target.style.opacity = 0.6;
  //     var details = e.target.attributes;
  //
  //     // Follow cursor
  //     toolTip.style.transform = `translate(${e.offsetX}px, ${e.offsetY}px)`;
  //
  //     // Tooltip data
  //     toolTip.innerHTML = `
  //       <ul>
  //           <li><b>Province: ${details.name.value}</b></li>
  //           <li>Local name: ${details.gn_name.value}</li>
  //           <li>Country: ${details.admin.value}</li>
  //       </ul>`;
  //   }
  // }
  //
  // // Clear tooltip on mouseout
  // function mouseGone(e) {
  //   var target = e.target;
  //   if (target.nodeName == 'path') {
  //     target.style.opacity = 1;
  //     toolTip.innerHTML = '';
  //   }
  // }
  //
  // // Go to wikidata page onclick
  // function handleClick(e) {
  //   if (e.target.nodeName == 'path') {
  //     var details = e.target.attributes;
  //     window.open(`https://www.wikidata.org/wiki/${details.wikidataid.value}`, '_blank');
  //   }
  // }
  //
  // useEffect(() => {
  //   map.addEventListener('click', handleClick, false);
  //   map.addEventListener('mousemove', mouseEntered, false);
  //   map.addEventListener('mouseout', mouseGone, false);
  // }, []);

  function handleClick(e) {
    console.log(e.target.children[0]);
    if (e.target.nodeName == 'path') {
      var details = e.target.attributes;
      window.open(`https://www.wikidata.org/wiki/${details.wikidataid.value}`, '_blank');
    }
  }

  return (
    <div className="content">
      <div className="map-wrapper">
        <div id="toolTip"></div>
        <div className="clickable" onClick={handleClick}>
          <object id="map" data="/assets/map.svg" type="image/svg+xml"></object>
        </div>
      </div>
    </div>
  );
}

export default App;
