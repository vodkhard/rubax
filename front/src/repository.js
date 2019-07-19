import axios from "axios";

const customAxios = axios.create({
  baseURL: "http://localhost:3000",
});

if (localStorage.getItem('token')) {
  customAxios.defaults.headers.common['Authorization'] = `Bearer ${localStorage.getItem('token')}`;
}

customAxios.interceptors.response.use((res) => res, ({ response }) => {
  if (response.status === 401 && window.location !== '/login') {
    window.location = '/login';
  }
});

export default customAxios;