import React, { useState, useEffect } from 'react'
import Box from '@mui/material/Box';
import axios from 'axios';
import dayjs from 'dayjs';
import Booking from './Booking'
import { useUser } from '../contexts/UserContext'; 

export default function Bookings({date}) {
    const { user, loading } = useUser();
    const [bookings, setBookings] = useState([]);

    const getBookings = (date) => {
      const url = `http://localhost:3000/bookings_by_date/${dayjs(date).format('YYYY-M-D')}`
  
      axios.get(url, {
        headers: {
          Authorization: `Bearer ${user?.token}`
        }
      }).then(response => {
        setBookings(response.data);
      });
    }

    useEffect(() => {
        getBookings(date);
    }, [date]);

    return (
        <>
            <Box
                sx={{
                        display: 'flex',
                        flexWrap: 'wrap',
                            '& > :not(style)': 
                        {
                            m: 1,
                            width: 128,
                            height: 128,
                        },
                }}
            >
                { bookings.length > 0 ? (
                    bookings.map((booking, index) => (
                        <Booking time={dayjs(booking.start_time).format('LT')} staff_member={booking.staff_member} bookingId={booking.id} />
                    ))) : (<p>No bookings</p>)
                }
            </Box>
        </>
    )
}
