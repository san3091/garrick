import React, { Component } from 'react'
// import LineCollection from './LineCollection'
import Line from './Line'
import { nextLine } from '../modules/scenes'

class Scene extends Component {
  constructor(props) {
    super()
    this.state = {
      line: {}
    }
    this.nextLine = this.nextLine.bind(this)
  }

  nextLine() {
    const { line } = this.state
    nextLine(line.id)
    .then( res => console.log(res))
    .catch( err => console.error(err))
  }

  updateLine(line) {
    console.log(line)
    this.setState({ line })
  }

  setupSubscription() {
    let myself = this
    App.lines = App.cable.subscriptions.create("LinesChannel", {

        connected: function () { console.log("connected to lines channel")},

        received: function (data) {
          console.log(JSON.parse(data.line))
          myself.updateLine(JSON.parse(data.line));
        }
      }
    )
  }

  render() {
    const { line } = this.state
    console.log(line)
    return (
      <div className="container">
        <h1>{this.props.title}</h1>
        <Line text={line.text} name={line.character.name} number={line.number} />
        <button onClick={this.nextLine}>Add Next Line</button>
      </div>
    )
  }
}

export default Scene