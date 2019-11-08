package;

import js.Browser.*;
import js.html.XMLHttpRequest;

class Main {
	var url = "nav.html";
	var req = new XMLHttpRequest();

	public function new() {
		trace('cc-nav: a drop in off-canvas menu');

		// ficons add to document
		var link = document.createLinkElement();
		link.href = "https://cdn.jsdelivr.net/npm/ficons@1.1.52/dist/ficons/font.css";
		link.rel = "stylesheet";
		document.head.appendChild(link);

		// for now monkee.style is added as well
		var link = document.createLinkElement();
		link.href = "https://matthijskamstra.github.io/monkee-style/dist/monkee.css";
		link.rel = "stylesheet";
		document.head.appendChild(link);

		// basic stuff for menu at the top of body
		var input = htmlToElement('<input type="checkbox" id="menu-toggle" />');
		var label = htmlToElement('<label for="menu-toggle" class="menu-icon"><i class="fa fa-bars"></i></label>');
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
