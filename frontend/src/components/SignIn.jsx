import axios from 'axios';
import { Link, useNavigate } from "react-router-dom";
import { Text, TextField, Theme, Box, Flex } from '@radix-ui/themes';
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
            navigate("/user/bookings")
        } catch (error) {
            console.log('Signup error:', error);
        }
    }
    
    return (
        <>
            <Theme accentColor="violet">
                <div className="bg-violet-200 min-h-screen">
                    <Link to="/" className="text-3xl text-indigo-700 font-bold absolute left-0 top-0">Takecare</Link>
                    <Text size="9" color='violet'>Sign in</Text>
                    <Flex justify='center' pt='9'>
                        <Box maxWidth="200px">
                            <form onSubmit={handleSubmit}>
                                <label>
                                    <TextField.Root 
                                        type="email"
                                        name="email"
                                        id="email"
                                        value={email}
                                        onChange={(e) => setEmail(e.target.value)}
                                        placeholder='example@email.com'
                                    />
                                    <br></br>
                                    <TextField.Root
                                        type="password"
                                        name="password"
                                        id="password"
                                        value={password}
                                        onChange={(e) => setPassword(e.target.value)}
                                        placeholder='password'
                                    />
                                </label>
                                <br></br>
                                <button className='rounded bg-violet-700 text-violet-200'>
                                    Sign in
                                </button>
                            </form>
                            <br></br>
                            <Link to="/signup">Sign up</Link>
                        </Box>
                    </Flex>
                </div>
            </Theme>
        </>
    )
}
