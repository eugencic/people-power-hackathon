import { useParams } from 'react-router-dom';
import { useEffect, useState } from 'react';
import axios from 'redaxios';

const baseURL = 'https://jsonplaceholder.typicode.com/posts/';

function Region() {
  const { regionId } = useParams();
  const [region, setRegion] = useState(null);

  useEffect(() => {
    axios.get(`${baseURL}${regionId}`).then((response) => {
      setRegion(response.data);
      console.log(response.data);
    });
  }, []);

  if (!region) return null;

  return <h1>Region {regionId}</h1>;
}

export default Region;
