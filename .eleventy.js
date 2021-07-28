module.exports = (function(eleventyConfig) {

  eleventyConfig.addPassthroughCopy('./src/img/');
  eleventyConfig.addPassthroughCopy('CNAME');

  return {
    passthroughFileCopy: true,
    dir: { input: 'src', output: '_site' }
  }
});
