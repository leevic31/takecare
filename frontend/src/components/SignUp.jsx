import axios from 'axios';
import { Text, TextField, Button, Theme, Box } from '@radix-ui/themes';
import { useState } from "react";
import { useNavigate } from 'react-router-dom';

export default function SignUp() {
    const navigate = useNavigate();

    const [email, setEmail] = useState();
    const [password, setPassword] = useState();
    const [password_confirmation, setPasswordConfirmation] = useState();

    const handleSubmit = async (e) => {
        e.preventDefault();
        const url = "http://localhost:3000/users"

        try {
            const response = await axios.post(url, {
                user: {
                    email: email,
                    password: password,
                    password_confirmation: password_confirmation
                }
            });
            console.log('User registered:', response.data);

            const token = response.data.token
            // Store the token in localStorage (or sessionStorage)
            localStorage.setItem('authToken', token);

            navigate("/");
        } catch (error) {
            console.error('Signup error:', error);
        }
    }

    return (
        <>
            <Theme appearance="dark" accentColor="violet">
                <Text size="9">Sign Up</Text>
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
                            <Text>
                                12 characters minimum.
                                Password confirmation
                            </Text>
                            <TextField.Root
                                type="password_confirmation"
                                name="password_confirmation"
                                id="password_confirmation"
                                value={password_confirmation}
                                onChange={(e) => setPasswordConfirmation(e.target.value)}
                            />
                        </label>
                        <br></br>
                        <Button>Sign up</Button>
                        <div>leevic31@gmail.com</div>
                        <div>starcraftstarcraft</div>
                    </form>
                </Box>

            </Theme>
        </>
    )
}
