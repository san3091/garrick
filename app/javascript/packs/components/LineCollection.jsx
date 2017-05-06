import React from 'react'
import PropTypes from 'prop-types'
import Line from './Line'

const LineCollection = ({ lines }) => (
  <table>
    {renderLines(lines)}
  </table>
)

const renderLines = (lines) => {
  return lines.map( (line, index) => (
    <Line key={`${index}_${line.number}`}
          name={line.character.name}
          text={line.text}
          number={line.number} />
  ))
}

LineCollection.propTypes = {
  lines: PropTypes.arrayOf(
    PropTypes.shape({
      character: PropTypes.shape({ 
        name: PropTypes.string.isRequired
      }),
      text: PropTypes.string.isRequired,
      number: PropTypes.oneOfType([
        PropTypes.string,
        PropTypes.number
      ])
    })
  )
}

export default LineCollection