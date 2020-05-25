import axios from 'axios';

const api = axios.create({
//  baseURL: 'http://192.168.0.103:3333',
  baseURL: 'http://18.230.110.22:3333',
})

export default api;