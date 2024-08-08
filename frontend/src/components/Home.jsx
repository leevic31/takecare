import { Outlet, Link, useNavigate } from "react-router-dom";
import { Button, Theme, Flex, Box } from '@radix-ui/themes';
import { PersonIcon } from '@radix-ui/react-icons';
import { useEffect, useState } from "react";
import axios from 'axios';
import Calendar from "./Calendar";

export default function Home() {
  const [currentUser, setCurrentUser] = useState(null);
  const navigate = useNavigate();

  useEffect(() => {
    const fetchCurrentUser = async () => {
      const token = localStorage.getItem('authToken');
      const url = "http://localhost:3000/users/me"
      
      if (token) {
        try {
          const response = await axios.get(url, {
            headers: {
              Authorization: `Bearer ${token}`,
            },
          });
          setCurrentUser(response.data);        
        } catch (error) {
          console.error('Error fetching current user:', error);
        }
      }
    };

    fetchCurrentUser();
  }, []);

  const handleLogout = () => {
    localStorage.removeItem('authToken');
    setCurrentUser(null);
    navigate('/signin');
  }

  return (
    <>
        <Theme appearance="dark" accentColor="violet">

          <Flex direction="row" justify="between" align="center">
            <Box>
              <Link to="/" className="text-3xl text-indigo-700 font-bold">Takecare</Link>
            </Box>
            <Box>
              { currentUser ? (
                <div>
                <Button onClick={handleLogout}>
                  <PersonIcon />
                  Logout
                </Button>
                </div>
              ) : (
                <Button>
                <PersonIcon />
                <Link to="/signin">
                  Sign in
                </Link>
              </Button>
              )}
            </Box>
          </Flex>

          <Outlet />

          <div>
            {currentUser ? (
              <div>
                <h2>Welcome, {currentUser.email}</h2>
                <Link to="/organizations" className="text-3xl text-indigo-700 font-bold">Organizations</Link>
              </div>
            ) : (
              <p>Loading...</p>
            )}
          </div>

          < Calendar />

        </Theme>
    </>
  )
}
