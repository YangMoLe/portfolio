const EleventyFetch = require("@11ty/eleventy-fetch");
const fetch = require("node-fetch");

module.exports = async function() {
  console.log( "Fetching new github stargazers count…" );


  /* This returns a promise 
  return EleventyFetch(url, {
    duration: "1d", // save for 1 day
    type: "json"    // we’ll parse JSON for you
  });
  */

  // GitHub API: https://developer.github.com/v3/repos/#get
  return fetch("https://api.github.com/repos/YangMoLe/portfolio")
    .then(res => res.json()) // node-fetch option to transform to json
    .then(json => {
      // prune the data to return only what we want
      return {
        stargazers: json.stargazers_count
      };
    });
};