import './App.css';
import Home from "./components/Home"
import Organizations, { organizationsLoader } from './components/Organizations';
import {
  createBrowserRouter,
  Route,
  createRoutesFromElements,
  RouterProvider,
} from "react-router-dom";

function App() {
  const router = createBrowserRouter(
    createRoutesFromElements(
      <Route 
        path="/" 
        element={<Home />}
      >
        <Route 
          path="/organizations" 
          element={<Organizations/>} 
          loader={organizationsLoader}
        />
      </Route> 
    )
  )

  return (
    <>
    <div className="App">
      <h1>Welcome to Takecare</h1>
      <RouterProvider router={router} />
    </div>
    </>
  );
}

export default App;
