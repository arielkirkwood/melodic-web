---
layout: docs
title: Contents
description: Discover what's included in Melodic, including our precompiled and source code flavors. Remember, Melodic's JavaScript plugins require jQuery.
group: getting-started
toc: true
---

## Precompiled Melodic

Once downloaded, unzip the compressed folder and you'll see something like this:

<!-- NOTE: This info is intentionally duplicated in the README. Copy any changes made here over to the README too. -->

{% highlight plaintext %}
melodic/
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
{% endhighlight %}

This is the most basic form of Melodic: precompiled files for quick drop-in usage in nearly any web project. We provide compiled CSS and JavaScript (`melodic.*`), as well as compiled and minified CSS and JS (`melodic.min.*`). CSS [source maps](https://developers.google.com/web/tools/chrome-devtools/javascript/source-maps) (`melodic.*.map`) are available for use with certain browsers' developer tools. Bundled JS files (`melodic.bundle.js` and minified `melodic.bundle.min.js`) include [Popper](https://popper.js.org/), but not [jQuery](https://jquery.com/).

## CSS files

Melodic includes a handful of options for including some or all of our compiled CSS.

<table class="table table-bordered">
  <thead>
    <tr>
      <th scope="col">CSS files</th>
      <th scope="col">Layout</th>
      <th scope="col">Content</th>
      <th scope="col">Components</th>
      <th scope="col">Utilities</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">
        <div><code class="font-weight-normal text-nowrap">melodic.css</code></div>
        <div><code class="font-weight-normal text-nowrap">melodic.min.css</code></div>
      </th>
      <td class="text-success">Included</td>
      <td class="text-success">Included</td>
      <td class="text-success">Included</td>
      <td class="text-success">Included</td>
    </tr>
    <tr>
      <th scope="row">
        <div><code class="font-weight-normal text-nowrap">melodic-grid.css</code></div>
        <div><code class="font-weight-normal text-nowrap">melodic-grid.min.css</code></div>
      </th>
      <td><a class="text-warning" href="{{ site.baseurl }}/docs/{{ site.docs_version }}/layout/grid/">Only grid system</a></td>
      <td class="bg-light text-muted">Not included</td>
      <td class="bg-light text-muted">Not included</td>
      <td><a class="text-warning" href="{{ site.baseurl }}/docs/{{ site.docs_version }}/utilities/flex/">Only flex utilities</a></td>
    </tr>
    <tr>
      <th scope="row">
        <div><code class="font-weight-normal text-nowrap">melodic-reboot.css</code></div>
        <div><code class="font-weight-normal text-nowrap">melodic-reboot.min.css</code></div>
      </th>
      <td class="bg-light text-muted">Not included</td>
      <td><a class="text-warning" href="{{ site.baseurl }}/docs/{{ site.docs_version }}/content/reboot/">Only Reboot</a></td>
      <td class="bg-light text-muted">Not included</td>
      <td class="bg-light text-muted">Not included</td>
    </tr>
  </tbody>
</table>

## JavaScript files

Similarly, we have options for including some or all of our compiled JavaScript.

<table class="table table-bordered">
  <thead>
    <tr>
      <th scope="col">JavaScript files</th>
      <th scope="col">Popper</th>
      <th scope="col">jQuery</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">
        <div><code class="font-weight-normal text-nowrap">melodic.bundle.js</code></div>
        <div><code class="font-weight-normal text-nowrap">melodic.bundle.min.js</code></div>
      </th>
      <td class="text-success">Included</td>
      <td class="bg-light text-muted">Not included</td>
    </tr>
    <tr>
      <th scope="row">
        <div><code class="font-weight-normal text-nowrap">melodic.js</code></div>
        <div><code class="font-weight-normal text-nowrap">melodic.min.js</code></div>
      </th>
      <td class="bg-light text-muted">Not included</td>
      <td class="bg-light text-muted">Not included</td>
    </tr>
  </tbody>
</table>

## Melodic source code

The Melodic source code download includes the precompiled CSS and JavaScript assets, along with source Sass, JavaScript, and documentation. More specifically, it includes the following and more:

{% highlight plaintext %}
melodic/
├── dist/
│   ├── css/
│   └── js/
├── docs/
│   └── examples/
├── js/
└── scss/
{% endhighlight %}

The `scss/` and `js/` are the source code for our CSS and JavaScript. The `dist/` folder includes everything listed in the precompiled download section above. The `docs/` folder includes the source code for our documentation, and `examples/` of Melodic usage. Beyond that, any other included file provides support for packages, license information, and development.
