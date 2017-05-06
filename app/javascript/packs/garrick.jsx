// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.

import React, { Component } from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

import Scene from './components/Scene'
import { getScene } from './modules/scenes'

class App extends Component {
  constructor() {
    super()
    this.state = {
      scene: {}
    }
  }

  componentWillMount() {
    getScene(3)
    .then( res => {
      console.log(res.data)
      this.setState({
        scene: res.data
      })
    })
  }

  render() {
    const { scene } = this.state
    if (scene.id) {
      return <Scene title={scene.title} line={scene.first_line} />
    } else {
      return <h1>Loading...</h1> 
    }
  }
}

document.addEventListener('DOMContentLoaded', () => {
  ReactDOM.render(
    <App />,
    document.getElementById("scenes-container"),
  )
})