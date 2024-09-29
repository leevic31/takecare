import React from 'react'

import AppBar from '@mui/material/AppBar';
import Box from '@mui/material/Box';
import Toolbar from '@mui/material/Toolbar';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';

import {Outlet, useNavigate} from 'react-router-dom'
import { useEffect, useState } from "react";
import axios from 'axios';

export default function HeaderBar() {
  const [currentUser, setCurrentUser] = useState();
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
  }, [setCurrentUser]);

  const handleLogout = () => {
    localStorage.removeItem('authToken');
    setCurrentUser(null);
    navigate('/signin');
  }

  const handleSignIn = () => {
    navigate('/signin')
  }

  return (
      <>
        <Box sx={{ flexGrow: 1 }}>
          <AppBar position="static">
            <Toolbar sx={{ display: 'flex', justifyContent: 'space-between' }}>
              <Typography variant="h6" component="div">
                Takecare
              </Typography>
              { currentUser ? (
                <Button color="inherit" onClick={handleLogout}>Logout</Button>
                ) : (
                <Button color="inherit" onClick={handleSignIn}>Login</Button>
              )}
            </Toolbar>
          </AppBar>
        </Box>

        <Outlet />
      </>
  )
}
