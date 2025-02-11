// Example .eslintrc.js
module.exports = {
  extends: ["eslint:recommended"],
  env: {
    browser: true,
    node: true,
    es2021: true,
  },
  rules: {
    "no-unused-vars": "warn",
    semi: ["error", "always"],
  },
};
