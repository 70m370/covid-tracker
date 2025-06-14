import { useState, useEffect } from 'react'
import api from '../src/libs/axios'
import './App.css'


function App() {
  const [count, setCount] = useState(0);
  const [data, setData] = useState(null);

  // this will handle the results after
  useEffect(() => {
    api.get('/results')
      .then((res) => setData(res.data))
      .catch((err) => console.error(err));
  }, []);


  console.log(data);
  return (
    <div className="p-4">
      <h1 className="text-xl font-bold">COVID Tracker</h1>
      {/* simple test */}
      <pre>{JSON.stringify(data, null, 2)}</pre>
    </div>
  )
};

export default App
