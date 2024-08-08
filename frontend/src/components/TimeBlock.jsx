import React from 'react'
import PropTypes from 'prop-types'

export default function TimeBlock({ time }) {
  return (
    <div className='border border-gray-700 text-black rounded'>
      {time}
    </div>
  )
}

TimeBlock.propTypes = {
  time: PropTypes.string.isRequired,
};
