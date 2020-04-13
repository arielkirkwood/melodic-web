---
layout: docs
title: Download
description: Download Melodic to get the compiled CSS and JavaScript, source code, or include it with your favorite package managers like npm, RubyGems, and more.
group: getting-started
toc: true
---

## Compiled CSS and JavaScript

Download ready-to-use compiled code for **Melodic v{{ site.current_version}}** to easily drop into your project, which includes:

- Compiled and minified CSS bundles (see [CSS files comparison]({{ site.baseurl }}/docs/{{ site.docs_version }}/getting-started/contents/#comparison-of-css-files))
- Compiled and minified JavaScript plugins

This doesn't include documentation, source files, or any optional JavaScript dependencies (jQuery and Popper.js).

<a href="{{ site.download.dist }}" class="btn btn-outline-primary">Download</a>

## Source files

Compile Melodic with your own asset pipeline by downloading our source Sass, JavaScript, and documentation files. This option requires some additional tooling:

- Sass compiler (Libsass or Ruby Sass is supported) for compiling your CSS.
- [Autoprefixer](https://github.com/postcss/autoprefixer) for CSS vendor prefixing

Should you require [build tools]({{ site.baseurl }}/docs/{{ site.docs_version }}/getting-started/build-tools/#tooling-setup), they are included for developing Melodic and its docs, but they're likely unsuitable for your own purposes.

<a href="{{ site.download.source }}" class="btn btn-outline-primary">Download source</a>

## Package managers

Pull in Melodic's **source files** into nearly any project with some of the most popular package managers. No matter the package manager, Melodic will **require a Sass compiler and [Autoprefixer](https://github.com/postcss/autoprefixer)** for a setup that matches our official compiled versions.

### npm

Install Melodic in your Node.js powered apps with [the npm package](https://www.npmjs.com/package/melodic):

{% highlight sh %}
npm install melodic
{% endhighlight %}

`require('melodic')` will load all of Melodic's jQuery plugins onto the jQuery object. The `melodic` module itself does not export anything. You can manually load Melodic's jQuery plugins individually by loading the `/js/*.js` files under the package's top-level directory.

Melodic's `package.json` contains some additional metadata under the following keys:

- `sass` - path to Melodic's main [Sass](http://sass-lang.com/) source file
- `style` - path to Melodic's non-minified CSS that's been precompiled using the default settings (no customization)

### RubyGems

Install Melodic in your Ruby apps using [Bundler](https://bundler.io/) (**recommended**) and [RubyGems](https://rubygems.org/) by adding the following line to your [`Gemfile`](https://bundler.io/gemfile.html):

{% highlight ruby %}
gem 'melodic', '~> {{ site.current_ruby_version }}'
{% endhighlight %}

Alternatively, if you're not using Bundler, you can install the gem by running this command:

{% highlight sh %}
gem install melodic -v {{ site.current_ruby_version }}
{% endhighlight %}

[See the gem's README](https://github.com/DWPHoldings/melodic-web-rubygem/blob/master/README.md) for further details.
