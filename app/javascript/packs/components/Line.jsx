import React from 'react'

const Line = ({ name, text, number }) => (
    <tr>
      <td>{name}</td>
      <td>{text}</td>
      <td>{number}</td>
    </tr>
)

export default Line