import axios from 'axios';
import { useNavigate } from "react-router-dom";
import { useState } from "react";
import TextField from '@mui/material/TextField';
import Stack from '@mui/material/Stack';
import Box from '@mui/material/Box';
import Button from '@mui/material/Button';
import Link from '@mui/material/Link';


import { AppProvider, SignInPage } from '@toolpad/core';
import { useTheme } from '@mui/material/styles';

const providers = [{ id: 'credentials', name: 'Email and Password' }];

const signIn = async (provider, formData) => {
    const promise = new Promise((resolve) => {
      setTimeout(() => {
        alert(
          `Signing in with "${provider.name}" and credentials: ${formData.get('email')}, ${formData.get('password')}`,
        );
        resolve();
      }, 300);
    });
    return promise;
  };



export default function SignIn() {
    const theme = useTheme();
    return (
      <AppProvider theme={theme}>
        <SignInPage signIn={signIn} providers={providers} />
      </AppProvider>
    );


    // const navigate = useNavigate();

    // const [email, setEmail] = useState();
    // const [password, setPassword] = useState();

    // const handleSubmit = async (e) => {
    //     e.preventDefault();
    //     const url = "http://localhost:3000/login"
        
    //     try {
    //         const response = await axios.post(url, {
    //             email: email, 
    //             password: password
    //         });
    //         console.log('User signed-in:', response.data);            
    //         const token = response.data.token
    //         localStorage.setItem('authToken', token);
    //         navigate("/user/bookings")
    //     } catch (error) {
    //         console.log('Signup error:', error);
    //     }
    // }
    
    // return (
    //     <>
    //         <Box sx={{display:'flex', justifyContent: 'center', mt: 10}}>
    //             <form onSubmit={handleSubmit}>
    //                 <Stack spacing={2}>
    //                     <TextField
    //                         type="email"
    //                         name="email"
    //                         id="email"
    //                         value={email}
    //                         onChange={(e) => setEmail(e.target.value)}
    //                         placeholder='example@email.com'
    //                     />
    //                     <TextField
    //                         type="password"
    //                         name="password"
    //                         id="password"
    //                         value={password}
    //                         onChange={(e) => setPassword(e.target.value)}
    //                         placeholder='password'
    //                     />
    //                     <Button variant='contained'>
    //                         Sign in
    //                     </Button>
    //                     <Link>
    //                         Sign Up
    //                     </Link>
    //                 </Stack>
    //             </form>
    //         </Box>

            
    //     </>
    // )
}
