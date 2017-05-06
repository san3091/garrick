import axios from 'axios'

export const nextLine = (id) => {

  let params = {
    method: 'get',
    url: `/lines/${id}?query=next`,
    withCredentials: true,
    headers: {
      'Accept': 'application/json',
      'X-CSRF-Token': getCSRFToken()
    }
  }

  return axios(params)
}

function getCSRFToken() {
  const meta = document.getElementsByName('csrf-token')
  if (meta.length === 1) {
    return meta[0].getAttribute('content')
  }
}

export const getScene = (id) => {

  let params = {
    method: 'get',
    url: `/scenes/${id}?include_first_line=true`,
    withCredentials: true,
    headers: {
      'Accept': 'application/json',
      'X-CSRF-Token': getCSRFToken()
    }
  }

  return axios(params)
}