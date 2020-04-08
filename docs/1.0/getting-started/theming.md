---
layout: docs
title: Theming Melodic
description: Customize Melodic with our built-in Sass variables setting global style preferences for easy theming and component changes.
group: getting-started
toc: true
redirect_from: "/docs/4.0/getting-started/options/"
---

## Introduction

In Melodic, theming is accomplished by Sass variables, Sass maps, and custom CSS.

## Sass

Utilize our source Sass files to take advantage of variables, maps, mixins, and more.

### File structure

Whenever possible, avoid modifying Melodic's core files in your project. For Sass, that means creating your own stylesheet that imports Melodic so you can modify and extend it. Assuming you're using a package manager like npm, you'll have a file structure that looks like this:

{% highlight plaintext %}
your-project/
├── scss
│   └── custom.scss
└── node_modules/
    └── melodic
        ├── js
        └── scss
{% endhighlight %}

If you've downloaded our source files and aren't using a package manager, you'll want to manually setup something similar to that structure, keeping Melodic's source files separate from your own.

{% highlight plaintext %}
your-project/
├── scss
│   └── custom.scss
└── melodic/
    ├── js
    └── scss
{% endhighlight %}

### Importing

In your `custom.scss`, you'll import Melodic's source Sass files. You have two options: include all of Melodic, or pick the parts you need. We encourage the latter, though be aware there are some requirements and dependencies across our components. You also will need to include some JavaScript for our plugins.

{% highlight scss %}
// Custom.scss
// Option A: Include all of Melodic

@import "node_modules/melodic/scss/melodic";
{% endhighlight %}

{% highlight scss %}
// Custom.scss
// Option B: Include parts of Melodic

// Required
@import "node_modules/melodic/scss/functions";
@import "node_modules/melodic/scss/variables";
@import "node_modules/melodic/scss/mixins";

// Optional
@import "node_modules/melodic/scss/reboot";
@import "node_modules/melodic/scss/type";
@import "node_modules/melodic/scss/images";
@import "node_modules/melodic/scss/code";
@import "node_modules/melodic/scss/grid";
{% endhighlight %}

With that setup in place, you can begin to modify any of the Sass variables and maps in your `custom.scss`. You can also start to add parts of Melodic under the `// Optional` section as needed. We suggest using the full import stack from our `melodic.scss` file as your starting point.

### Variable defaults

Every Sass variable in Melodic includes the `!default` flag allowing you to override the variable's default value in your own Sass without modifying Melodic's source code. Copy and paste variables as needed, modify their values, and remove the `!default` flag. If a variable has already been assigned, then it won't be re-assigned by the default values in Melodic.

Variable overrides within the same Sass file can come before or after the default variables. However, when overriding across Sass files, your overrides must come before you import Melodic's Sass files.

Here's an example that changes the `background-color` and `color` for the `<body>` when importing and compiling Melodic via npm:

{% highlight scss %}
// Your variable overrides
$body-bg: #000;
$body-color: #111;

// Melodic and its default variables
@import "node_modules/melodic/scss/melodic";
{% endhighlight %}

Repeat as necessary for any variable in Melodic, including the global options below.

### Maps and loops

Melodic includes a handful of Sass maps, key value pairs that make it easier to generate families of related CSS. We use Sass maps for our colors, grid breakpoints, and more. Just like Sass variables, all Sass maps include the `!default` flag and can be overridden and extended.

Some of our Sass maps are merged into empty ones by default. This is done to allow easy expansion of a given Sass map, but comes at the cost of making _removing_ items from a map slightly more difficult.

#### Modify map

To modify an existing color in our `$theme-colors` map, add the following to your custom Sass file:

{% highlight scss %}
$theme-colors: (
  "primary": #0074d9,
  "danger": #ff4136
);
{% endhighlight %}

#### Add to map

To add a new color to `$theme-colors`, add the new key and value:

{% highlight scss %}
$theme-colors: (
  "custom-color": #900
);
{% endhighlight %}

#### Remove from map

To remove colors from `$theme-colors`, or any other map, use `map-remove`:

{% highlight scss %}
$theme-colors: map-remove($theme-colors, "success", "info", "danger");
{% endhighlight %}

#### Required keys

Melodic assumes the presence of some specific keys within Sass maps as we use and extend these ourselves. As you customize the included maps, you may encounter errors where a specific Sass map's key is being used.

For example, we use the `primary`, `success`, and `danger` keys from `$theme-colors` for links, buttons, and form states. Replacing the values of these keys should present no issues, but removing them may cause Sass compilation issues. In these instances, you'll need to modify the Sass code that makes use of those values.

### Functions

Melodic utilizes several Sass functions, but only a subset are applicable to general theming. We've included three functions for getting values from the color maps:

{% highlight scss %}
@function color($key: "blue") {
  @return map-get($colors, $key);
}

@function theme-color($key: "primary") {
  @return map-get($theme-colors, $key);
}

@function gray($key: "100") {
  @return map-get($grays, $key);
}
{% endhighlight %}

These allow you to pick one color from a Sass map.

{% highlight scss %}
.custom-element {
  color: gray("100");
  background-color: theme-color("dark");
}
{% endhighlight %}

We also have another function for getting a particular _level_ of color from the `$theme-colors` map. Negative level values will lighten the color, while higher levels will darken. With a `$theme-color-interval` value less than 10%, you can request a color level of `10` or `-10`; at a value of 10% or higher, those color levels will return `black` and `white` colors respectively.

{% highlight scss %}
@function theme-color-level($color-name: "primary", $level: 0) {
  $color: theme-color($color-name);
  $color-base: if($level > 0, #000, #fff);
  $level: abs($level);

  @return mix($color-base, $color, $level * $theme-color-interval);
}
{% endhighlight %}

Here are some examples using Inspire's primary brand colors:
<div class="row">
  {% for color in site.data.brand-colors %}
    <div class="col-md-2 mb-3">
      <div class="p-2 brand-swatch-{{ color.name }}-shade-80">Black +80</div>
      <div class="p-2 brand-swatch-{{ color.name }}-shade-60">Black +60</div>
      <div class="p-2 brand-swatch-{{ color.name }}-shade-40">Black +40</div>
      <div class="p-2 brand-swatch-{{ color.name }}-shade-20">Black +20</div>
      <div class="px-2 py-3 brand-swatch-{{ color.name }}"><strong>{{ color.name | capitalize }}</strong></div>
      <div class="p-2 brand-swatch-{{ color.name }}-tint-20">White +20</div>
      <div class="p-2 brand-swatch-{{ color.name }}-tint-40">White +40</div>
      <div class="p-2 brand-swatch-{{ color.name }}-tint-60">White +60</div>
      <div class="p-2 brand-swatch-{{ color.name }}-tint-80">White +80</div>
    </div>
  {% endfor %}
</div>


In practice, you'd call the function and pass in two parameters: the name of the color from `$theme-colors` (e.g., primary or danger) and a numeric level.

{% highlight scss %}
.custom-element {
  color: theme-color-level(primary, -10);
}
{% endhighlight %}

Additional functions could be added in the future or your own custom Sass to create level functions for additional Sass maps, or even a generic one if you wanted to be more verbose.

### Color contrast

One additional function we include in Melodic is the color contrast function, `color-yiq`. It utilizes the [YIQ color space](https://en.wikipedia.org/wiki/YIQ) to automatically return a light (`#fff`) or dark (`#1b1b1b`) contrast color based on the specified base color. This function is especially useful for mixins or loops where you're generating multiple classes.

For example, to generate color swatches from our `$theme-colors` map:

{% highlight scss %}
@each $color, $value in $theme-colors {
  .swatch-#{$color} {
    color: color-yiq($value);
    background-color: #{$value};
  }
}
{% endhighlight %}

It can also be used for one-off contrast needs:

{% highlight scss %}
.custom-element {
  color: color-yiq(#000); // returns `color: #fff`
}
{% endhighlight %}

You can also specify a base color with our color map functions:

{% highlight scss %}
.custom-element {
  color: color-yiq(theme-color("dark")); // returns `color: #fff`
}
{% endhighlight %}

## Sass options

Customize Melodic with our built-in custom variables file and easily toggle global CSS preferences with new `$enable-*` Sass variables. Override a variable's value and recompile with `npm run test` as needed.

You can find and customize these variables for key global options in our `_variables.scss` file.

| Variable                    | Values                             | Description                                                                            |
| --------------------------- | ---------------------------------- | -------------------------------------------------------------------------------------- |
| `$spacer`                   | `1rem` (default), or any value > 0 | Specifies the default spacer value to programmatically generate our [spacer utilities]({{ site.baseurl }}/docs/{{ site.docs_version }}/utilities/spacing/). |
| `$enable-rounded`           | `true` (default) or `false`        | Enables predefined `border-radius` styles on various components. |
| `$enable-shadows`           | `true` (default) or `false`        | Enables predefined `box-shadow` styles on various components. |
| `$enable-gradients`         | `true` or `false` (default)        | Enables predefined gradients via `background-image` styles on various components. |
| `$enable-transitions`       | `true` (default) or `false`        | Enables predefined `transition`s on various components. |
| `$enable-grid-classes`      | `true` (default) or `false`        | Enables the generation of CSS classes for the grid system (e.g., `.container`, `.row`, `.col-md-1`, etc.). |
| `$enable-caret`             | `true` (default) or `false`        | Enables pseudo element caret on `.dropdown-toggle`. |
| `$enable-print-styles`      | `true` (default) or `false`        | Enables styles for optimizing printing. |

## Color

Many of Melodic's various components and utilities are built through a series of colors defined in a Sass map. This map can be looped over in Sass to quickly generate a series of rulesets.

### All colors

All colors available in Melodic, are available as Sass variables and a Sass map in our `scss/_variables.scss` file.

<div class="row">
  {% for color in site.data.colors %}
    {% unless color.name == "white" or color.name == "gray" %}
    <div class="col-md-4">
      <div class="p-3 mb-3 swatch-{{ color.name }}">{{ color.name | capitalize }}</div>
    </div>
    {% endunless %}
  {% endfor %}
</div>

Here's how you can use these in your Sass:

{% highlight scss %}
// With variable
.alpha { color: $purple; }

// From the Sass map with our `color()` function
.beta { color: color("purple"); }
{% endhighlight %}

[Color utility classes]({{ site.baseurl }}/docs/{{ site.docs_version }}/utilities/colors/) are also available for setting `color` and `background-color`.

{% callout info %}
In the future, we'll aim to provide Sass maps and variables for shades of each color as we've done with the grayscale colors below.
{% endcallout %}

### Theme colors

We use a subset of all colors to create a smaller color palette for generating color schemes, also available as Sass variables and a Sass map in our `scss/_variables.scss` file.

<div class="row">
  {% for color in site.data.theme-colors %}
    <div class="col-md-4">
      <div class="p-3 mb-3 swatch-{{ color.name }}">{{ color.name | capitalize }}</div>
    </div>
  {% endfor %}
</div>

### Grays

An expansive set of gray variables and a Sass map in `scss/_variables.scss` for consistent shades of gray across your project.

<div class="row mb-3">
  <div class="col-md-4">
    {% for color in site.data.grays %}
      <div class="p-3 swatch-{{ color.name }}">{{ color.name | capitalize }}</div>
    {% endfor %}
  </div>
</div>

Within `_variables.scss`, you'll find our color variables and Sass map. Here's an example of the `$colors` Sass map:

{% highlight scss %}
$colors: (
  "blue-violet":  $blue-violet,
  "indigo":  $indigo,
  "purple":  $purple,
  "rosewood":  $rosewood,
  "red":  $red,
  "orange":  $orange,
  "harvest":  $harvest,
  "sand":  $sand,
  "yellow":  $yellow,
  "mango":  $mango,
  "vis-vis":  $vis-vis,
  "malachite":  $malachite,
  "green":  $green,
  "teal":  $teal,
  "pacific":  $pacific,
  "anakiwa":  $anakiwa,
  "pelorous":  $pelorous,
  "cyan":  $cyan,
  "white":  $white,
  "gray":  $gray,
  "cosmos":  $cosmos
) !default;
{% endhighlight %}

Add, remove, or modify values within the map to update how they're used in many other components. Unfortunately at this time, not _every_ component utilizes this Sass map. Future updates will strive to improve upon this. Until then, plan on making use of the `${color}` variables and this Sass map.

## Components

Many of Melodic's components and utilities are built with `@each` loops that iterate over a Sass map. This is especially helpful for generating variants of a component by our `$theme-colors` and creating responsive variants for each breakpoint. As you customize these Sass maps and recompile, you'll automatically see your changes reflected in these loops.

### Modifiers

Many of Melodic's components are built with a base-modifier class approach. This means the bulk of the styling is contained to a base class (e.g., `.btn`) while style variations are confined to modifier classes (e.g., `.btn-danger`). These modifier classes are built from the `$theme-colors` map to make customizing the number and name of our modifier classes.

Here are two examples of how we loop over the `$theme-colors` map to generate modifiers to the `.alert` component and all our `.bg-*` background utilities.

{% highlight scss %}
// Generate alert modifier classes
@each $color, $value in $theme-colors {
  .alert-#{$color} {
    @include alert-variant(theme-color-level($color, -10), theme-color-level($color, -9), theme-color-level($color, 6));
  }
}

// Generate `.bg-*` color utilities
@each $color, $value in $theme-colors {
  @include bg-variant('.bg-#{$color}', $value);
}
{% endhighlight %}

### Responsive

These Sass loops aren't limited to color maps, either. You can also generate responsive variations of your components or utilities. Take for example our responsive text alignment utilities where we mix an `@each` loop for the `$grid-breakpoints` Sass map with a media query include.

{% highlight scss %}
@each $breakpoint in map-keys($grid-breakpoints) {
  @include media-breakpoint-up($breakpoint) {
    $infix: breakpoint-infix($breakpoint, $grid-breakpoints);

    .text#{$infix}-left   { text-align: left !important; }
    .text#{$infix}-right  { text-align: right !important; }
    .text#{$infix}-center { text-align: center !important; }
  }
}
{% endhighlight %}

Should you need to modify your `$grid-breakpoints`, your changes will apply to all the loops iterating over that map.

## CSS variables

Melodic includes around two dozen [CSS custom properties (variables)](https://developer.mozilla.org/en-US/docs/Web/CSS/Using_CSS_variables) in its compiled CSS. These provide easy access to commonly used values like our theme colors, breakpoints, and primary font stacks when working in your browser's Inspector, a code sandbox, or general prototyping.

### Available variables

Here are the variables we include (note that the `:root` is required). They're located in our `_root.scss` file.

{% highlight css %}
:root {
  --blue-violet: #5147ad;
  --indigo: #6610f2;
  --purple: #6f42c1;
  --rosewood: #cf126d;
  --red: #dc3545;
  --orange: #fd7e14;
  --harvest: #ffa867;
  --sand: #efdbcb;
  --yellow: #ffc107;
  --mango: #f8cc1c;
  --vis-vis: #fff5a5;
  --malachite: #00524d;
  --green: #28a745;
  --teal: #20c997;
  --pacific: #2b6ca3;
  --anakiwa: #87dffc;
  --pelorous: #41b3c6;
  --cyan: #17a2b8;
  --white: #fff;
  --gray: #868e96;
  --cosmos: #1b1b1b;
  --primary: #cf126d;
  --secondary: #6c757d;
  --success: #00524d;
  --danger: #dc3545;
  --warning: #ffa867;
  --info: #2b6ca3;
  --light: #f8f9fa;
  --dark: #1b1b1b;
  --breakpoint-xs: 0;
  --breakpoint-sm: 576px;
  --breakpoint-md: 768px;
  --breakpoint-lg: 992px;
  --breakpoint-xl: 1200px;
  --font-family-sans-serif: Aeonik, -apple-system, BlinkMacSystemFont, "Segoe UI", "Helvetica Neue", Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
  --font-family-monospace: "Roboto Mono", "SFMono-Regular", Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
}
{% endhighlight %}

### Examples

CSS variables offer similar flexibility to Sass's variables, but without the need for compilation before being served to the browser. For example, here we're resetting our page's font and link styles with CSS variables.

{% highlight css %}
body {
  font: 1rem/1.5 var(--font-family-sans-serif);
}
a {
  color: var(--blue);
}
{% endhighlight %}

You can also use our breakpoint variables in your media queries:

{% highlight css %}
.content-secondary {
  display: none;
}

@media (min-width(var(--breakpoint-sm))) {
  .content-secondary {
    display: block;
  }
}
{% endhighlight %}
