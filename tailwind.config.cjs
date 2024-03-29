/** @type {import('tailwindcss').Config}*/
const config = {
  content: ["./src/**/*.{html,js,svelte,ts}"],

  theme: {
    extend: {},
  },

  plugins: [],
};

module.exports = config;

const konstaConfig = require('konsta/config');
module.exports = konstaConfig(config);