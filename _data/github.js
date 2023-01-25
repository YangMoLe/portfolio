const EleventyFetch = require("@11ty/eleventy-fetch");
module.exports = async function () {
  try {
    let json = await EleventyFetch("https://api.github.com/repos/YangMoLe/portfolio", {
      duration: "2m", // save for 1 day
      type: "json",    // we’ll parse JSON for you
      verbose: true
    });

    return {
      stargazers: json.stargazers_count
    };
  } catch (e) {
    console.log("Failed getting GitHub star count, returning 0");
    return {
      stargazers: 0
    };
  }

};