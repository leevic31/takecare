import { Outlet, Link} from "react-router-dom";
import { Button, Theme } from '@radix-ui/themes';
import { PersonIcon } from '@radix-ui/react-icons';
import { useEffect, useState } from "react";
import axios from 'axios';

export default function Home() {
  const [currentUser, setCurrentUser] = useState(null);

  useEffect(() => {
    const fetchCurrentUser = async () => {
      const token = localStorage.getItem('authToken');
      const url = "http://localhost:3000/users/me"

      console.log("TOKEN")
      console.log(token)
      
      if (token) {
        try {
          const response = await axios.get(url, {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          });
          setCurrentUser(response.data);

          console.log(response)
        
        } catch (error) {
          console.error('Error fetching current user:', error);
          // Handle error (show message, redirect, etc.)
        }
      }
    };

    fetchCurrentUser();
  }, []);

  return (
    <>
        <Theme appearance="dark" accentColor="violet">
          <Link to="/organizations" className="text-3xl text-indigo-700 font-bold absolute left-0 top-0">Takecare</Link>
          
          <Button>
            <PersonIcon />
            <Link to="/signin">
              Sign in
            </Link>
          </Button>
          
          <Outlet />

          <div>
            {currentUser ? (
              <div>
                <h2>Welcome, {currentUser.email}</h2>
                {/* Display other user information */}
              </div>
            ) : (
              <p>Loading...</p>
            )}
          </div>

        </Theme>
    </>
  )
}
