import React from 'react'
import Booking from "./Booking";
import { useEffect, useState } from "react";
import axios from 'axios';

export default function DayBlock() {
  const authToken = localStorage.getItem('authToken');

  const [bookings, setBookings] = useState([]);

  const getBookings = () => {
    const url = "http://localhost:3000/bookings_by_date/2024-08-01"

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
    <div className='day-block flex w-56'>
      <div className='times flex flex-col items-end w-16'>
        {/* {bookings.map((booking) => (
          <div key={booking[0]} className='time p-2'>
            {booking[0]}
          </div>
        ))} */}
      </div>

      <div className='day-container flex-1 border border-gray-300 max-w-xs'>
        <div className='time-blocks'>
          <Booking time="8am" />
        </div>
      </div>  
    </div>
  )
}
