package;

import js.Browser.*;
import js.html.XMLHttpRequest;

class Main {
	var url = "nav.html";
	var req = new XMLHttpRequest();

	public function new() {
		trace('cc-nav: a drop in off-canvas menu');

		var css = ":root{--black:#212121;--white:#ffffff;--sidebar-width:250px;--icon-padding:20px;--icon-left:20px}body{margin:0;padding:0}.slideout-sidebar{font-family:Arial,Helvetica,sans-serif;z-index:0;position:fixed;top:0;left:calc(-1 * var(--sidebar-width));width:var(--sidebar-width);height:100%;background-color:var(--black);transition:.3s ease-in-out;overflow:scroll;padding:0;margin:0}.slideout-sidebar a{color:var(--white);outline:0;text-decoration:none;font-size:.8rem}.slideout-sidebar ul{list-style:none;margin:0;padding:20px}.slideout-sidebar ul li{cursor:pointer;padding:18px 0;border-bottom:1px solid rgba(244,244,244,.4)}.slideout-sidebar ul li:last-child{border-bottom:0}#menu-toggle{display:none}.menu-icon{position:absolute;top:0;left:0;font-size:30px;z-index:20000;transition:.3s ease-in-out;padding:var(--icon-padding);cursor:pointer;color:var(--black)}#menu-toggle:checked~.slideout-sidebar{left:0}#menu-toggle:checked+.menu-icon{left:calc(var(--icon-left) + var(--sidebar-width))}";
		var style = document.createStyleElement();
		style.innerText = css;
		document.head.appendChild(style);

		// basic stuff for menu at the top of body
		var input = htmlToElement('<input type="checkbox" id="menu-toggle" />');
		var label = htmlToElement('<label for="menu-toggle" class="menu-icon">&#9776;</label>');
		document.body.prepend(label);
		document.body.prepend(input);

		// nav
		var nav = document.createElement('nav');
		nav.id = "storage";
		nav.className = "slideout-sidebar";
		document.body.append(nav);

		// storage
		loadHTML(url, nav);
	}

	function htmlToElement(html:String) {
		var template = document.createDivElement();
		html = untyped html.trim(); // Never return a text node of whitespace as the result
		template.innerHTML = html;
		return template.firstChild;
	}

	function loadHTML(?url:String, ?el:js.html.Element) {
		// your code
		req.open('GET', url);
		req.onload = function() {
			var body = getBody(req.response);
			if (body == "")
				body = req.response;
			processHTML(body, el);
		};
		req.onerror = function(error) {
			console.error('[JS] error: $error');
		};
		req.send();
	}

	/**
	 * get the body of the document...
	 * but I really don't need all html to have a navigation
	 *
	 * @param html
	 */
	function getBody(html) {
		var test:String = html.toLowerCase(); // to eliminate case sensitivity
		var x:Int = test.indexOf("<body");
		if (x == -1)
			return "";

		x = test.indexOf(">", x);
		if (x == -1)
			return "";
		var y = test.lastIndexOf("</body>");
		if (y == -1)
			y = test.lastIndexOf("</html>");
		if (y == -1)
			y = html.length; // If no HTML then just grab everything till end
		return html.slice(x + 1, y);
	}

	function processHTML(content:String, target:js.html.Element) {
		target.innerHTML = content;
	}

	static public function main() {
		var app = new Main();
	}
}
