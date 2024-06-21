import axios from 'axios';
import { Link, useNavigate } from "react-router-dom";
import { Text, TextField, Button, Theme, Box } from '@radix-ui/themes';
import { useState } from "react";

export default function SignIn() {
    const navigate = useNavigate();

    const [email, setEmail] = useState();
    const [password, setPassword] = useState();

    const handleSubmit = async (e) => {
        e.preventDefault();
        const url = "http://localhost:3000/sign_in"
        axios.post(url, {email: email, password: password}).then(response => {
            console.log(response)
        })
        navigate("/")
    }
    
    return (
        <>
            <Theme appearance="dark" accentColor="violet">
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
