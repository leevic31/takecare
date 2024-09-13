import React, { createContext, useContext, useState, useEffect } from 'react'
import axios from 'axios';

const UserContext = createContext(null);

export const UserProvider = ({ children }) => {
    const [user, setUser] = useState(null);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        const fetchUser = async () => {
            const token = localStorage.getItem('authToken');
            const url = 'http://localhost:3000/users/me'

            if (token) {
                try {
                    const response = await axios.get(url, {
                        headers: {
                            Authorization: `Bearer ${token}`,
                        },
                    });
                    setUser(response.data)
                } catch (err) {
                    console.error('Error fetching user data', err);
                } finally {
                    setLoading(false);
                }
            }
        };

        fetchUser();
    }, []);



    return (
        <UserContext.Provider value={{ user, loading}}>
            {children}
        </UserContext.Provider>
    );
};

export const useUser = () => useContext(UserContext);
