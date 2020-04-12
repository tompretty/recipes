const purgecss = require("@fullhuman/postcss-purgecss")({
  content: ["./app/**/*.html.erb", "./app/helpers/**/*.rb"],

  defaultExtractor: content => content.match(/[\w-/:]+(?<!:)/g) || []
});

module.exports = {
  plugins: [
    require("postcss-import"),
    require("postcss-flexbugs-fixes"),
    require("tailwindcss"),
    require("autoprefixer"),
    ...(process.env.RAILS_ENV == "production" ? [purgecss] : []),
    require("postcss-preset-env")({
      autoprefixer: {
        flexbox: "no-2009"
      },
      stage: 3
    })
  ]
};
