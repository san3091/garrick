import React, { Component } from 'react'
// import LineCollection from './LineCollection'
import Line from './Line'
import { nextLine } from '../modules/scenes'

class Scene extends Component {
  constructor(props) {
    super(props)
    this.state = {
      line: this.props.line
    }
    this.nextLine           = this.nextLine.bind(this)
    this.setupSubscription  = this.setupSubscription.bind(this)
  }

  componentWillMount() {
    this.setupSubscription()
  }

  nextLine() {
    console.log("next")
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
    console.log("this ran")
    let myself = this

    App.lines = App.cable.subscriptions.create("LinesChannel", {
      connected: function() {
        // Called when the subscription is ready for use on the server
        console.log("connected to lines channel")
      },

      disconnected: function() {
        // Called when the subscription has been terminated by the server
        console.log("disconnected to lines channel")
      },

      received: function(data) {
        // Called when there's incoming data on the websocket for this channel
        console.log(JSON.parse(data.line))
        myself.updateLine(JSON.parse(data.line));
      }
    });
  }

  render() {
    const { line } = this.state
    console.log(line)
    return (
      <div className="container">
        <h1>{this.props.title}</h1>
        <div className="line-collection">
          <table>
            <tbody>
              <Line text={line.text} name={line.character.name} number={line.number} />
            </tbody>
          </table>
        </div>
        <button onClick={this.nextLine}>Next Line</button>
      </div>
    )
  }
}

export default Scene