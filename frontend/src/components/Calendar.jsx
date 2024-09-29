import React, { useState, useEffect } from 'react';
import { format, startOfMonth, endOfMonth, addMonths, subMonths, eachDayOfInterval, isToday, startOfWeek, endOfWeek } from 'date-fns';
import Booking from "./Booking";
import axios from 'axios';
import Button from '@mui/material/Button';

import { UserProvider } from '../contexts/UserContext';

import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import { DateCalendar } from '@mui/x-date-pickers/DateCalendar';

export default function Calendar() {
    const authToken = localStorage.getItem('authToken');

    const [currentMonth, setCurrentMonth] = useState(new Date());
    const [selectedDate, setSelectedDate] = useState(null);

    const handlePreviousMonth = () => {
        setCurrentMonth(subMonths(currentMonth, 1));
    };

    const handleNextMonth = () => {
        setCurrentMonth(addMonths(currentMonth, 1));
    };

    const handleDayClick = (date) => {
        setSelectedDate(date);
        getBookings(date);
    };

    const monthStart = startOfMonth(currentMonth);
    const monthEnd = endOfMonth(currentMonth);

    const startOfCalendar = startOfWeek(monthStart);
    const endOfCalendar = endOfWeek(monthEnd);
    const daysInCalendar = eachDayOfInterval({ start: startOfCalendar, end: endOfCalendar });

    const [bookings, setBookings] = useState([]);

    const getBookings = (date) => {
      const url = `http://localhost:3000/bookings_by_date/${format(date,'yyyy-L-d')}`
  
      axios.get(url, {
        headers: {
          Authorization: `Bearer ${authToken}`
        }
      }).then(response => {
        setBookings(Object.entries(response.data));
      });
    }

    useEffect(() => {
        if (selectedDate) {
            getBookings(selectedDate);
        }
    }, [selectedDate]);
    
    return (
        <>

            <LocalizationProvider dateAdapter={AdapterDayjs}>
                <DateCalendar />
            </LocalizationProvider>
            
            {/* <div className="flex justify-center space-x-4">
                <div className="w-full max-w-md h-80 mt-4 p-4 bg-violet-50 shadow-lg rounded-lg mr-4">
                    <header className="flex items-center justify-between mb-4">
                        <button 
                            onClick={handlePreviousMonth} 
                            className="p-2 text-violet-700 hover:bg-gray-200 rounded-full w-8 h-8 flex items-center justify-center"
                        >
                        </button>
                        <h1 className="text-xl font-semibold text-violet-700">{format(currentMonth, 'MMMM yyyy')}</h1>
                        <button 
                            onClick={handleNextMonth} 
                            className="p-2 text-violet-700 hover:bg-gray-200 rounded-full w-8 h-8 flex items-center justify-center"
                        >
                        </button>
                    </header>
                    <div className="grid grid-cols-7 gap-1 text-center mb-4">
                        {['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'].map(day => (
                            <div key={day} className="font-semibold text-violet-700">{day}</div>
                        ))}
                    </div>
                    <div className="grid grid-cols-7 gap-1 text-center">
                        {daysInCalendar.map(day => (
                            <div
                                key={day}
                                className={`p-2 cursor-pointer rounded-full w-8 h-8 flex items-center justify-center ml-3 ${isToday(day) ? 'bg-violet-200' : ''} ${selectedDate && day.toDateString() === selectedDate.toDateString() ? 'bg-amber-300 text-violet-500' : 'text-violet-500'} hover:bg-violet-200`}
                                onClick={() => handleDayClick(day)}
                            >
                                {format(day, 'd')}
                            </div>
                        ))}
                    </div>
                </div>
                    {selectedDate && (
                        <div className="mt-4 p-4 bg-violet-50 border border-gray-300 rounded-lg">
                            <p className="text-violet-700">{format(selectedDate, 'EEEE, MMMM d, yyyy')}</p>
                            {bookings.length > 0 ? (
                                bookings.map(booking => (
                                    <div className='p-2'>
                                        <UserProvider>
                                            <Booking time={format(booking[1].start_time, 'p')} staff_member={booking[1].staff_member.first_name} bookingId={booking[1].id} />
                                        </UserProvider>
                                    </div>
                                ))) : (<p className='text-violet-700'>No bookings for this day</p>)
                            }
                        </div>
                    )}
            </div> */}
        </>
    );
};
