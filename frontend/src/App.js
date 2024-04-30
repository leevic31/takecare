import {
  createBrowserRouter,
  Route,
  createRoutesFromElements,
  RouterProvider
} from "react-router-dom";
import './App.css';
import Home from "./components/Home"
import CreateOrganization, { createOrganizationAction } from './components/CreateOrganization';
import Organization, { organizationLoader } from './components/Organization';
import Organizations, { organizationsLoader } from './components/Organizations';
import Services, { servicesLoader } from './components/Services';
import CreateService, { createServiceAction } from "./components/CreateService";

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
          // loader={organizationsLoader}
        >
          <Route 
            path="/organizations/create"
            element={<CreateOrganization/>}
            action={createOrganizationAction}
          />
        </Route>
        <Route 
          path="organizations/:id"
          element={<Organization />}
          loader={organizationLoader}
        >
          <Route 
            path="services"
            element={<Services/>}
            loader={servicesLoader}
          />
          <Route 
            path="services/create"
            element={<CreateService />}
            action={createServiceAction}
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
