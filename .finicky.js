// Configure what browser to use for what context

module.exports = {
  defaultBrowser: 'Firefox',
  handlers: [
    {
      match: /^https?:\/\/github\.com\/.*$/,
      browser: 'Google Chrome',
    },
    {
      match: /^https?:\/\/app\.circleci\.com\/.*$/,
      browser: 'Google Chrome',
    },
    {
      match: /^https?:\/\/around\.co\/.*$/,
      browser: 'Google Chrome',
    },
    {
      match: /^https?:\/\/evenlyio.atlassian.net\/.*$/,
      browser: 'Google Chrome',
    },
    {
      match: /^https?:\/\/umusic.zoom.com\/.*$/,
      browser: 'Google Chrome',
    },
    {
      match: ({ opener }) => opener.bundleId === 'com.tinyspeck.slackmacgap',
      browser: 'Google Chrome',
    },
  ],
};
