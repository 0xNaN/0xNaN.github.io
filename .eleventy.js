module.exports = (function(eleventyConfig) {

  eleventyConfig.addPassthroughCopy('./src/img/');

  return {
    passthroughFileCopy: true,
    dir: { input: 'src', output: '_site' }
  }
});
