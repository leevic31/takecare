import axios from 'axios';
import { Link, useNavigate, Outlet } from "react-router-dom";
import { Text, TextField, Button, Theme, Box } from '@radix-ui/themes';
import { useState } from "react";

export default function SignIn() {
    const navigate = useNavigate();

    const [email, setEmail] = useState();
    const [password, setPassword] = useState();

    const handleSubmit = async (e) => {
        e.preventDefault();
        const url = "http://localhost:3000/login"
        
        try {
            const response = await axios.post(url, {
                email: email, 
                password: password
            });
            console.log('User signed-in:', response.data);            
            const token = response.data.token
            localStorage.setItem('authToken', token);
            navigate("/")
        } catch (error) {
            console.log('Signup error:', error);
        }
    }
    
    return (
        <>
            <Theme appearance="dark" accentColor="violet">
                <Link to="/" className="text-3xl text-indigo-700 font-bold absolute left-0 top-0">Takecare</Link>

                <Text size="9">Sign in</Text>
                <Box maxWidth="200px">
                    <form onSubmit={handleSubmit}>
                        <label>
                            <Text>Email</Text>
                            <TextField.Root 
                                type="email"
                                name="email"
                                id="email"
                                value={email}
                                onChange={(e) => setEmail(e.target.value)}
                            />
                            <Text>Password</Text>
                            <TextField.Root
                                type="password"
                                name="password"
                                id="password"
                                value={password}
                                onChange={(e) => setPassword(e.target.value)}
                            />
                        </label>
                        <br></br>
                        <Button>Sign in</Button>
                    </form>
                    <br></br>
                    <Link to="/signup">Sign up</Link>
                </Box>
            </Theme>
        </>
    )
}
