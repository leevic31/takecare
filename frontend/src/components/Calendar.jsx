import React, { useState } from 'react';
import { LocalizationProvider } from '@mui/x-date-pickers/LocalizationProvider';
import { AdapterDayjs } from '@mui/x-date-pickers/AdapterDayjs';
import { DateCalendar } from '@mui/x-date-pickers/DateCalendar';
import Bookings from './Bookings';

export default function Calendar() {
    const [value, setValue] = useState();

    return (
        <>
            <LocalizationProvider dateAdapter={AdapterDayjs}>
                <DateCalendar value={value} onChange={(newValue) => setValue(newValue)} />
            </LocalizationProvider>
            
            <Bookings date={value} />
        </>
    );
};
