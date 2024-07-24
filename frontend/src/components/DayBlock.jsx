import React from 'react'
import TimeBlock from "./TimeBlock";

export default function DayBlock() {
  const times = [];
  for (let hour = 8; hour <= 20; hour++) {
    times.push(`${hour}:00`)
  }

  return (
    <div className='day-block flex w-56'>
      <div className='times flex flex-col items-end w-16'>
        {times.map((time) => (
          <div key={time} className='time p-2'>
            {time}
          </div>
        ))}
      </div>
      <div className='day-container flex-1 border border-gray-300 max-w-xs'>
        <div className='time-blocks'>
          <TimeBlock time="8am" />
        </div>
      </div>  
    </div>
  )
}
