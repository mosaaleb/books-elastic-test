module.exports = {
  theme: {
    extend: {
      inset: {
        '1unit': '1%',
        '2unit': '2%',
        '7unit': '7%',
        '10unit': '10%',
        '20unit': '20%',
        '50unit': '50%',
      }
    }
  },
  variants: {
    visibility: ["responsive", "group-hover"],
    borderColors: ["responsive", "hover", "focus", "group-hover"],
  },
  plugins: []
}
