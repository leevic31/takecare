import React, { useState } from 'react'
import axios from 'axios'
import { useUser } from '../contexts/UserContext';
import Button from '@mui/material/Button';
import Modal from '@mui/material/Modal';
import Box from '@mui/material/Box';
import Stack from '@mui/material/Stack';

export default function Booking({ time, staff_member, bookingId }) {
  const { user, loading } = useUser();
  const [open, setOpen] = useState(false);

  const handleOpen = () => {
    setOpen(true);
  }

  const handleClose = () => {
    setOpen(false);
  }

  const handleConfirm = () => {
    const url = 'http://localhost:3000/booking_managements'

    axios.post(url, {
      booking_management: {
          booking_id: bookingId,
          client_id: user.id,
      },
      headers: {
        Authorization: `Bearer ${user?.token}`
      }
    }).then(response => {
      console.log('Booking confirmed:', response.data);
    });

    setOpen(false);
  }

  return (
    <>
      <Button variant="outlined" onClick={handleOpen}>
          <Stack spacing={1}>
            <div>{time}</div>
            <div>{staff_member}</div>
          </Stack>
      </Button>
      <Modal
        open={open}
        onClose={handleClose}
      >
        <Box sx={{ 
          position: 'absolute', 
          top: '20%', 
          left: '35%', 
          bgcolor: 'background.paper', 
          width: 400,  
          p: 10
        }}>
          <Stack spacing={1}>
            <div>Would you like to confirm the following booking?</div>
            <div>{time}</div>
            <div>{staff_member}</div>
          </Stack>
          <Button variant='contained' sx={{m:2}} onClick={handleConfirm}>
            confirm
          </Button>
          <Button variant='contained' onClick={handleClose}>
            cancel
          </Button>
        </Box>
      </Modal>
    </>
  )
}
