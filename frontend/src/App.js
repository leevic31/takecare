import {
  createBrowserRouter,
  Route,
  createRoutesFromElements,
  RouterProvider
} from "react-router-dom";
import './App.css';
import '@radix-ui/themes/styles.css';
import Home from "./components/Home"
import Organization, { organizationLoader } from './components/Organization';
import Organizations from './components/Organizations';
import SignUp from "./components/SignUp";
import SignIn from "./components/SignIn";
import User from "./components/User"

function App() {
  const router = createBrowserRouter(
    createRoutesFromElements(
      <Route>
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
          />
        </Route>
        <Route
          path="signup"
          element={<SignUp />}
        />
        <Route path="signin" element={<SignIn />} />
        <Route path="user/bookings" element={<User />} />
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
