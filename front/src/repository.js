import axios from "axios";

const customAxios = axios.create({
  baseURL: "http://localhost:3000",
  headers: {'Authorization': `Bearer ${localStorage.getItem('token')}`},
});

customAxios.interceptors.response.use(function (res) {
  return res;
}, function ({ request, response }) {
  if (response.status === 401) {
    window.location = '/login';
  }
});

export default customAxios;