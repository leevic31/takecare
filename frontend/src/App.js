import './App.css';
import axios from "axios";
import Organizations from './components/Organizations';
import { useEffect, useState } from 'react';

function App() {
  const [organizations, setOrganizations] = useState([])
  const url = "http://localhost:3000/organizations"
  
  const getOrganizations = () => {
    axios.get(url).then(response => {
      setOrganizations(Object.entries(response.data))
    })
  }
  
  useEffect(() => {
    getOrganizations()
  }, [])

  return (
    <>
    <div className="App">
      <h1>Hello</h1>
      <Organizations organizations={organizations} />
    </div>
    </>
  );
}

export default App;
