import React, { useState } from 'react'
import PropTypes from 'prop-types'
import axios from 'axios'

import { useUser } from '../contexts/UserContext';
import Button from '@mui/material/Button';


export default function Booking({ time, staff_member, bookingId }) {
  // const [isLoading, setIsLoading] = useState(false); // State to manage loading status
  // const [error, setError] = useState(null); // State to manage errors

  // const token = localStorage.getItem('authToken');
  // const { user, loading } = useUser();

  // const handleConfirm = async () => {
  //   setIsLoading(true); // Set loading state to true
  //   setError(null); // Clear previous errors

  //   try {
  //     if (!user) {
  //       throw new Error('User not logged in');
  //     }

  //     const response = await axios.post('http://localhost:3000/booking_managements', {
  //       booking_management: {
  //         booking_id: bookingId,
  //         client_id: user.id,
  //       },
  //       headers: {
  //         Authorization: `Bearer ${token}`,
  //       },
  //     });

  //     console.log('Booking confirmed:', response.data);

  //   } catch (err) {
  //     console.error('Error confirming booking', err);
  //     setError('Unable to confirm booking'); // Set error state
  //   } finally {
  //     setIsLoading(false); // Set loading state to false
  //   }
  // }

  // if (loading) {
  //   return <p>Loading...</p>;
  // }

  return (
    <>
      <Button variant="outlined">
        {time}
        {staff_member}
      </Button>
    </>
  )
}

Booking.propTypes = {
  time: PropTypes.string.isRequired,
  staff_member: PropTypes.string.isRequired,
  bookingId: PropTypes.number.isRequired,
};
