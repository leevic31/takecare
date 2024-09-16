import React, { useState } from 'react'
import PropTypes from 'prop-types'
import { Box, Text, Flex } from '@radix-ui/themes';
import * as AlertDialog from '@radix-ui/react-alert-dialog';
import axios from 'axios'

import { useUser } from '../contexts/UserContext';

export default function Booking({ time, staff_member, bookingId }) {
  const [isLoading, setIsLoading] = useState(false); // State to manage loading status
  const [error, setError] = useState(null); // State to manage errors

  const token = localStorage.getItem('authToken');
  const { user, loading } = useUser();

  const handleConfirm = async () => {
    setIsLoading(true); // Set loading state to true
    setError(null); // Clear previous errors

    try {
      if (!user) {
        throw new Error('User not logged in');
      }

      const response = await axios.post('http://localhost:3000/booking_managements', {
        booking_management: {
          booking_id: bookingId,
          client_id: user.id,
        },
        headers: {
          Authorization: `Bearer ${token}`,
        },
      });

      console.log('Booking confirmed:', response.data);

    } catch (err) {
      console.error('Error confirming booking', err);
      setError('Unable to confirm booking'); // Set error state
    } finally {
      setIsLoading(false); // Set loading state to false
    }
  }

  if (loading) {
    return <p>Loading...</p>;
  }

  return (
    <>
      <Box>        
        <AlertDialog.Root>
          <AlertDialog.Trigger>
            <button className='rounded bg-violet-100 hover:bg-violet-200 px-5 py-1 w-full flex justify-between'>
              <div className='text-violet-700 px-2'>{staff_member}</div>
              <div className='text-violet-700'>{time}</div>
            </button>
          </AlertDialog.Trigger>

          <AlertDialog.Portal>
            <AlertDialog.Overlay className="bg-blackA6 data-[state=open]:animate-overlayShow fixed inset-0" />
            
            <AlertDialog.Content className="data-[state=open]:animate-contentShow fixed top-[50%] left-[50%] max-h-[85vh] w-[90vw] max-w-[500px] translate-x-[-50%] translate-y-[-50%] rounded-[6px] bg-white p-[25px] shadow-[hsl(206_22%_7%_/_35%)_0px_10px_38px_-10px,_hsl(206_22%_7%_/_20%)_0px_10px_20px_-15px] focus:outline-none">
              
              <AlertDialog.Title className="text-violet-700 m-0 text-[17px] font-medium">
                Confirm Booking
              </AlertDialog.Title>

              <AlertDialog.Description className="text-mauve11 mt-4 mb-5 text-[15px] leading-normal">
                <Flex direction="column" gap="2">
                  <Text color='violet'>{staff_member}</Text>
                  <Text color='violet'>{time}</Text>
                </Flex>
              </AlertDialog.Description>
              
              <div className="flex justify-end gap-[25px]">
                <AlertDialog.Cancel asChild>
                <button className="text-violet-700 bg-violet-100 hover:bg-violet-200 focus:shadow-mauve7 inline-flex h-[35px] items-center justify-center rounded-[4px] px-[15px] font-medium leading-none outline-none focus:shadow-[0_0_0_2px]">
                    Cancel
                  </button>
                </AlertDialog.Cancel>
                <AlertDialog.Action asChild>
                  <button onClick={handleConfirm} className="text-white bg-violet-700 hover:bg-violet-200 focus:shadow-mauve7 inline-flex h-[35px] items-center justify-center rounded-[4px] px-[15px] font-medium leading-none outline-none focus:shadow-[0_0_0_2px]">
                    Confirm
                  </button>
                </AlertDialog.Action>
              </div>

            </AlertDialog.Content>
          </AlertDialog.Portal>

        </AlertDialog.Root>
      </Box>
    </>
  )
}

Booking.propTypes = {
  time: PropTypes.string.isRequired,
  staff_member: PropTypes.string.isRequired,
  bookingId: PropTypes.number.isRequired,
};
