import {
  createBrowserRouter,
  Route,
  createRoutesFromElements,
  RouterProvider
} from "react-router-dom";
import './App.css';
import Home from "./components/Home"
import Organization, { organizationLoader } from './components/Organization';
import Organizations from './components/Organizations';
import Services from './components/Services';
import '@radix-ui/themes/styles.css';

function App() {
  const router = createBrowserRouter(
    createRoutesFromElements(
      <Route 
        path="/" 
        element={<Home />}
      >
        <Route 
          path="organizations" 
          element={<Organizations/>} 
        />
        <Route
          path="organizations/:id"
          element={<Organization />}
          loader={organizationLoader}
        >
          <Route 
            path="services"
            element={<Services/>}
          />
        </Route>
      </Route>
    )
  )

  return (
    <>
      <div className="App">
        <RouterProvider router={router} />
      </div>
    </>
  );
}

export default App;
