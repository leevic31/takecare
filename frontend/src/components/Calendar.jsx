import React, { useState, useEffect } from 'react';
import { format, startOfMonth, endOfMonth, addMonths, subMonths, eachDayOfInterval, isToday, startOfWeek, endOfWeek } from 'date-fns';
import TimeBlock from "./TimeBlock";
import axios from 'axios';
import { ChevronLeftIcon, ChevronRightIcon } from '@radix-ui/react-icons';

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
    // const daysInMonth = eachDayOfInterval({ start: monthStart, end: monthEnd });

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
            <div className="flex justify-center">
                    <div className="w-full max-w-md  mt-4 p-4 bg-white shadow-lg rounded-lg mr-4">
                        <header className="flex items-center justify-between mb-4">
                            <button 
                                onClick={handlePreviousMonth} 
                                className="p-2 text-black hover:bg-gray-200 rounded-full w-8 h-8 flex items-center justify-center"
                            >
                                <ChevronLeftIcon />
                            </button>
                            <h1 className="text-xl font-semibold text-black">{format(currentMonth, 'MMMM yyyy')}</h1>
                            <button 
                                onClick={handleNextMonth} 
                                className="p-2 text-black hover:bg-gray-200 rounded-full w-8 h-8 flex items-center justify-center"
                            >
                                <ChevronRightIcon />
                            </button>
                        </header>
                        <div className="grid grid-cols-7 gap-1 text-center mb-4">
                            {['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'].map(day => (
                                <div key={day} className="font-semibold text-gray-700">{day}</div>
                            ))}
                        </div>
                        <div className="grid grid-cols-7 gap-1 text-center">
                            {daysInCalendar.map(day => (
                                <div
                                    key={day}
                                    className={`p-2 cursor-pointer rounded-full w-8 h-8 flex items-center justify-center ml-3 ${isToday(day) ? 'bg-yellow-200' : ''} ${selectedDate && day.toDateString() === selectedDate.toDateString() ? 'bg-blue-500 text-white' : 'text-gray-500'} hover:bg-gray-200`}
                                    onClick={() => handleDayClick(day)}
                                >
                                    {format(day, 'd')}
                                </div>
                            ))}
                        </div>
                    </div>

                    {selectedDate && (
                        <div className="mt-4 p-4 bg-gray-100 border border-gray-300 rounded-lg">
                            <p className="text-black">{format(selectedDate, 'EEEE, MMMM d, yyyy')}</p>

                            {bookings.length > 0 ? (
                                bookings.map(booking => (
                                    <div className='p-2'>
                                        <TimeBlock time={format(booking[1].start_time, 'p')} />
                                    </div>
                                ))) : (<p className='text-black'>No bookings for this day</p>)
                            }
                        </div>
                    )}
            </div>
        
        </>
    );
};
