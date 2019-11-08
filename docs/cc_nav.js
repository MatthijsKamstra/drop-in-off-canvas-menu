// Generated by Haxe 4.0.1
(function ($global) { "use strict";
var Main = function() {
	this.req = new XMLHttpRequest();
	this.url = "nav.html";
	console.log("src/Main.hx:11:","cc-nav: a drop in off-canvas menu");
	var css = ":root{--black:#212121;--white:#ffffff;--sidebar-width:250px;--icon-padding:20px;--icon-left:20px}body{margin:0;padding:0}.slideout-sidebar{font-family:Arial,Helvetica,sans-serif;z-index:0;position:fixed;top:0;left:calc(-1 * var(--sidebar-width));width:var(--sidebar-width);height:100%;background-color:var(--black);transition:.3s ease-in-out;overflow:scroll;padding:0;margin:0}.slideout-sidebar a{color:var(--white);outline:0;text-decoration:none;font-size:.8rem}.slideout-sidebar ul{list-style:none;margin:0;padding:20px}.slideout-sidebar ul li{cursor:pointer;padding:18px 0;border-bottom:1px solid rgba(244,244,244,.4)}.slideout-sidebar ul li:last-child{border-bottom:0}#menu-toggle{display:none}.menu-icon{position:absolute;top:0;left:0;font-size:30px;z-index:20000;transition:.3s ease-in-out;padding:var(--icon-padding);cursor:pointer;color:var(--black)}#menu-toggle:checked~.slideout-sidebar{left:0}#menu-toggle:checked+.menu-icon{left:calc(var(--icon-left) + var(--sidebar-width))}";
	var style = window.document.createElement("style");
	style.innerText = css;
	window.document.head.appendChild(style);
	var input = this.htmlToElement("<input type=\"checkbox\" id=\"menu-toggle\" />");
	var label = this.htmlToElement("<label for=\"menu-toggle\" class=\"menu-icon\">&#9776;</label>");
	window.document.body.prepend(label);
	window.document.body.prepend(input);
	var nav = window.document.createElement("nav");
	nav.id = "storage";
	nav.className = "slideout-sidebar";
	window.document.body.append(nav);
	this.loadHTML(this.url,nav);
};
Main.main = function() {
	var app = new Main();
};
Main.prototype = {
	htmlToElement: function(html) {
		var template = window.document.createElement("div");
		html = html.trim();
		template.innerHTML = html;
		return template.firstChild;
	}
	,loadHTML: function(url,el) {
		var _gthis = this;
		this.req.open("GET",url);
		this.req.onload = function() {
			var body = _gthis.getBody(_gthis.req.response);
			if(body == "") {
				body = _gthis.req.response;
			}
			_gthis.processHTML(body,el);
		};
		this.req.onerror = function(error) {
			window.console.error("[JS] error: " + error);
		};
		this.req.send();
	}
	,getBody: function(html) {
		var test = html.toLowerCase();
		var x = test.indexOf("<body");
		if(x == -1) {
			return "";
		}
		x = test.indexOf(">",x);
		if(x == -1) {
			return "";
		}
		var y = test.lastIndexOf("</body>");
		if(y == -1) {
			y = test.lastIndexOf("</html>");
		}
		if(y == -1) {
			y = html.length;
		}
		return html.slice(x + 1,y);
	}
	,processHTML: function(content,target) {
		target.innerHTML = content;
	}
};
Main.main();
})({});

//# sourceMappingURL=cc_nav.js.map