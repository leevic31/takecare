import axios from 'axios';
import { useNavigate } from "react-router-dom";
import { AppProvider, SignInPage } from '@toolpad/core';
import { useTheme } from '@mui/material/styles';

const providers = [{ id: 'credentials', name: 'Email and Password' }];

export default function SignIn() {
    const navigate = useNavigate();

    const signIn = async (provider, formData) => {    
      const email = formData.get('email');
      const password = formData.get('password');
      const url = "http://localhost:3000/login"
    
      try {
        const response = await axios.post(url, {
          email: email,
          password: password,
        });
        console.log('User signed-in:', response.data)
        const { token } = response.data;
        localStorage.setItem('token', token);
        navigate('/');
      } catch(error) {
        if (error.response) {
          // The request was made and the server responded with a status code
          alert(error.response.data.error); // Show the error message from the server
          console.error('Error response:', error.response.data);
        } else if (error.request) {
          // The request was made but no response was received
          alert('No response from server');
          console.error('Error request:', error.request);
        } else {
          // Something happened in setting up the request
          alert('Error during sign-in: ' + error.message);
          console.error('Error message:', error.message);
        }
      }
    };
    
    const theme = useTheme();
    
    return (
      <AppProvider theme={theme}>
        <SignInPage signIn={signIn} providers={providers} />
      </AppProvider>
    );
}
