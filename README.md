# drop-in-off-canvas-menu

Quickly create an off canvas menu

I usually work lots of different files, and it would be nice to quicly add a navigation without all the research..

See the [example](https://matthijskamstra.github.io/drop-in-off-canvas-menu/).

**weird**

I wanted to create a css only off-canvas menu... which worked, but I need a lot of javascript to get it injected into pages..
Defeats the purpose of using css only... not every wheel is rounder!

## Goal

minimal css and javascript in the page to get some for of navigation.

## code

At the bottom of the body in you html add the script [cc_nav.js](/dist/cc_nav.js) of the minified version [cc_nav.min.js](/dist/cc_nav.min.js)

```html
<script type="text/javascript" src="cc_nav.js"></script>
```

```html
<!-- githosted files -->
<script
  type="text/javascript"
  src="https://matthijskamstra.github.io/drop-in-off-canvas-menu/cc_nav.js"
></script>
<!-- or minified -->
<script
  type="text/javascript"
  src="https://matthijskamstra.github.io/drop-in-off-canvas-menu/cc_nav.min.js"
></script>
```

create file with the name `nav.html` with content that will be the navigation

```html
<ul>
  <li><a href="#love">I ❤</a></li>
  <li><a href="#hate">I not ...</a></li>
  ....
</ul>
```
