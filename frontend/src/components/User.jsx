import React, { useState, useEffect } from 'react'
import axios from 'axios'

export default function User() {
  const authToken = localStorage.getItem('authToken');
  const [bookings, setBookings] = useState([]);

  const getBookings = () => {

    const url = `http://localhost:3000/user/bookings`;

    axios.get(url, {
      headers: {
        Authorization: `Bearer ${authToken}`
      }
    }).then(response => {
      setBookings(Object.entries(response.data));
    });
  }

  useEffect(() => {
    getBookings();
  }, []);

  console.log(bookings)

  return (
    <>
      <div className="bg-violet-200 min-h-screen">
        <h1 className='text-violet-700 text-3xl pb-5'>Your Bookings</h1>

          {
            bookings.map(booking => (

              <div className='text-violet-700 border border-violet-700 rounded w-1/2 text-left bg-violet-100'>
                <p>
                  Booking Type: {booking[1].service.service_type}
                </p>
                <p>
                  Duration: {booking[1].service.durations[0]}
                </p>


                {/* <OptionsButton /> */}
              </div>

            ))
          }

      </div>
    </>
  )
}
