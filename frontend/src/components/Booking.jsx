import React from 'react'
import PropTypes from 'prop-types'
import { Box, Card, Text, Flex } from '@radix-ui/themes';

export default function Booking({ time, staff_member }) {
  return (
    <>
      <Box>
        <Card asChild>
          <a>
            <Flex justify='between'>
              <Text color='violet'>{staff_member}</Text>
              <Text color='violet'>{time}</Text>
            </Flex>
          </a>
        </Card>
      </Box>
    </>
  )
}

Booking.propTypes = {
  time: PropTypes.string.isRequired,
};
