
import './App.css';
import Home from "./components/Home"
import Organization, { organizationLoader } from './components/Organization';
import Organizations from './components/Organizations';
import SignUp from "./components/SignUp";
import SignIn from "./components/SignIn";
import User from "./components/User"
import Calendar from "./components/Calendar"

import HeaderBar from "./components/HeaderBar";
import { createBrowserRouter, RouterProvider } from "react-router-dom";
import { UserProvider } from './contexts/UserContext';

function App() {

  const router = createBrowserRouter([
    {
      path: "/",
      element: <HeaderBar/>,
      children: [
        {
          path: "signin",
          element: <SignIn/>,
        },
        {
          path: 'calendar',
          element: <Calendar/>,
        },
      ],
    },
  ]);

  return (
    <>
      <UserProvider>
        <div className="App">
            <RouterProvider router={router} />
        </div>
      </UserProvider>
    </>
  );
}

export default App;
