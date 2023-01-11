// Configure what browser to use for what context

module.exports = {
  defaultBrowser: "Firefox",
  handlers: [
    {
      match: /^https?:\/\/github\.com\/.*$/,
      browser: "Google Chrome",
    },
    {
      match: ({ opener }) => opener.bundleId === "com.tinyspeck.slackmacgap",
      browser: "Google Chrome",
    },
  ],
};
