import React from 'react'
import PropTypes from 'prop-types'

export default function TimeBlock({ time }) {
  return (
    <div className='border border-blue-700 bg-blue-500 rounded-lg m-2 w-1/4'>
      {time}
    </div>
  )
}

TimeBlock.propTypes = {
  time: PropTypes.string.isRequired,
};
