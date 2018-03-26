<p align="center">
  <a href="https://melodic.helloinspire.com/">
    <img src="https://melodic.helloinspire.com/assets/brand/melodic-solid.svg" alt="" width="72" height="72">
  </a>

  <h3 align="center">Melodic</h3>

  <p align="center">
    Inspire's front-end design system for the Web.
    <br>
    <a href="https://melodic.helloinspire.com/docs/1.0/"><strong>Explore Melodic docs »</strong></a>
  </p>
</p>

<br>

## Table of contents

- [Quick start](#quick-start)
- [Status](#status)
- [What's included](#whats-included)
- [Bugs and feature requests](#bugs-and-feature-requests)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [Versioning](#versioning)
- [Creators](#creators)
- [Copyright and license](#copyright-and-license)

## Quick start

Several quick start options are available:

- [Download the latest release.](https://github.com/DWPHoldings/melodic-web/archive/v1.0.0-alpha.zip)
- Clone the repo: `git clone https://github.com/DWPHoldings/melodic-web.git`
- Install with [npm](https://www.npmjs.com/): `npm install melodic@1.0.0-alpha`
- Install with [yarn](https://yarnpkg.com/): `yarn add melodic@1.0.0-alpha`
- Install with [Rubygems](https://rubygems.org/): `gem install melodic -v 1.0.0.alpha`

Read the [Getting started page](https://melodic.helloinspire.com/docs/1.0/getting-started/introduction/) for information on the framework contents, templates and examples, and more.

## Status

[![Build Status](https://img.shields.io/travis/twbs/bootstrap/v4-dev.svg)](https://travis-ci.org/twbs/bootstrap)
[![npm version](https://img.shields.io/npm/v/bootstrap.svg)](https://www.npmjs.com/package/bootstrap)
[![Gem version](https://img.shields.io/gem/v/bootstrap.svg)](https://rubygems.org/gems/bootstrap)
[![peerDependencies Status](https://img.shields.io/david/peer/twbs/bootstrap.svg)](https://david-dm.org/twbs/bootstrap?type=peer)
[![devDependency Status](https://img.shields.io/david/dev/twbs/bootstrap.svg)](https://david-dm.org/twbs/bootstrap?type=dev)
[![CSS gzip size](http://img.badgesize.io/twbs/bootstrap/v4-dev/dist/css/bootstrap.min.css?compression=gzip&label=CSS+gzip+size)](https://github.com/twbs/bootstrap/tree/v4-dev/dist/css/bootstrap.min.css)
[![JS gzip size](http://img.badgesize.io/twbs/bootstrap/v4-dev/dist/js/bootstrap.min.js?compression=gzip&label=JS+gzip+size)](https://github.com/twbs/bootstrap/tree/v4-dev/dist/js/bootstrap.min.js)

[![Sauce Labs Test Status](https://saucelabs.com/browser-matrix/bootstrap.svg)](https://saucelabs.com/u/bootstrap)

## What's included

Within the download you'll find the following directories and files, logically grouping common assets and providing both compiled and minified variations. You'll see something like this:

```
melodic-web/
├── css/
│   ├── melodic.css
│   ├── melodic.css.map
│   ├── melodic.min.css
│   ├── melodic.min.css.map
│   ├── melodic-grid.css
│   ├── melodic-grid.css.map
│   ├── melodic-grid.min.css
│   ├── melodic-grid.min.css.map
│   ├── melodic-reboot.css
│   ├── melodic-reboot.css.map
│   ├── melodic-reboot.min.css
│   └── melodic-reboot.min.css.map
└── js/
    ├── melodic.bundle.js
    ├── melodic.bundle.min.js
    ├── melodic.js
    └── melodic.min.js
```

We provide compiled CSS and JS (`melodic.*`), as well as compiled and minified CSS and JS (`melodic.min.*`). CSS [source maps](https://developers.google.com/web/tools/chrome-devtools/debug/readability/source-maps) (`melodic.*.map`) are available for use with certain browsers' developer tools. Bundled JS files (`melodic.bundle.js` and minified `melodic.bundle.min.js`) include [Popper](https://popper.js.org/), but not [jQuery](https://jquery.com/).


## Bugs and feature requests

Have a bug or a feature request? Please first read the [issue guidelines](https://github.com/DWPHoldings/melodic-web/blob/master/CONTRIBUTING.md#using-the-issue-tracker) and search for existing and closed issues. If your problem or idea is not addressed yet, [please open a new issue](https://github.com/DWPHoldings/melodic-web/issues/new).


## Documentation

Melodic's documentation, included in this repo in the root directory, is built with [Jekyll](https://jekyllrb.com/) and publicly hosted on GitHub Pages at <https://melodic.helloinspire.com/>. The docs may also be run locally.

Documentation search is powered by [Algolia's DocSearch](https://community.algolia.com/docsearch/). Working on our search? Be sure to set `debug: true` in the `_scripts.html` include.

### Running documentation locally

1. Run through the [tooling setup](https://melodic.helloinspire.com/docs/1.0/getting-started/build-tools/#tooling-setup) to install Jekyll (the site builder) and other Ruby dependencies with `bundle install`.
2. Run `npm install` to install Node.js dependencies.
3. Run `npm run test` (or a specific NPM script) to rebuild distributed CSS and JavaScript files, as well as our docs assets.
4. From the root `/melodic-web` directory, run `npm run docs-serve` in the command line.
5. Open `http://localhost:9001` in your browser, and voilà.

Learn more about using Jekyll by reading its [documentation](https://jekyllrb.com/docs/home/).

### Documentation for previous releases

[Previous releases](https://github.com/DWPHoldings/melodic-web/releases) and their documentation are available for download.

## Contributing

Please read through our [contributing guidelines](https://github.com/DWPHoldings/melodic-web/blob/master/CONTRIBUTING.md). Included are directions for opening issues, coding standards, and notes on development.

Moreover, if your pull request contains JavaScript patches or features, you must include [relevant unit tests](https://github.com/DWPHoldings/melodic-web/tree/master/js/tests). All HTML and CSS should conform to the [Code Guide](https://github.com/mdo/code-guide), maintained by [Mark Otto](https://github.com/mdo).

Editor preferences are available in the [editor config](https://github.com/DWPHoldings/melodic-web/blob/master/.editorconfig) for easy use in common text editors. Read more and download plugins at <http://editorconfig.org/>.

## Versioning

For transparency into our release cycle and in striving to maintain backward compatibility, Melodic is maintained under [the Semantic Versioning guidelines](http://semver.org/).

See [the Releases section of our GitHub project](https://github.com/DWPHoldings/melodic-web/releases) for changelogs for each release version of Melodic.


## Creators

The Avengers

**Ariel Kirkwood**

- <https://twitter.com/ariel_kirkwood>
- <https://github.com/arielkirkwood>

and

**Greg Beck**

- <https://twitter.com/gbeck419>
- <https://github.com/gbeck419>

and other [Inspire Avengers and contributors](https://github.com/DWPHoldings/melodic-web/graphs/contributors).


## Copyright and license

Code and documentation copyright 2011-2018 the [Bootstrap Authors](https://github.com/twbs/bootstrap/graphs/contributors) and [Twitter, Inc.](https://twitter.com) Portions copyright 2018 [Inspire Energy Holdings, LLC.](https://helloinspire.com) Code released under the [MIT License](https://github.com/DWPHoldings/melodic-web/blob/master/LICENSE). Docs released under [Creative Commons](https://github.com/DWPHoldings/melodic-web/blob/master/docs/LICENSE).
