/*mousewheel*/
(function (a) { function d(b) { var c = b || window.event, d = [].slice.call(arguments, 1), e = 0, f = !0, g = 0, h = 0; return b = a.event.fix(c), b.type = "mousewheel", c.wheelDelta && (e = c.wheelDelta / 120), c.detail && (e = -c.detail / 3), h = e, c.axis !== undefined && c.axis === c.HORIZONTAL_AXIS && (h = 0, g = -1 * e), c.wheelDeltaY !== undefined && (h = c.wheelDeltaY / 120), c.wheelDeltaX !== undefined && (g = -1 * c.wheelDeltaX / 120), d.unshift(b, e, g, h), (a.event.dispatch || a.event.handle).apply(this, d) } var b = ["DOMMouseScroll", "mousewheel"]; if (a.event.fixHooks) for (var c = b.length; c;) a.event.fixHooks[b[--c]] = a.event.mouseHooks; a.event.special.mousewheel = { setup: function () { if (this.addEventListener) for (var a = b.length; a;) this.addEventListener(b[--a], d, !1); else this.onmousewheel = d }, teardown: function () { if (this.removeEventListener) for (var a = b.length; a;) this.removeEventListener(b[--a], d, !1); else this.onmousewheel = null } }, a.fn.extend({ mousewheel: function (a) { return a ? this.bind("mousewheel", a) : this.trigger("mousewheel") }, unmousewheel: function (a) { return this.unbind("mousewheel", a) } }) })(jQuery);
/*custom scrollbar*/
(function (c) { var b = { init: function (e) { var f = { set_width: false, set_height: false, horizontalScroll: false, scrollInertia: 950, mouseWheel: true, mouseWheelPixels: "auto", autoDraggerLength: true, autoHideScrollbar: false, snapAmount: null, snapOffset: 0, scrollButtons: { enable: false, scrollType: "continuous", scrollSpeed: "auto", scrollAmount: 40 }, advanced: { updateOnBrowserResize: true, updateOnContentResize: false, autoExpandHorizontalScroll: false, autoScrollOnFocus: true, normalizeMouseWheelDelta: false }, contentTouchScroll: true, callbacks: { onScrollStart: function () { }, onScroll: function () { }, onTotalScroll: function () { }, onTotalScrollBack: function () { }, onTotalScrollOffset: 0, onTotalScrollBackOffset: 0, whileScrolling: function () { } }, theme: "light" }, e = c.extend(true, f, e); return this.each(function () { var m = c(this); if (e.set_width) { m.css("width", e.set_width) } if (e.set_height) { m.css("height", e.set_height) } if (!c(document).data("mCustomScrollbar-index")) { c(document).data("mCustomScrollbar-index", "1") } else { var t = parseInt(c(document).data("mCustomScrollbar-index")); c(document).data("mCustomScrollbar-index", t + 1) } m.wrapInner("<div class='mCustomScrollBox mCS-" + e.theme + "' id='mCSB_" + c(document).data("mCustomScrollbar-index") + "' style='position:relative; height:100%; overflow:hidden; max-width:100%;' />").addClass("mCustomScrollbar _mCS_" + c(document).data("mCustomScrollbar-index")); var g = m.children(".mCustomScrollBox"); if (e.horizontalScroll) { g.addClass("mCSB_horizontal").wrapInner("<div class='mCSB_h_wrapper' style='position:relative; left:0; width:999999px;' />"); var k = g.children(".mCSB_h_wrapper"); k.wrapInner("<div class='mCSB_container' style='position:absolute; left:0;' />").children(".mCSB_container").css({ width: k.children().outerWidth(), position: "relative" }).unwrap() } else { g.wrapInner("<div class='mCSB_container' style='position:relative; top:0;' />") } var o = g.children(".mCSB_container"); if (c.support.touch) { o.addClass("mCS_touch") } o.after("<div class='mCSB_scrollTools' style='position:absolute;z-index:10;'><div class='mCSB_draggerContainer'><div class='mCSB_dragger' style='position:absolute;' oncontextmenu='return false;'><div class='mCSB_dragger_bar' style='position:relative;'></div></div><div class='mCSB_draggerRail'></div></div></div>"); var l = g.children(".mCSB_scrollTools"), h = l.children(".mCSB_draggerContainer"), q = h.children(".mCSB_dragger"); if (e.horizontalScroll) { q.data("minDraggerWidth", q.width()) } else { q.data("minDraggerHeight", q.height()) } if (e.scrollButtons.enable) { if (e.horizontalScroll) { l.prepend("<a class='mCSB_buttonLeft' oncontextmenu='return false;'></a>").append("<a class='mCSB_buttonRight' oncontextmenu='return false;'></a>") } else { l.prepend("<a class='mCSB_buttonUp' oncontextmenu='return false;'></a>").append("<a class='mCSB_buttonDown' oncontextmenu='return false;'></a>") } } g.bind("scroll", function () { if (!m.is(".mCS_disabled")) { g.scrollTop(0).scrollLeft(0) } }); m.data({ mCS_Init: true, mCustomScrollbarIndex: c(document).data("mCustomScrollbar-index"), horizontalScroll: e.horizontalScroll, scrollInertia: e.scrollInertia, scrollEasing: "mcsEaseOut", mouseWheel: e.mouseWheel, mouseWheelPixels: e.mouseWheelPixels, autoDraggerLength: e.autoDraggerLength, autoHideScrollbar: e.autoHideScrollbar, snapAmount: e.snapAmount, snapOffset: e.snapOffset, scrollButtons_enable: e.scrollButtons.enable, scrollButtons_scrollType: e.scrollButtons.scrollType, scrollButtons_scrollSpeed: e.scrollButtons.scrollSpeed, scrollButtons_scrollAmount: e.scrollButtons.scrollAmount, autoExpandHorizontalScroll: e.advanced.autoExpandHorizontalScroll, autoScrollOnFocus: e.advanced.autoScrollOnFocus, normalizeMouseWheelDelta: e.advanced.normalizeMouseWheelDelta, contentTouchScroll: e.contentTouchScroll, onScrollStart_Callback: e.callbacks.onScrollStart, onScroll_Callback: e.callbacks.onScroll, onTotalScroll_Callback: e.callbacks.onTotalScroll, onTotalScrollBack_Callback: e.callbacks.onTotalScrollBack, onTotalScroll_Offset: e.callbacks.onTotalScrollOffset, onTotalScrollBack_Offset: e.callbacks.onTotalScrollBackOffset, whileScrolling_Callback: e.callbacks.whileScrolling, bindEvent_scrollbar_drag: false, bindEvent_content_touch: false, bindEvent_scrollbar_click: false, bindEvent_mousewheel: false, bindEvent_buttonsContinuous_y: false, bindEvent_buttonsContinuous_x: false, bindEvent_buttonsPixels_y: false, bindEvent_buttonsPixels_x: false, bindEvent_focusin: false, bindEvent_autoHideScrollbar: false, mCSB_buttonScrollRight: false, mCSB_buttonScrollLeft: false, mCSB_buttonScrollDown: false, mCSB_buttonScrollUp: false }); if (e.horizontalScroll) { if (m.css("max-width") !== "none") { if (!e.advanced.updateOnContentResize) { e.advanced.updateOnContentResize = true } } } else { if (m.css("max-height") !== "none") { var s = false, r = parseInt(m.css("max-height")); if (m.css("max-height").indexOf("%") >= 0) { s = r, r = m.parent().height() * s / 100 } m.css("overflow", "hidden"); g.css("max-height", r) } } m.mCustomScrollbar("update"); if (e.advanced.updateOnBrowserResize) { var i, j = c(window).width(), u = c(window).height(); c(window).bind("resize." + m.data("mCustomScrollbarIndex"), function () { if (i) { clearTimeout(i) } i = setTimeout(function () { if (!m.is(".mCS_disabled") && !m.is(".mCS_destroyed")) { var w = c(window).width(), v = c(window).height(); if (j !== w || u !== v) { if (m.css("max-height") !== "none" && s) { g.css("max-height", m.parent().height() * s / 100) } m.mCustomScrollbar("update"); j = w; u = v } } }, 150) }) } if (e.advanced.updateOnContentResize) { var p; if (e.horizontalScroll) { var n = o.outerWidth() } else { var n = o.outerHeight() } p = setInterval(function () { if (e.horizontalScroll) { if (e.advanced.autoExpandHorizontalScroll) { o.css({ position: "absolute", width: "auto" }).wrap("<div class='mCSB_h_wrapper' style='position:relative; left:0; width:999999px;' />").css({ width: o.outerWidth(), position: "relative" }).unwrap() } var v = o.outerWidth() } else { var v = o.outerHeight() } if (v != n) { m.mCustomScrollbar("update"); n = v } }, 300) } }) }, update: function () { var n = c(this), k = n.children(".mCustomScrollBox"), q = k.children(".mCSB_container"); q.removeClass("mCS_no_scrollbar"); n.removeClass("mCS_disabled mCS_destroyed"); k.scrollTop(0).scrollLeft(0); var y = k.children(".mCSB_scrollTools"), o = y.children(".mCSB_draggerContainer"), m = o.children(".mCSB_dragger"); if (n.data("horizontalScroll")) { var A = y.children(".mCSB_buttonLeft"), t = y.children(".mCSB_buttonRight"), f = k.width(); if (n.data("autoExpandHorizontalScroll")) { q.css({ position: "absolute", width: "auto" }).wrap("<div class='mCSB_h_wrapper' style='position:relative; left:0; width:999999px;' />").css({ width: q.outerWidth(), position: "relative" }).unwrap() } var z = q.outerWidth() } else { var w = y.children(".mCSB_buttonUp"), g = y.children(".mCSB_buttonDown"), r = k.height(), i = q.outerHeight() } if (i > r && !n.data("horizontalScroll")) { y.css("display", "block"); var s = o.height(); if (n.data("autoDraggerLength")) { var u = Math.round(r / i * s), l = m.data("minDraggerHeight"); if (u <= l) { m.css({ height: l }) } else { if (u >= s - 10) { var p = s - 10; m.css({ height: p }) } else { m.css({ height: u }) } } m.children(".mCSB_dragger_bar").css({ "line-height": m.height() + "px" }) } var B = m.height(), x = (i - r) / (s - B); n.data("scrollAmount", x).mCustomScrollbar("scrolling", k, q, o, m, w, g, A, t); var D = Math.abs(q.position().top); n.mCustomScrollbar("scrollTo", D, { scrollInertia: 0, trigger: "internal" }) } else { if (z > f && n.data("horizontalScroll")) { y.css("display", "block"); var h = o.width(); if (n.data("autoDraggerLength")) { var j = Math.round(f / z * h), C = m.data("minDraggerWidth"); if (j <= C) { m.css({ width: C }) } else { if (j >= h - 10) { var e = h - 10; m.css({ width: e }) } else { m.css({ width: j }) } } } var v = m.width(), x = (z - f) / (h - v); n.data("scrollAmount", x).mCustomScrollbar("scrolling", k, q, o, m, w, g, A, t); var D = Math.abs(q.position().left); n.mCustomScrollbar("scrollTo", D, { scrollInertia: 0, trigger: "internal" }) } else { k.unbind("mousewheel focusin"); if (n.data("horizontalScroll")) { m.add(q).css("left", 0) } else { m.add(q).css("top", 0) } y.css("display", "none"); q.addClass("mCS_no_scrollbar"); n.data({ bindEvent_mousewheel: false, bindEvent_focusin: false }) } } }, scrolling: function (h, p, m, j, w, e, A, v) { var k = c(this); if (!k.data("bindEvent_scrollbar_drag")) { var n, o; if (c.support.msPointer) { j.bind("MSPointerDown", function (H) { H.preventDefault(); k.data({ on_drag: true }); j.addClass("mCSB_dragger_onDrag"); var G = c(this), J = G.offset(), F = H.originalEvent.pageX - J.left, I = H.originalEvent.pageY - J.top; if (F < G.width() && F > 0 && I < G.height() && I > 0) { n = I; o = F } }); c(document).bind("MSPointerMove." + k.data("mCustomScrollbarIndex"), function (H) { H.preventDefault(); if (k.data("on_drag")) { var G = j, J = G.offset(), F = H.originalEvent.pageX - J.left, I = H.originalEvent.pageY - J.top; D(n, o, I, F) } }).bind("MSPointerUp." + k.data("mCustomScrollbarIndex"), function (x) { k.data({ on_drag: false }); j.removeClass("mCSB_dragger_onDrag") }) } else { j.bind("mousedown touchstart", function (H) { H.preventDefault(); H.stopImmediatePropagation(); var G = c(this), K = G.offset(), F, J; if (H.type === "touchstart") { var I = H.originalEvent.touches[0] || H.originalEvent.changedTouches[0]; F = I.pageX - K.left; J = I.pageY - K.top } else { k.data({ on_drag: true }); j.addClass("mCSB_dragger_onDrag"); F = H.pageX - K.left; J = H.pageY - K.top } if (F < G.width() && F > 0 && J < G.height() && J > 0) { n = J; o = F } }).bind("touchmove", function (H) { H.preventDefault(); H.stopImmediatePropagation(); var K = H.originalEvent.touches[0] || H.originalEvent.changedTouches[0], G = c(this), J = G.offset(), F = K.pageX - J.left, I = K.pageY - J.top; D(n, o, I, F) }); c(document).bind("mousemove." + k.data("mCustomScrollbarIndex"), function (H) { if (k.data("on_drag")) { var G = j, J = G.offset(), F = H.pageX - J.left, I = H.pageY - J.top; D(n, o, I, F) } }).bind("mouseup." + k.data("mCustomScrollbarIndex"), function (x) { k.data({ on_drag: false }); j.removeClass("mCSB_dragger_onDrag") }) } k.data({ bindEvent_scrollbar_drag: true }) } function D(G, H, I, F) { if (k.data("horizontalScroll")) { k.mCustomScrollbar("scrollTo", (j.position().left - (H)) + F, { moveDragger: true, trigger: "internal" }) } else { k.mCustomScrollbar("scrollTo", (j.position().top - (G)) + I, { moveDragger: true, trigger: "internal" }) } } if (c.support.touch && k.data("contentTouchScroll")) { if (!k.data("bindEvent_content_touch")) { var l, B, r, s, u, C, E; p.bind("touchstart", function (x) { x.stopImmediatePropagation(); l = x.originalEvent.touches[0] || x.originalEvent.changedTouches[0]; B = c(this); r = B.offset(); u = l.pageX - r.left; s = l.pageY - r.top; C = s; E = u }); p.bind("touchmove", function (x) { x.preventDefault(); x.stopImmediatePropagation(); l = x.originalEvent.touches[0] || x.originalEvent.changedTouches[0]; B = c(this).parent(); r = B.offset(); u = l.pageX - r.left; s = l.pageY - r.top; if (k.data("horizontalScroll")) { k.mCustomScrollbar("scrollTo", E - u, { trigger: "internal" }) } else { k.mCustomScrollbar("scrollTo", C - s, { trigger: "internal" }) } }) } } if (!k.data("bindEvent_scrollbar_click")) { m.bind("click", function (F) { var x = (F.pageY - m.offset().top) * k.data("scrollAmount"), y = c(F.target); if (k.data("horizontalScroll")) { x = (F.pageX - m.offset().left) * k.data("scrollAmount") } if (y.hasClass("mCSB_draggerContainer") || y.hasClass("mCSB_draggerRail")) { k.mCustomScrollbar("scrollTo", x, { trigger: "internal", scrollEasing: "draggerRailEase" }) } }); k.data({ bindEvent_scrollbar_click: true }) } if (k.data("mouseWheel")) { if (!k.data("bindEvent_mousewheel")) { h.bind("mousewheel", function (H, J) { var G, F = k.data("mouseWheelPixels"), x = Math.abs(p.position().top), I = j.position().top, y = m.height() - j.height(); if (k.data("normalizeMouseWheelDelta")) { if (J < 0) { J = -1 } else { J = 1 } } if (F === "auto") { F = 100 + Math.round(k.data("scrollAmount") / 2) } if (k.data("horizontalScroll")) { I = j.position().left; y = m.width() - j.width(); x = Math.abs(p.position().left) } if ((J > 0 && I !== 0) || (J < 0 && I !== y)) { H.preventDefault(); H.stopImmediatePropagation() } G = x - (J * F); k.mCustomScrollbar("scrollTo", G, { trigger: "internal" }) }); k.data({ bindEvent_mousewheel: true }) } } if (k.data("scrollButtons_enable")) { if (k.data("scrollButtons_scrollType") === "pixels") { if (k.data("horizontalScroll")) { v.add(A).unbind("mousedown touchstart MSPointerDown mouseup MSPointerUp mouseout MSPointerOut touchend", i, g); k.data({ bindEvent_buttonsContinuous_x: false }); if (!k.data("bindEvent_buttonsPixels_x")) { v.bind("click", function (x) { x.preventDefault(); q(Math.abs(p.position().left) + k.data("scrollButtons_scrollAmount")) }); A.bind("click", function (x) { x.preventDefault(); q(Math.abs(p.position().left) - k.data("scrollButtons_scrollAmount")) }); k.data({ bindEvent_buttonsPixels_x: true }) } } else { e.add(w).unbind("mousedown touchstart MSPointerDown mouseup MSPointerUp mouseout MSPointerOut touchend", i, g); k.data({ bindEvent_buttonsContinuous_y: false }); if (!k.data("bindEvent_buttonsPixels_y")) { e.bind("click", function (x) { x.preventDefault(); q(Math.abs(p.position().top) + k.data("scrollButtons_scrollAmount")) }); w.bind("click", function (x) { x.preventDefault(); q(Math.abs(p.position().top) - k.data("scrollButtons_scrollAmount")) }); k.data({ bindEvent_buttonsPixels_y: true }) } } function q(x) { if (!j.data("preventAction")) { j.data("preventAction", true); k.mCustomScrollbar("scrollTo", x, { trigger: "internal" }) } } } else { if (k.data("horizontalScroll")) { v.add(A).unbind("click"); k.data({ bindEvent_buttonsPixels_x: false }); if (!k.data("bindEvent_buttonsContinuous_x")) { v.bind("mousedown touchstart MSPointerDown", function (y) { y.preventDefault(); var x = z(); k.data({ mCSB_buttonScrollRight: setInterval(function () { k.mCustomScrollbar("scrollTo", Math.abs(p.position().left) + x, { trigger: "internal", scrollEasing: "easeOutCirc" }) }, 17) }) }); var i = function (x) { x.preventDefault(); clearInterval(k.data("mCSB_buttonScrollRight")) }; v.bind("mouseup touchend MSPointerUp mouseout MSPointerOut", i); A.bind("mousedown touchstart MSPointerDown", function (y) { y.preventDefault(); var x = z(); k.data({ mCSB_buttonScrollLeft: setInterval(function () { k.mCustomScrollbar("scrollTo", Math.abs(p.position().left) - x, { trigger: "internal", scrollEasing: "easeOutCirc" }) }, 17) }) }); var g = function (x) { x.preventDefault(); clearInterval(k.data("mCSB_buttonScrollLeft")) }; A.bind("mouseup touchend MSPointerUp mouseout MSPointerOut", g); k.data({ bindEvent_buttonsContinuous_x: true }) } } else { e.add(w).unbind("click"); k.data({ bindEvent_buttonsPixels_y: false }); if (!k.data("bindEvent_buttonsContinuous_y")) { e.bind("mousedown touchstart MSPointerDown", function (y) { y.preventDefault(); var x = z(); k.data({ mCSB_buttonScrollDown: setInterval(function () { k.mCustomScrollbar("scrollTo", Math.abs(p.position().top) + x, { trigger: "internal", scrollEasing: "easeOutCirc" }) }, 17) }) }); var t = function (x) { x.preventDefault(); clearInterval(k.data("mCSB_buttonScrollDown")) }; e.bind("mouseup touchend MSPointerUp mouseout MSPointerOut", t); w.bind("mousedown touchstart MSPointerDown", function (y) { y.preventDefault(); var x = z(); k.data({ mCSB_buttonScrollUp: setInterval(function () { k.mCustomScrollbar("scrollTo", Math.abs(p.position().top) - x, { trigger: "internal", scrollEasing: "easeOutCirc" }) }, 17) }) }); var f = function (x) { x.preventDefault(); clearInterval(k.data("mCSB_buttonScrollUp")) }; w.bind("mouseup touchend MSPointerUp mouseout MSPointerOut", f); k.data({ bindEvent_buttonsContinuous_y: true }) } } function z() { var x = k.data("scrollButtons_scrollSpeed"); if (k.data("scrollButtons_scrollSpeed") === "auto") { x = Math.round((k.data("scrollInertia") + 100) / 40) } return x } } } if (k.data("autoScrollOnFocus")) { if (!k.data("bindEvent_focusin")) { h.bind("focusin", function () { h.scrollTop(0).scrollLeft(0); var x = c(document.activeElement); if (x.is("input,textarea,select,button,a[tabindex],area,object")) { var G = p.position().top, y = x.position().top, F = h.height() - x.outerHeight(); if (k.data("horizontalScroll")) { G = p.position().left; y = x.position().left; F = h.width() - x.outerWidth() } if (G + y < 0 || G + y > F) { k.mCustomScrollbar("scrollTo", y, { trigger: "internal" }) } } }); k.data({ bindEvent_focusin: true }) } } if (k.data("autoHideScrollbar")) { if (!k.data("bindEvent_autoHideScrollbar")) { h.bind("mouseenter", function (x) { h.addClass("mCS-mouse-over"); d.showScrollbar.call(h.children(".mCSB_scrollTools")) }).bind("mouseleave touchend", function (x) { h.removeClass("mCS-mouse-over"); if (x.type === "mouseleave") { d.hideScrollbar.call(h.children(".mCSB_scrollTools")) } }); k.data({ bindEvent_autoHideScrollbar: true }) } } }, scrollTo: function (e, f) { var i = c(this), o = { moveDragger: false, trigger: "external", callbacks: true, scrollInertia: i.data("scrollInertia"), scrollEasing: i.data("scrollEasing") }, f = c.extend(o, f), p, g = i.children(".mCustomScrollBox"), k = g.children(".mCSB_container"), r = g.children(".mCSB_scrollTools"), j = r.children(".mCSB_draggerContainer"), h = j.children(".mCSB_dragger"), t = draggerSpeed = f.scrollInertia, q, s, m, l; if (!k.hasClass("mCS_no_scrollbar")) { i.data({ mCS_trigger: f.trigger }); if (i.data("mCS_Init")) { f.callbacks = false } if (e || e === 0) { if (typeof (e) === "number") { if (f.moveDragger) { p = e; if (i.data("horizontalScroll")) { e = h.position().left * i.data("scrollAmount") } else { e = h.position().top * i.data("scrollAmount") } draggerSpeed = 0 } else { p = e / i.data("scrollAmount") } } else { if (typeof (e) === "string") { var v; if (e === "top") { v = 0 } else { if (e === "bottom" && !i.data("horizontalScroll")) { v = k.outerHeight() - g.height() } else { if (e === "left") { v = 0 } else { if (e === "right" && i.data("horizontalScroll")) { v = k.outerWidth() - g.width() } else { if (e === "first") { v = i.find(".mCSB_container").find(":first") } else { if (e === "last") { v = i.find(".mCSB_container").find(":last") } else { v = i.find(e) } } } } } } if (v.length === 1) { if (i.data("horizontalScroll")) { e = v.position().left } else { e = v.position().top } p = e / i.data("scrollAmount") } else { p = e = v } } } if (i.data("horizontalScroll")) { if (i.data("onTotalScrollBack_Offset")) { s = -i.data("onTotalScrollBack_Offset") } if (i.data("onTotalScroll_Offset")) { l = g.width() - k.outerWidth() + i.data("onTotalScroll_Offset") } if (p < 0) { p = e = 0; clearInterval(i.data("mCSB_buttonScrollLeft")); if (!s) { q = true } } else { if (p >= j.width() - h.width()) { p = j.width() - h.width(); e = g.width() - k.outerWidth(); clearInterval(i.data("mCSB_buttonScrollRight")); if (!l) { m = true } } else { e = -e } } var n = i.data("snapAmount"); if (n) { e = Math.round(e / n) * n - i.data("snapOffset") } d.mTweenAxis.call(this, h[0], "left", Math.round(p), draggerSpeed, f.scrollEasing); d.mTweenAxis.call(this, k[0], "left", Math.round(e), t, f.scrollEasing, { onStart: function () { if (f.callbacks && !i.data("mCS_tweenRunning")) { u("onScrollStart") } if (i.data("autoHideScrollbar")) { d.showScrollbar.call(r) } }, onUpdate: function () { if (f.callbacks) { u("whileScrolling") } }, onComplete: function () { if (f.callbacks) { u("onScroll"); if (q || (s && k.position().left >= s)) { u("onTotalScrollBack") } if (m || (l && k.position().left <= l)) { u("onTotalScroll") } } h.data("preventAction", false); i.data("mCS_tweenRunning", false); if (i.data("autoHideScrollbar")) { if (!g.hasClass("mCS-mouse-over")) { d.hideScrollbar.call(r) } } } }) } else { if (i.data("onTotalScrollBack_Offset")) { s = -i.data("onTotalScrollBack_Offset") } if (i.data("onTotalScroll_Offset")) { l = g.height() - k.outerHeight() + i.data("onTotalScroll_Offset") } if (p < 0) { p = e = 0; clearInterval(i.data("mCSB_buttonScrollUp")); if (!s) { q = true } } else { if (p >= j.height() - h.height()) { p = j.height() - h.height(); e = g.height() - k.outerHeight(); clearInterval(i.data("mCSB_buttonScrollDown")); if (!l) { m = true } } else { e = -e } } var n = i.data("snapAmount"); if (n) { e = Math.round(e / n) * n - i.data("snapOffset") } d.mTweenAxis.call(this, h[0], "top", Math.round(p), draggerSpeed, f.scrollEasing); d.mTweenAxis.call(this, k[0], "top", Math.round(e), t, f.scrollEasing, { onStart: function () { if (f.callbacks && !i.data("mCS_tweenRunning")) { u("onScrollStart") } if (i.data("autoHideScrollbar")) { d.showScrollbar.call(r) } }, onUpdate: function () { if (f.callbacks) { u("whileScrolling") } }, onComplete: function () { if (f.callbacks) { u("onScroll"); if (q || (s && k.position().top >= s)) { u("onTotalScrollBack") } if (m || (l && k.position().top <= l)) { u("onTotalScroll") } } h.data("preventAction", false); i.data("mCS_tweenRunning", false); if (i.data("autoHideScrollbar")) { if (!g.hasClass("mCS-mouse-over")) { d.hideScrollbar.call(r) } } } }) } if (i.data("mCS_Init")) { i.data({ mCS_Init: false }) } } } function u(w) { this.mcs = { top: k.position().top, left: k.position().left, draggerTop: h.position().top, draggerLeft: h.position().left, topPct: Math.round((100 * Math.abs(k.position().top)) / Math.abs(k.outerHeight() - g.height())), leftPct: Math.round((100 * Math.abs(k.position().left)) / Math.abs(k.outerWidth() - g.width())) }; switch (w) { case "onScrollStart": i.data("mCS_tweenRunning", true).data("onScrollStart_Callback").call(i, this.mcs); break; case "whileScrolling": i.data("whileScrolling_Callback").call(i, this.mcs); break; case "onScroll": i.data("onScroll_Callback").call(i, this.mcs); break; case "onTotalScrollBack": i.data("onTotalScrollBack_Callback").call(i, this.mcs); break; case "onTotalScroll": i.data("onTotalScroll_Callback").call(i, this.mcs); break } } }, stop: function () { var g = c(this), e = g.children().children(".mCSB_container"), f = g.children().children().children().children(".mCSB_dragger"); d.mTweenAxisStop.call(this, e[0]); d.mTweenAxisStop.call(this, f[0]) }, disable: function (e) { var j = c(this), f = j.children(".mCustomScrollBox"), h = f.children(".mCSB_container"), g = f.children(".mCSB_scrollTools"), i = g.children().children(".mCSB_dragger"); f.unbind("mousewheel focusin mouseenter mouseleave touchend"); h.unbind("touchstart touchmove"); if (e) { if (j.data("horizontalScroll")) { i.add(h).css("left", 0) } else { i.add(h).css("top", 0) } } g.css("display", "none"); h.addClass("mCS_no_scrollbar"); j.data({ bindEvent_mousewheel: false, bindEvent_focusin: false, bindEvent_content_touch: false, bindEvent_autoHideScrollbar: false }).addClass("mCS_disabled") }, destroy: function () { var e = c(this); e.removeClass("mCustomScrollbar _mCS_" + e.data("mCustomScrollbarIndex")).addClass("mCS_destroyed").children().children(".mCSB_container").unwrap().children().unwrap().siblings(".mCSB_scrollTools").remove(); c(document).unbind("mousemove." + e.data("mCustomScrollbarIndex") + " mouseup." + e.data("mCustomScrollbarIndex") + " MSPointerMove." + e.data("mCustomScrollbarIndex") + " MSPointerUp." + e.data("mCustomScrollbarIndex")); c(window).unbind("resize." + e.data("mCustomScrollbarIndex")) } }, d = { showScrollbar: function () { this.stop().animate({ opacity: 1 }, "fast") }, hideScrollbar: function () { this.stop().animate({ opacity: 0 }, "fast") }, mTweenAxis: function (g, i, h, f, o, y) { var y = y || {}, v = y.onStart || function () { }, p = y.onUpdate || function () { }, w = y.onComplete || function () { }; var n = t(), l, j = 0, r = g.offsetTop, s = g.style; if (i === "left") { r = g.offsetLeft } var m = h - r; q(); e(); function t() { if (window.performance && window.performance.now) { return window.performance.now() } else { if (window.performance && window.performance.webkitNow) { return window.performance.webkitNow() } else { if (Date.now) { return Date.now() } else { return new Date().getTime() } } } } function x() { if (!j) { v.call() } j = t() - n; u(); if (j >= g._time) { g._time = (j > g._time) ? j + l - (j - g._time) : j + l - 1; if (g._time < j + 1) { g._time = j + 1 } } if (g._time < f) { g._id = _request(x) } else { w.call() } } function u() { if (f > 0) { g.currVal = k(g._time, r, m, f, o); s[i] = Math.round(g.currVal) + "px" } else { s[i] = h + "px" } p.call() } function e() { l = 1000 / 60; g._time = j + l; _request = (!window.requestAnimationFrame) ? function (z) { u(); return setTimeout(z, 0.01) } : window.requestAnimationFrame; g._id = _request(x) } function q() { if (g._id == null) { return } if (!window.requestAnimationFrame) { clearTimeout(g._id) } else { window.cancelAnimationFrame(g._id) } g._id = null } function k(B, A, F, E, C) { switch (C) { case "linear": return F * B / E + A; break; case "easeOutQuad": B /= E; return -F * B * (B - 2) + A; break; case "easeInOutQuad": B /= E / 2; if (B < 1) { return F / 2 * B * B + A } B--; return -F / 2 * (B * (B - 2) - 1) + A; break; case "easeOutCubic": B /= E; B--; return F * (B * B * B + 1) + A; break; case "easeOutQuart": B /= E; B--; return -F * (B * B * B * B - 1) + A; break; case "easeOutQuint": B /= E; B--; return F * (B * B * B * B * B + 1) + A; break; case "easeOutCirc": B /= E; B--; return F * Math.sqrt(1 - B * B) + A; break; case "easeOutSine": return F * Math.sin(B / E * (Math.PI / 2)) + A; break; case "easeOutExpo": return F * (-Math.pow(2, -10 * B / E) + 1) + A; break; case "mcsEaseOut": var D = (B /= E) * B, z = D * B; return A + F * (0.499999999999997 * z * D + -2.5 * D * D + 5.5 * z + -6.5 * D + 4 * B); break; case "draggerRailEase": B /= E / 2; if (B < 1) { return F / 2 * B * B * B + A } B -= 2; return F / 2 * (B * B * B + 2) + A; break } } }, mTweenAxisStop: function (e) { if (e._id == null) { return } if (!window.requestAnimationFrame) { clearTimeout(e._id) } else { window.cancelAnimationFrame(e._id) } e._id = null }, rafPolyfill: function () { var f = ["ms", "moz", "webkit", "o"], e = f.length; while (--e > -1 && !window.requestAnimationFrame) { window.requestAnimationFrame = window[f[e] + "RequestAnimationFrame"]; window.cancelAnimationFrame = window[f[e] + "CancelAnimationFrame"] || window[f[e] + "CancelRequestAnimationFrame"] } } }; d.rafPolyfill.call(); c.support.touch = !!("ontouchstart" in window); c.support.msPointer = window.navigator.msPointerEnabled; var a = ("https:" == document.location.protocol) ? "https:" : "http:"; c.event.special.mousewheel || document.write('<script src="' + a + '//cdnjs.cloudflare.com/ajax/libs/jquery-mousewheel/3.0.6/jquery.mousewheel.min.js"><\/script>'); c.fn.mCustomScrollbar = function (e) { if (b[e]) { return b[e].apply(this, Array.prototype.slice.call(arguments, 1)) } else { if (typeof e === "object" || !e) { return b.init.apply(this, arguments) } else { c.error("Method " + e + " does not exist") } } } })(jQuery);// lib/handlebars/base.js
var Handlebars = {};

Handlebars.VERSION = "1.0.beta.6";

Handlebars.helpers  = {};
Handlebars.partials = {};

Handlebars.registerHelper = function(name, fn, inverse) {
  if(inverse) { fn.not = inverse; }
  this.helpers[name] = fn;
};

Handlebars.registerPartial = function(name, str) {
  this.partials[name] = str;
};

Handlebars.registerHelper('helperMissing', function(arg) {
  if(arguments.length === 2) {
    return undefined;
  } else {
    throw new Error("Could not find property '" + arg + "'");
  }
});

var toString = Object.prototype.toString, functionType = "[object Function]";

Handlebars.registerHelper('blockHelperMissing', function(context, options) {
  var inverse = options.inverse || function() {}, fn = options.fn;


  var ret = "";
  var type = toString.call(context);

  if(type === functionType) { context = context.call(this); }

  if(context === true) {
    return fn(this);
  } else if(context === false || context == null) {
    return inverse(this);
  } else if(type === "[object Array]") {
    if(context.length > 0) {
      for(var i=0, j=context.length; i<j; i++) {
        ret = ret + fn(context[i]);
      }
    } else {
      ret = inverse(this);
    }
    return ret;
  } else {
    return fn(context);
  }
});

Handlebars.registerHelper('each', function(context, options) {
  var fn = options.fn, inverse = options.inverse;
  var ret = "";

  if(context && context.length > 0) {
    for(var i=0, j=context.length; i<j; i++) {
      ret = ret + fn(context[i]);
    }
  } else {
    ret = inverse(this);
  }
  return ret;
});

Handlebars.registerHelper('if', function(context, options) {
  var type = toString.call(context);
  if(type === functionType) { context = context.call(this); }

  if(!context || Handlebars.Utils.isEmpty(context)) {
    return options.inverse(this);
  } else {
    return options.fn(this);
  }
});

Handlebars.registerHelper('unless', function(context, options) {
  var fn = options.fn, inverse = options.inverse;
  options.fn = inverse;
  options.inverse = fn;

  return Handlebars.helpers['if'].call(this, context, options);
});

Handlebars.registerHelper('with', function(context, options) {
  return options.fn(context);
});

Handlebars.registerHelper('log', function(context) {
  Handlebars.log(context);
});
;
// lib/handlebars/compiler/parser.js
/* Jison generated parser */
var handlebars = (function(){

var parser = {trace: function trace() { },
yy: {},
symbols_: {"error":2,"root":3,"program":4,"EOF":5,"statements":6,"simpleInverse":7,"statement":8,"openInverse":9,"closeBlock":10,"openBlock":11,"mustache":12,"partial":13,"CONTENT":14,"COMMENT":15,"OPEN_BLOCK":16,"inMustache":17,"CLOSE":18,"OPEN_INVERSE":19,"OPEN_ENDBLOCK":20,"path":21,"OPEN":22,"OPEN_UNESCAPED":23,"OPEN_PARTIAL":24,"params":25,"hash":26,"param":27,"STRING":28,"INTEGER":29,"BOOLEAN":30,"hashSegments":31,"hashSegment":32,"ID":33,"EQUALS":34,"pathSegments":35,"SEP":36,"$accept":0,"$end":1},
terminals_: {2:"error",5:"EOF",14:"CONTENT",15:"COMMENT",16:"OPEN_BLOCK",18:"CLOSE",19:"OPEN_INVERSE",20:"OPEN_ENDBLOCK",22:"OPEN",23:"OPEN_UNESCAPED",24:"OPEN_PARTIAL",28:"STRING",29:"INTEGER",30:"BOOLEAN",33:"ID",34:"EQUALS",36:"SEP"},
productions_: [0,[3,2],[4,3],[4,1],[4,0],[6,1],[6,2],[8,3],[8,3],[8,1],[8,1],[8,1],[8,1],[11,3],[9,3],[10,3],[12,3],[12,3],[13,3],[13,4],[7,2],[17,3],[17,2],[17,2],[17,1],[25,2],[25,1],[27,1],[27,1],[27,1],[27,1],[26,1],[31,2],[31,1],[32,3],[32,3],[32,3],[32,3],[21,1],[35,3],[35,1]],
performAction: function anonymous(yytext,yyleng,yylineno,yy,yystate,$$,_$) {

var $0 = $$.length - 1;
switch (yystate) {
case 1: return $$[$0-1] 
break;
case 2: this.$ = new yy.ProgramNode($$[$0-2], $$[$0]) 
break;
case 3: this.$ = new yy.ProgramNode($$[$0]) 
break;
case 4: this.$ = new yy.ProgramNode([]) 
break;
case 5: this.$ = [$$[$0]] 
break;
case 6: $$[$0-1].push($$[$0]); this.$ = $$[$0-1] 
break;
case 7: this.$ = new yy.InverseNode($$[$0-2], $$[$0-1], $$[$0]) 
break;
case 8: this.$ = new yy.BlockNode($$[$0-2], $$[$0-1], $$[$0]) 
break;
case 9: this.$ = $$[$0] 
break;
case 10: this.$ = $$[$0] 
break;
case 11: this.$ = new yy.ContentNode($$[$0]) 
break;
case 12: this.$ = new yy.CommentNode($$[$0]) 
break;
case 13: this.$ = new yy.MustacheNode($$[$0-1][0], $$[$0-1][1]) 
break;
case 14: this.$ = new yy.MustacheNode($$[$0-1][0], $$[$0-1][1]) 
break;
case 15: this.$ = $$[$0-1] 
break;
case 16: this.$ = new yy.MustacheNode($$[$0-1][0], $$[$0-1][1]) 
break;
case 17: this.$ = new yy.MustacheNode($$[$0-1][0], $$[$0-1][1], true) 
break;
case 18: this.$ = new yy.PartialNode($$[$0-1]) 
break;
case 19: this.$ = new yy.PartialNode($$[$0-2], $$[$0-1]) 
break;
case 20: 
break;
case 21: this.$ = [[$$[$0-2]].concat($$[$0-1]), $$[$0]] 
break;
case 22: this.$ = [[$$[$0-1]].concat($$[$0]), null] 
break;
case 23: this.$ = [[$$[$0-1]], $$[$0]] 
break;
case 24: this.$ = [[$$[$0]], null] 
break;
case 25: $$[$0-1].push($$[$0]); this.$ = $$[$0-1]; 
break;
case 26: this.$ = [$$[$0]] 
break;
case 27: this.$ = $$[$0] 
break;
case 28: this.$ = new yy.StringNode($$[$0]) 
break;
case 29: this.$ = new yy.IntegerNode($$[$0]) 
break;
case 30: this.$ = new yy.BooleanNode($$[$0]) 
break;
case 31: this.$ = new yy.HashNode($$[$0]) 
break;
case 32: $$[$0-1].push($$[$0]); this.$ = $$[$0-1] 
break;
case 33: this.$ = [$$[$0]] 
break;
case 34: this.$ = [$$[$0-2], $$[$0]] 
break;
case 35: this.$ = [$$[$0-2], new yy.StringNode($$[$0])] 
break;
case 36: this.$ = [$$[$0-2], new yy.IntegerNode($$[$0])] 
break;
case 37: this.$ = [$$[$0-2], new yy.BooleanNode($$[$0])] 
break;
case 38: this.$ = new yy.IdNode($$[$0]) 
break;
case 39: $$[$0-2].push($$[$0]); this.$ = $$[$0-2]; 
break;
case 40: this.$ = [$$[$0]] 
break;
}
},
table: [{3:1,4:2,5:[2,4],6:3,8:4,9:5,11:6,12:7,13:8,14:[1,9],15:[1,10],16:[1,12],19:[1,11],22:[1,13],23:[1,14],24:[1,15]},{1:[3]},{5:[1,16]},{5:[2,3],7:17,8:18,9:5,11:6,12:7,13:8,14:[1,9],15:[1,10],16:[1,12],19:[1,19],20:[2,3],22:[1,13],23:[1,14],24:[1,15]},{5:[2,5],14:[2,5],15:[2,5],16:[2,5],19:[2,5],20:[2,5],22:[2,5],23:[2,5],24:[2,5]},{4:20,6:3,8:4,9:5,11:6,12:7,13:8,14:[1,9],15:[1,10],16:[1,12],19:[1,11],20:[2,4],22:[1,13],23:[1,14],24:[1,15]},{4:21,6:3,8:4,9:5,11:6,12:7,13:8,14:[1,9],15:[1,10],16:[1,12],19:[1,11],20:[2,4],22:[1,13],23:[1,14],24:[1,15]},{5:[2,9],14:[2,9],15:[2,9],16:[2,9],19:[2,9],20:[2,9],22:[2,9],23:[2,9],24:[2,9]},{5:[2,10],14:[2,10],15:[2,10],16:[2,10],19:[2,10],20:[2,10],22:[2,10],23:[2,10],24:[2,10]},{5:[2,11],14:[2,11],15:[2,11],16:[2,11],19:[2,11],20:[2,11],22:[2,11],23:[2,11],24:[2,11]},{5:[2,12],14:[2,12],15:[2,12],16:[2,12],19:[2,12],20:[2,12],22:[2,12],23:[2,12],24:[2,12]},{17:22,21:23,33:[1,25],35:24},{17:26,21:23,33:[1,25],35:24},{17:27,21:23,33:[1,25],35:24},{17:28,21:23,33:[1,25],35:24},{21:29,33:[1,25],35:24},{1:[2,1]},{6:30,8:4,9:5,11:6,12:7,13:8,14:[1,9],15:[1,10],16:[1,12],19:[1,11],22:[1,13],23:[1,14],24:[1,15]},{5:[2,6],14:[2,6],15:[2,6],16:[2,6],19:[2,6],20:[2,6],22:[2,6],23:[2,6],24:[2,6]},{17:22,18:[1,31],21:23,33:[1,25],35:24},{10:32,20:[1,33]},{10:34,20:[1,33]},{18:[1,35]},{18:[2,24],21:40,25:36,26:37,27:38,28:[1,41],29:[1,42],30:[1,43],31:39,32:44,33:[1,45],35:24},{18:[2,38],28:[2,38],29:[2,38],30:[2,38],33:[2,38],36:[1,46]},{18:[2,40],28:[2,40],29:[2,40],30:[2,40],33:[2,40],36:[2,40]},{18:[1,47]},{18:[1,48]},{18:[1,49]},{18:[1,50],21:51,33:[1,25],35:24},{5:[2,2],8:18,9:5,11:6,12:7,13:8,14:[1,9],15:[1,10],16:[1,12],19:[1,11],20:[2,2],22:[1,13],23:[1,14],24:[1,15]},{14:[2,20],15:[2,20],16:[2,20],19:[2,20],22:[2,20],23:[2,20],24:[2,20]},{5:[2,7],14:[2,7],15:[2,7],16:[2,7],19:[2,7],20:[2,7],22:[2,7],23:[2,7],24:[2,7]},{21:52,33:[1,25],35:24},{5:[2,8],14:[2,8],15:[2,8],16:[2,8],19:[2,8],20:[2,8],22:[2,8],23:[2,8],24:[2,8]},{14:[2,14],15:[2,14],16:[2,14],19:[2,14],20:[2,14],22:[2,14],23:[2,14],24:[2,14]},{18:[2,22],21:40,26:53,27:54,28:[1,41],29:[1,42],30:[1,43],31:39,32:44,33:[1,45],35:24},{18:[2,23]},{18:[2,26],28:[2,26],29:[2,26],30:[2,26],33:[2,26]},{18:[2,31],32:55,33:[1,56]},{18:[2,27],28:[2,27],29:[2,27],30:[2,27],33:[2,27]},{18:[2,28],28:[2,28],29:[2,28],30:[2,28],33:[2,28]},{18:[2,29],28:[2,29],29:[2,29],30:[2,29],33:[2,29]},{18:[2,30],28:[2,30],29:[2,30],30:[2,30],33:[2,30]},{18:[2,33],33:[2,33]},{18:[2,40],28:[2,40],29:[2,40],30:[2,40],33:[2,40],34:[1,57],36:[2,40]},{33:[1,58]},{14:[2,13],15:[2,13],16:[2,13],19:[2,13],20:[2,13],22:[2,13],23:[2,13],24:[2,13]},{5:[2,16],14:[2,16],15:[2,16],16:[2,16],19:[2,16],20:[2,16],22:[2,16],23:[2,16],24:[2,16]},{5:[2,17],14:[2,17],15:[2,17],16:[2,17],19:[2,17],20:[2,17],22:[2,17],23:[2,17],24:[2,17]},{5:[2,18],14:[2,18],15:[2,18],16:[2,18],19:[2,18],20:[2,18],22:[2,18],23:[2,18],24:[2,18]},{18:[1,59]},{18:[1,60]},{18:[2,21]},{18:[2,25],28:[2,25],29:[2,25],30:[2,25],33:[2,25]},{18:[2,32],33:[2,32]},{34:[1,57]},{21:61,28:[1,62],29:[1,63],30:[1,64],33:[1,25],35:24},{18:[2,39],28:[2,39],29:[2,39],30:[2,39],33:[2,39],36:[2,39]},{5:[2,19],14:[2,19],15:[2,19],16:[2,19],19:[2,19],20:[2,19],22:[2,19],23:[2,19],24:[2,19]},{5:[2,15],14:[2,15],15:[2,15],16:[2,15],19:[2,15],20:[2,15],22:[2,15],23:[2,15],24:[2,15]},{18:[2,34],33:[2,34]},{18:[2,35],33:[2,35]},{18:[2,36],33:[2,36]},{18:[2,37],33:[2,37]}],
defaultActions: {16:[2,1],37:[2,23],53:[2,21]},
parseError: function parseError(str, hash) {
    throw new Error(str);
},
parse: function parse(input) {
    var self = this, stack = [0], vstack = [null], lstack = [], table = this.table, yytext = "", yylineno = 0, yyleng = 0, recovering = 0, TERROR = 2, EOF = 1;
    this.lexer.setInput(input);
    this.lexer.yy = this.yy;
    this.yy.lexer = this.lexer;
    if (typeof this.lexer.yylloc == "undefined")
        this.lexer.yylloc = {};
    var yyloc = this.lexer.yylloc;
    lstack.push(yyloc);
    if (typeof this.yy.parseError === "function")
        this.parseError = this.yy.parseError;
    function popStack(n) {
        stack.length = stack.length - 2 * n;
        vstack.length = vstack.length - n;
        lstack.length = lstack.length - n;
    }
    function lex() {
        var token;
        token = self.lexer.lex() || 1;
        if (typeof token !== "number") {
            token = self.symbols_[token] || token;
        }
        return token;
    }
    var symbol, preErrorSymbol, state, action, a, r, yyval = {}, p, len, newState, expected;
    while (true) {
        state = stack[stack.length - 1];
        if (this.defaultActions[state]) {
            action = this.defaultActions[state];
        } else {
            if (symbol == null)
                symbol = lex();
            action = table[state] && table[state][symbol];
        }
        if (typeof action === "undefined" || !action.length || !action[0]) {
            if (!recovering) {
                expected = [];
                for (p in table[state])
                    if (this.terminals_[p] && p > 2) {
                        expected.push("'" + this.terminals_[p] + "'");
                    }
                var errStr = "";
                if (this.lexer.showPosition) {
                    errStr = "Parse error on line " + (yylineno + 1) + ":\n" + this.lexer.showPosition() + "\nExpecting " + expected.join(", ") + ", got '" + this.terminals_[symbol] + "'";
                } else {
                    errStr = "Parse error on line " + (yylineno + 1) + ": Unexpected " + (symbol == 1?"end of input":"'" + (this.terminals_[symbol] || symbol) + "'");
                }
                this.parseError(errStr, {text: this.lexer.match, token: this.terminals_[symbol] || symbol, line: this.lexer.yylineno, loc: yyloc, expected: expected});
            }
        }
        if (action[0] instanceof Array && action.length > 1) {
            throw new Error("Parse Error: multiple actions possible at state: " + state + ", token: " + symbol);
        }
        switch (action[0]) {
        case 1:
            stack.push(symbol);
            vstack.push(this.lexer.yytext);
            lstack.push(this.lexer.yylloc);
            stack.push(action[1]);
            symbol = null;
            if (!preErrorSymbol) {
                yyleng = this.lexer.yyleng;
                yytext = this.lexer.yytext;
                yylineno = this.lexer.yylineno;
                yyloc = this.lexer.yylloc;
                if (recovering > 0)
                    recovering--;
            } else {
                symbol = preErrorSymbol;
                preErrorSymbol = null;
            }
            break;
        case 2:
            len = this.productions_[action[1]][1];
            yyval.$ = vstack[vstack.length - len];
            yyval._$ = {first_line: lstack[lstack.length - (len || 1)].first_line, last_line: lstack[lstack.length - 1].last_line, first_column: lstack[lstack.length - (len || 1)].first_column, last_column: lstack[lstack.length - 1].last_column};
            r = this.performAction.call(yyval, yytext, yyleng, yylineno, this.yy, action[1], vstack, lstack);
            if (typeof r !== "undefined") {
                return r;
            }
            if (len) {
                stack = stack.slice(0, -1 * len * 2);
                vstack = vstack.slice(0, -1 * len);
                lstack = lstack.slice(0, -1 * len);
            }
            stack.push(this.productions_[action[1]][0]);
            vstack.push(yyval.$);
            lstack.push(yyval._$);
            newState = table[stack[stack.length - 2]][stack[stack.length - 1]];
            stack.push(newState);
            break;
        case 3:
            return true;
        }
    }
    return true;
}
};/* Jison generated lexer */
var lexer = (function(){

var lexer = ({EOF:1,
parseError:function parseError(str, hash) {
        if (this.yy.parseError) {
            this.yy.parseError(str, hash);
        } else {
            throw new Error(str);
        }
    },
setInput:function (input) {
        this._input = input;
        this._more = this._less = this.done = false;
        this.yylineno = this.yyleng = 0;
        this.yytext = this.matched = this.match = '';
        this.conditionStack = ['INITIAL'];
        this.yylloc = {first_line:1,first_column:0,last_line:1,last_column:0};
        return this;
    },
input:function () {
        var ch = this._input[0];
        this.yytext+=ch;
        this.yyleng++;
        this.match+=ch;
        this.matched+=ch;
        var lines = ch.match(/\n/);
        if (lines) this.yylineno++;
        this._input = this._input.slice(1);
        return ch;
    },
unput:function (ch) {
        this._input = ch + this._input;
        return this;
    },
more:function () {
        this._more = true;
        return this;
    },
pastInput:function () {
        var past = this.matched.substr(0, this.matched.length - this.match.length);
        return (past.length > 20 ? '...':'') + past.substr(-20).replace(/\n/g, "");
    },
upcomingInput:function () {
        var next = this.match;
        if (next.length < 20) {
            next += this._input.substr(0, 20-next.length);
        }
        return (next.substr(0,20)+(next.length > 20 ? '...':'')).replace(/\n/g, "");
    },
showPosition:function () {
        var pre = this.pastInput();
        var c = new Array(pre.length + 1).join("-");
        return pre + this.upcomingInput() + "\n" + c+"^";
    },
next:function () {
        if (this.done) {
            return this.EOF;
        }
        if (!this._input) this.done = true;

        var token,
            match,
            col,
            lines;
        if (!this._more) {
            this.yytext = '';
            this.match = '';
        }
        var rules = this._currentRules();
        for (var i=0;i < rules.length; i++) {
            match = this._input.match(this.rules[rules[i]]);
            if (match) {
                lines = match[0].match(/\n.*/g);
                if (lines) this.yylineno += lines.length;
                this.yylloc = {first_line: this.yylloc.last_line,
                               last_line: this.yylineno+1,
                               first_column: this.yylloc.last_column,
                               last_column: lines ? lines[lines.length-1].length-1 : this.yylloc.last_column + match[0].length}
                this.yytext += match[0];
                this.match += match[0];
                this.matches = match;
                this.yyleng = this.yytext.length;
                this._more = false;
                this._input = this._input.slice(match[0].length);
                this.matched += match[0];
                token = this.performAction.call(this, this.yy, this, rules[i],this.conditionStack[this.conditionStack.length-1]);
                if (token) return token;
                else return;
            }
        }
        if (this._input === "") {
            return this.EOF;
        } else {
            this.parseError('Lexical error on line '+(this.yylineno+1)+'. Unrecognized text.\n'+this.showPosition(), 
                    {text: "", token: null, line: this.yylineno});
        }
    },
lex:function lex() {
        var r = this.next();
        if (typeof r !== 'undefined') {
            return r;
        } else {
            return this.lex();
        }
    },
begin:function begin(condition) {
        this.conditionStack.push(condition);
    },
popState:function popState() {
        return this.conditionStack.pop();
    },
_currentRules:function _currentRules() {
        return this.conditions[this.conditionStack[this.conditionStack.length-1]].rules;
    },
topState:function () {
        return this.conditionStack[this.conditionStack.length-2];
    },
pushState:function begin(condition) {
        this.begin(condition);
    }});
lexer.performAction = function anonymous(yy,yy_,$avoiding_name_collisions,YY_START) {

var YYSTATE=YY_START
switch($avoiding_name_collisions) {
case 0:
                                   if(yy_.yytext.slice(-1) !== "\\") this.begin("mu");
                                   if(yy_.yytext.slice(-1) === "\\") yy_.yytext = yy_.yytext.substr(0,yy_.yyleng-1), this.begin("emu");
                                   if(yy_.yytext) return 14;
                                 
break;
case 1: return 14; 
break;
case 2: this.popState(); return 14; 
break;
case 3: return 24; 
break;
case 4: return 16; 
break;
case 5: return 20; 
break;
case 6: return 19; 
break;
case 7: return 19; 
break;
case 8: return 23; 
break;
case 9: return 23; 
break;
case 10: yy_.yytext = yy_.yytext.substr(3,yy_.yyleng-5); this.popState(); return 15; 
break;
case 11: return 22; 
break;
case 12: return 34; 
break;
case 13: return 33; 
break;
case 14: return 33; 
break;
case 15: return 36; 
break;
case 16: /*ignore whitespace*/ 
break;
case 17: this.popState(); return 18; 
break;
case 18: this.popState(); return 18; 
break;
case 19: yy_.yytext = yy_.yytext.substr(1,yy_.yyleng-2).replace(/\\"/g,'"'); return 28; 
break;
case 20: return 30; 
break;
case 21: return 30; 
break;
case 22: return 29; 
break;
case 23: return 33; 
break;
case 24: yy_.yytext = yy_.yytext.substr(1, yy_.yyleng-2); return 33; 
break;
case 25: return 'INVALID'; 
break;
case 26: return 5; 
break;
}
};
lexer.rules = [/^[^\x00]*?(?=(\{\{))/,/^[^\x00]+/,/^[^\x00]{2,}?(?=(\{\{))/,/^\{\{>/,/^\{\{#/,/^\{\{\//,/^\{\{\^/,/^\{\{\s*else\b/,/^\{\{\{/,/^\{\{&/,/^\{\{![\s\S]*?\}\}/,/^\{\{/,/^=/,/^\.(?=[} ])/,/^\.\./,/^[\/.]/,/^\s+/,/^\}\}\}/,/^\}\}/,/^"(\\["]|[^"])*"/,/^true(?=[}\s])/,/^false(?=[}\s])/,/^[0-9]+(?=[}\s])/,/^[a-zA-Z0-9_$-]+(?=[=}\s\/.])/,/^\[[^\]]*\]/,/^./,/^$/];
lexer.conditions = {"mu":{"rules":[3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26],"inclusive":false},"emu":{"rules":[2],"inclusive":false},"INITIAL":{"rules":[0,1,26],"inclusive":true}};return lexer;})()
parser.lexer = lexer;
return parser;
})();
if (typeof require !== 'undefined' && typeof exports !== 'undefined') {
exports.parser = handlebars;
exports.parse = function () { return handlebars.parse.apply(handlebars, arguments); }
exports.main = function commonjsMain(args) {
    if (!args[1])
        throw new Error('Usage: '+args[0]+' FILE');
    if (typeof process !== 'undefined') {
        var source = require('fs').readFileSync(require('path').join(process.cwd(), args[1]), "utf8");
    } else {
        var cwd = require("file").path(require("file").cwd());
        var source = cwd.join(args[1]).read({charset: "utf-8"});
    }
    return exports.parser.parse(source);
}
if (typeof module !== 'undefined' && require.main === module) {
  exports.main(typeof process !== 'undefined' ? process.argv.slice(1) : require("system").args);
}
};
;
// lib/handlebars/compiler/base.js
Handlebars.Parser = handlebars;

Handlebars.parse = function(string) {
  Handlebars.Parser.yy = Handlebars.AST;
  return Handlebars.Parser.parse(string);
};

Handlebars.print = function(ast) {
  return new Handlebars.PrintVisitor().accept(ast);
};

Handlebars.logger = {
  DEBUG: 0, INFO: 1, WARN: 2, ERROR: 3, level: 3,

  // override in the host environment
  log: function(level, str) {}
};

Handlebars.log = function(level, str) { Handlebars.logger.log(level, str); };
;
// lib/handlebars/compiler/ast.js
(function() {

  Handlebars.AST = {};

  Handlebars.AST.ProgramNode = function(statements, inverse) {
    this.type = "program";
    this.statements = statements;
    if(inverse) { this.inverse = new Handlebars.AST.ProgramNode(inverse); }
  };

  Handlebars.AST.MustacheNode = function(params, hash, unescaped) {
    this.type = "mustache";
    this.id = params[0];
    this.params = params.slice(1);
    this.hash = hash;
    this.escaped = !unescaped;
  };

  Handlebars.AST.PartialNode = function(id, context) {
    this.type    = "partial";

    // TODO: disallow complex IDs

    this.id      = id;
    this.context = context;
  };

  var verifyMatch = function(open, close) {
    if(open.original !== close.original) {
      throw new Handlebars.Exception(open.original + " doesn't match " + close.original);
    }
  };

  Handlebars.AST.BlockNode = function(mustache, program, close) {
    verifyMatch(mustache.id, close);
    this.type = "block";
    this.mustache = mustache;
    this.program  = program;
  };

  Handlebars.AST.InverseNode = function(mustache, program, close) {
    verifyMatch(mustache.id, close);
    this.type = "inverse";
    this.mustache = mustache;
    this.program  = program;
  };

  Handlebars.AST.ContentNode = function(string) {
    this.type = "content";
    this.string = string;
  };

  Handlebars.AST.HashNode = function(pairs) {
    this.type = "hash";
    this.pairs = pairs;
  };

  Handlebars.AST.IdNode = function(parts) {
    this.type = "ID";
    this.original = parts.join(".");

    var dig = [], depth = 0;

    for(var i=0,l=parts.length; i<l; i++) {
      var part = parts[i];

      if(part === "..") { depth++; }
      else if(part === "." || part === "this") { this.isScoped = true; }
      else { dig.push(part); }
    }

    this.parts    = dig;
    this.string   = dig.join('.');
    this.depth    = depth;
    this.isSimple = (dig.length === 1) && (depth === 0);
  };

  Handlebars.AST.StringNode = function(string) {
    this.type = "STRING";
    this.string = string;
  };

  Handlebars.AST.IntegerNode = function(integer) {
    this.type = "INTEGER";
    this.integer = integer;
  };

  Handlebars.AST.BooleanNode = function(bool) {
    this.type = "BOOLEAN";
    this.bool = bool;
  };

  Handlebars.AST.CommentNode = function(comment) {
    this.type = "comment";
    this.comment = comment;
  };

})();;
// lib/handlebars/utils.js
Handlebars.Exception = function(message) {
  var tmp = Error.prototype.constructor.apply(this, arguments);

  for (var p in tmp) {
    if (tmp.hasOwnProperty(p)) { this[p] = tmp[p]; }
  }

  this.message = tmp.message;
};
Handlebars.Exception.prototype = new Error;

// Build out our basic SafeString type
Handlebars.SafeString = function(string) {
  this.string = string;
};
Handlebars.SafeString.prototype.toString = function() {
  return this.string.toString();
};

(function() {
  var escape = {
    "<": "&lt;",
    ">": "&gt;",
    '"': "&quot;",
    "'": "&#x27;",
    "`": "&#x60;"
  };

  var badChars = /&(?!\w+;)|[<>"'`]/g;
  var possible = /[&<>"'`]/;

  var escapeChar = function(chr) {
    return escape[chr] || "&amp;";
  };

  Handlebars.Utils = {
    escapeExpression: function(string) {
      // don't escape SafeStrings, since they're already safe
      if (string instanceof Handlebars.SafeString) {
        return string.toString();
      } else if (string == null || string === false) {
        return "";
      }

      if(!possible.test(string)) { return string; }
      return string.replace(badChars, escapeChar);
    },

    isEmpty: function(value) {
      if (typeof value === "undefined") {
        return true;
      } else if (value === null) {
        return true;
      } else if (value === false) {
        return true;
      } else if(Object.prototype.toString.call(value) === "[object Array]" && value.length === 0) {
        return true;
      } else {
        return false;
      }
    }
  };
})();;
// lib/handlebars/compiler/compiler.js
Handlebars.Compiler = function() {};
Handlebars.JavaScriptCompiler = function() {};

(function(Compiler, JavaScriptCompiler) {
  Compiler.OPCODE_MAP = {
    appendContent: 1,
    getContext: 2,
    lookupWithHelpers: 3,
    lookup: 4,
    append: 5,
    invokeMustache: 6,
    appendEscaped: 7,
    pushString: 8,
    truthyOrFallback: 9,
    functionOrFallback: 10,
    invokeProgram: 11,
    invokePartial: 12,
    push: 13,
    assignToHash: 15,
    pushStringParam: 16
  };

  Compiler.MULTI_PARAM_OPCODES = {
    appendContent: 1,
    getContext: 1,
    lookupWithHelpers: 2,
    lookup: 1,
    invokeMustache: 3,
    pushString: 1,
    truthyOrFallback: 1,
    functionOrFallback: 1,
    invokeProgram: 3,
    invokePartial: 1,
    push: 1,
    assignToHash: 1,
    pushStringParam: 1
  };

  Compiler.DISASSEMBLE_MAP = {};

  for(var prop in Compiler.OPCODE_MAP) {
    var value = Compiler.OPCODE_MAP[prop];
    Compiler.DISASSEMBLE_MAP[value] = prop;
  }

  Compiler.multiParamSize = function(code) {
    return Compiler.MULTI_PARAM_OPCODES[Compiler.DISASSEMBLE_MAP[code]];
  };

  Compiler.prototype = {
    compiler: Compiler,

    disassemble: function() {
      var opcodes = this.opcodes, opcode, nextCode;
      var out = [], str, name, value;

      for(var i=0, l=opcodes.length; i<l; i++) {
        opcode = opcodes[i];

        if(opcode === 'DECLARE') {
          name = opcodes[++i];
          value = opcodes[++i];
          out.push("DECLARE " + name + " = " + value);
        } else {
          str = Compiler.DISASSEMBLE_MAP[opcode];

          var extraParams = Compiler.multiParamSize(opcode);
          var codes = [];

          for(var j=0; j<extraParams; j++) {
            nextCode = opcodes[++i];

            if(typeof nextCode === "string") {
              nextCode = "\"" + nextCode.replace("\n", "\\n") + "\"";
            }

            codes.push(nextCode);
          }

          str = str + " " + codes.join(" ");

          out.push(str);
        }
      }

      return out.join("\n");
    },

    guid: 0,

    compile: function(program, options) {
      this.children = [];
      this.depths = {list: []};
      this.options = options;

      // These changes will propagate to the other compiler components
      var knownHelpers = this.options.knownHelpers;
      this.options.knownHelpers = {
        'helperMissing': true,
        'blockHelperMissing': true,
        'each': true,
        'if': true,
        'unless': true,
        'with': true,
        'log': true
      };
      if (knownHelpers) {
        for (var name in knownHelpers) {
          this.options.knownHelpers[name] = knownHelpers[name];
        }
      }

      return this.program(program);
    },

    accept: function(node) {
      return this[node.type](node);
    },

    program: function(program) {
      var statements = program.statements, statement;
      this.opcodes = [];

      for(var i=0, l=statements.length; i<l; i++) {
        statement = statements[i];
        this[statement.type](statement);
      }
      this.isSimple = l === 1;

      this.depths.list = this.depths.list.sort(function(a, b) {
        return a - b;
      });

      return this;
    },

    compileProgram: function(program) {
      var result = new this.compiler().compile(program, this.options);
      var guid = this.guid++;

      this.usePartial = this.usePartial || result.usePartial;

      this.children[guid] = result;

      for(var i=0, l=result.depths.list.length; i<l; i++) {
        depth = result.depths.list[i];

        if(depth < 2) { continue; }
        else { this.addDepth(depth - 1); }
      }

      return guid;
    },

    block: function(block) {
      var mustache = block.mustache;
      var depth, child, inverse, inverseGuid;

      var params = this.setupStackForMustache(mustache);

      var programGuid = this.compileProgram(block.program);

      if(block.program.inverse) {
        inverseGuid = this.compileProgram(block.program.inverse);
        this.declare('inverse', inverseGuid);
      }

      this.opcode('invokeProgram', programGuid, params.length, !!mustache.hash);
      this.declare('inverse', null);
      this.opcode('append');
    },

    inverse: function(block) {
      var params = this.setupStackForMustache(block.mustache);

      var programGuid = this.compileProgram(block.program);

      this.declare('inverse', programGuid);

      this.opcode('invokeProgram', null, params.length, !!block.mustache.hash);
      this.declare('inverse', null);
      this.opcode('append');
    },

    hash: function(hash) {
      var pairs = hash.pairs, pair, val;

      this.opcode('push', '{}');

      for(var i=0, l=pairs.length; i<l; i++) {
        pair = pairs[i];
        val  = pair[1];

        this.accept(val);
        this.opcode('assignToHash', pair[0]);
      }
    },

    partial: function(partial) {
      var id = partial.id;
      this.usePartial = true;

      if(partial.context) {
        this.ID(partial.context);
      } else {
        this.opcode('push', 'depth0');
      }

      this.opcode('invokePartial', id.original);
      this.opcode('append');
    },

    content: function(content) {
      this.opcode('appendContent', content.string);
    },

    mustache: function(mustache) {
      var params = this.setupStackForMustache(mustache);

      this.opcode('invokeMustache', params.length, mustache.id.original, !!mustache.hash);

      if(mustache.escaped && !this.options.noEscape) {
        this.opcode('appendEscaped');
      } else {
        this.opcode('append');
      }
    },

    ID: function(id) {
      this.addDepth(id.depth);

      this.opcode('getContext', id.depth);

      this.opcode('lookupWithHelpers', id.parts[0] || null, id.isScoped || false);

      for(var i=1, l=id.parts.length; i<l; i++) {
        this.opcode('lookup', id.parts[i]);
      }
    },

    STRING: function(string) {
      this.opcode('pushString', string.string);
    },

    INTEGER: function(integer) {
      this.opcode('push', integer.integer);
    },

    BOOLEAN: function(bool) {
      this.opcode('push', bool.bool);
    },

    comment: function() {},

    // HELPERS
    pushParams: function(params) {
      var i = params.length, param;

      while(i--) {
        param = params[i];

        if(this.options.stringParams) {
          if(param.depth) {
            this.addDepth(param.depth);
          }

          this.opcode('getContext', param.depth || 0);
          this.opcode('pushStringParam', param.string);
        } else {
          this[param.type](param);
        }
      }
    },

    opcode: function(name, val1, val2, val3) {
      this.opcodes.push(Compiler.OPCODE_MAP[name]);
      if(val1 !== undefined) { this.opcodes.push(val1); }
      if(val2 !== undefined) { this.opcodes.push(val2); }
      if(val3 !== undefined) { this.opcodes.push(val3); }
    },

    declare: function(name, value) {
      this.opcodes.push('DECLARE');
      this.opcodes.push(name);
      this.opcodes.push(value);
    },

    addDepth: function(depth) {
      if(depth === 0) { return; }

      if(!this.depths[depth]) {
        this.depths[depth] = true;
        this.depths.list.push(depth);
      }
    },

    setupStackForMustache: function(mustache) {
      var params = mustache.params;

      this.pushParams(params);

      if(mustache.hash) {
        this.hash(mustache.hash);
      }

      this.ID(mustache.id);

      return params;
    }
  };

  JavaScriptCompiler.prototype = {
    // PUBLIC API: You can override these methods in a subclass to provide
    // alternative compiled forms for name lookup and buffering semantics
    nameLookup: function(parent, name, type) {
			if (/^[0-9]+$/.test(name)) {
        return parent + "[" + name + "]";
      } else if (JavaScriptCompiler.isValidJavaScriptVariableName(name)) {
	    	return parent + "." + name;
			}
			else {
				return parent + "['" + name + "']";
      }
    },

    appendToBuffer: function(string) {
      if (this.environment.isSimple) {
        return "return " + string + ";";
      } else {
        return "buffer += " + string + ";";
      }
    },

    initializeBuffer: function() {
      return this.quotedString("");
    },

    namespace: "Handlebars",
    // END PUBLIC API

    compile: function(environment, options, context, asObject) {
      this.environment = environment;
      this.options = options || {};

      this.name = this.environment.name;
      this.isChild = !!context;
      this.context = context || {
        programs: [],
        aliases: { self: 'this' },
        registers: {list: []}
      };

      this.preamble();

      this.stackSlot = 0;
      this.stackVars = [];

      this.compileChildren(environment, options);

      var opcodes = environment.opcodes, opcode;

      this.i = 0;

      for(l=opcodes.length; this.i<l; this.i++) {
        opcode = this.nextOpcode(0);

        if(opcode[0] === 'DECLARE') {
          this.i = this.i + 2;
          this[opcode[1]] = opcode[2];
        } else {
          this.i = this.i + opcode[1].length;
          this[opcode[0]].apply(this, opcode[1]);
        }
      }

      return this.createFunctionContext(asObject);
    },

    nextOpcode: function(n) {
      var opcodes = this.environment.opcodes, opcode = opcodes[this.i + n], name, val;
      var extraParams, codes;

      if(opcode === 'DECLARE') {
        name = opcodes[this.i + 1];
        val  = opcodes[this.i + 2];
        return ['DECLARE', name, val];
      } else {
        name = Compiler.DISASSEMBLE_MAP[opcode];

        extraParams = Compiler.multiParamSize(opcode);
        codes = [];

        for(var j=0; j<extraParams; j++) {
          codes.push(opcodes[this.i + j + 1 + n]);
        }

        return [name, codes];
      }
    },

    eat: function(opcode) {
      this.i = this.i + opcode.length;
    },

    preamble: function() {
      var out = [];

      // this register will disambiguate helper lookup from finding a function in
      // a context. This is necessary for mustache compatibility, which requires
      // that context functions in blocks are evaluated by blockHelperMissing, and
      // then proceed as if the resulting value was provided to blockHelperMissing.
      this.useRegister('foundHelper');

      if (!this.isChild) {
        var namespace = this.namespace;
        var copies = "helpers = helpers || " + namespace + ".helpers;";
        if(this.environment.usePartial) { copies = copies + " partials = partials || " + namespace + ".partials;"; }
        out.push(copies);
      } else {
        out.push('');
      }

      if (!this.environment.isSimple) {
        out.push(", buffer = " + this.initializeBuffer());
      } else {
        out.push("");
      }

      // track the last context pushed into place to allow skipping the
      // getContext opcode when it would be a noop
      this.lastContext = 0;
      this.source = out;
    },

    createFunctionContext: function(asObject) {
      var locals = this.stackVars;
      if (!this.isChild) {
        locals = locals.concat(this.context.registers.list);
      }

      if(locals.length > 0) {
        this.source[1] = this.source[1] + ", " + locals.join(", ");
      }

      // Generate minimizer alias mappings
      if (!this.isChild) {
        var aliases = []
        for (var alias in this.context.aliases) {
          this.source[1] = this.source[1] + ', ' + alias + '=' + this.context.aliases[alias];
        }
      }

      if (this.source[1]) {
        this.source[1] = "var " + this.source[1].substring(2) + ";";
      }

      // Merge children
      if (!this.isChild) {
        this.source[1] += '\n' + this.context.programs.join('\n') + '\n';
      }

      if (!this.environment.isSimple) {
        this.source.push("return buffer;");
      }

      var params = this.isChild ? ["depth0", "data"] : ["Handlebars", "depth0", "helpers", "partials", "data"];

      for(var i=0, l=this.environment.depths.list.length; i<l; i++) {
        params.push("depth" + this.environment.depths.list[i]);
      }

      if (asObject) {
        params.push(this.source.join("\n  "));

        return Function.apply(this, params);
      } else {
        var functionSource = 'function ' + (this.name || '') + '(' + params.join(',') + ') {\n  ' + this.source.join("\n  ") + '}';
        Handlebars.log(Handlebars.logger.DEBUG, functionSource + "\n\n");
        return functionSource;
      }
    },

    appendContent: function(content) {
      this.source.push(this.appendToBuffer(this.quotedString(content)));
    },

    append: function() {
      var local = this.popStack();
      this.source.push("if(" + local + " || " + local + " === 0) { " + this.appendToBuffer(local) + " }");
      if (this.environment.isSimple) {
        this.source.push("else { " + this.appendToBuffer("''") + " }");
      }
    },

    appendEscaped: function() {
      var opcode = this.nextOpcode(1), extra = "";
      this.context.aliases.escapeExpression = 'this.escapeExpression';

      if(opcode[0] === 'appendContent') {
        extra = " + " + this.quotedString(opcode[1][0]);
        this.eat(opcode);
      }

      this.source.push(this.appendToBuffer("escapeExpression(" + this.popStack() + ")" + extra));
    },

    getContext: function(depth) {
      if(this.lastContext !== depth) {
        this.lastContext = depth;
      }
    },

    lookupWithHelpers: function(name, isScoped) {
      if(name) {
        var topStack = this.nextStack();

        this.usingKnownHelper = false;

        var toPush;
        if (!isScoped && this.options.knownHelpers[name]) {
          toPush = topStack + " = " + this.nameLookup('helpers', name, 'helper');
          this.usingKnownHelper = true;
        } else if (isScoped || this.options.knownHelpersOnly) {
          toPush = topStack + " = " + this.nameLookup('depth' + this.lastContext, name, 'context');
        } else {
          this.register('foundHelper', this.nameLookup('helpers', name, 'helper'));
          toPush = topStack + " = foundHelper || " + this.nameLookup('depth' + this.lastContext, name, 'context');
        }

        toPush += ';';
        this.source.push(toPush);
      } else {
        this.pushStack('depth' + this.lastContext);
      }
    },

    lookup: function(name) {
      var topStack = this.topStack();
      this.source.push(topStack + " = (" + topStack + " === null || " + topStack + " === undefined || " + topStack + " === false ? " +
 				topStack + " : " + this.nameLookup(topStack, name, 'context') + ");");
    },

    pushStringParam: function(string) {
      this.pushStack('depth' + this.lastContext);
      this.pushString(string);
    },

    pushString: function(string) {
      this.pushStack(this.quotedString(string));
    },

    push: function(name) {
      this.pushStack(name);
    },

    invokeMustache: function(paramSize, original, hasHash) {
      this.populateParams(paramSize, this.quotedString(original), "{}", null, hasHash, function(nextStack, helperMissingString, id) {
        if (!this.usingKnownHelper) {
          this.context.aliases.helperMissing = 'helpers.helperMissing';
          this.context.aliases.undef = 'void 0';
          this.source.push("else if(" + id + "=== undef) { " + nextStack + " = helperMissing.call(" + helperMissingString + "); }");
          if (nextStack !== id) {
            this.source.push("else { " + nextStack + " = " + id + "; }");
          }
        }
      });
    },

    invokeProgram: function(guid, paramSize, hasHash) {
      var inverse = this.programExpression(this.inverse);
      var mainProgram = this.programExpression(guid);

      this.populateParams(paramSize, null, mainProgram, inverse, hasHash, function(nextStack, helperMissingString, id) {
        if (!this.usingKnownHelper) {
          this.context.aliases.blockHelperMissing = 'helpers.blockHelperMissing';
          this.source.push("else { " + nextStack + " = blockHelperMissing.call(" + helperMissingString + "); }");
        }
      });
    },

    populateParams: function(paramSize, helperId, program, inverse, hasHash, fn) {
      var needsRegister = hasHash || this.options.stringParams || inverse || this.options.data;
      var id = this.popStack(), nextStack;
      var params = [], param, stringParam, stringOptions;

      if (needsRegister) {
        this.register('tmp1', program);
        stringOptions = 'tmp1';
      } else {
        stringOptions = '{ hash: {} }';
      }

      if (needsRegister) {
        var hash = (hasHash ? this.popStack() : '{}');
        this.source.push('tmp1.hash = ' + hash + ';');
      }

      if(this.options.stringParams) {
        this.source.push('tmp1.contexts = [];');
      }

      for(var i=0; i<paramSize; i++) {
        param = this.popStack();
        params.push(param);

        if(this.options.stringParams) {
          this.source.push('tmp1.contexts.push(' + this.popStack() + ');');
        }
      }

      if(inverse) {
        this.source.push('tmp1.fn = tmp1;');
        this.source.push('tmp1.inverse = ' + inverse + ';');
      }

      if(this.options.data) {
        this.source.push('tmp1.data = data;');
      }

      params.push(stringOptions);

      this.populateCall(params, id, helperId || id, fn, program !== '{}');
    },

    populateCall: function(params, id, helperId, fn, program) {
      var paramString = ["depth0"].concat(params).join(", ");
      var helperMissingString = ["depth0"].concat(helperId).concat(params).join(", ");

      var nextStack = this.nextStack();

      if (this.usingKnownHelper) {
        this.source.push(nextStack + " = " + id + ".call(" + paramString + ");");
      } else {
        this.context.aliases.functionType = '"function"';
        var condition = program ? "foundHelper && " : ""
        this.source.push("if(" + condition + "typeof " + id + " === functionType) { " + nextStack + " = " + id + ".call(" + paramString + "); }");
      }
      fn.call(this, nextStack, helperMissingString, id);
      this.usingKnownHelper = false;
    },

    invokePartial: function(context) {
      params = [this.nameLookup('partials', context, 'partial'), "'" + context + "'", this.popStack(), "helpers", "partials"];

      if (this.options.data) {
        params.push("data");
      }

      this.pushStack("self.invokePartial(" + params.join(", ") + ");");
    },

    assignToHash: function(key) {
      var value = this.popStack();
      var hash = this.topStack();

      this.source.push(hash + "['" + key + "'] = " + value + ";");
    },

    // HELPERS

    compiler: JavaScriptCompiler,

    compileChildren: function(environment, options) {
      var children = environment.children, child, compiler;

      for(var i=0, l=children.length; i<l; i++) {
        child = children[i];
        compiler = new this.compiler();

        this.context.programs.push('');     // Placeholder to prevent name conflicts for nested children
        var index = this.context.programs.length;
        child.index = index;
        child.name = 'program' + index;
        this.context.programs[index] = compiler.compile(child, options, this.context);
      }
    },

    programExpression: function(guid) {
      if(guid == null) { return "self.noop"; }

      var child = this.environment.children[guid],
          depths = child.depths.list;
      var programParams = [child.index, child.name, "data"];

      for(var i=0, l = depths.length; i<l; i++) {
        depth = depths[i];

        if(depth === 1) { programParams.push("depth0"); }
        else { programParams.push("depth" + (depth - 1)); }
      }

      if(depths.length === 0) {
        return "self.program(" + programParams.join(", ") + ")";
      } else {
        programParams.shift();
        return "self.programWithDepth(" + programParams.join(", ") + ")";
      }
    },

    register: function(name, val) {
      this.useRegister(name);
      this.source.push(name + " = " + val + ";");
    },

    useRegister: function(name) {
      if(!this.context.registers[name]) {
        this.context.registers[name] = true;
        this.context.registers.list.push(name);
      }
    },

    pushStack: function(item) {
      this.source.push(this.nextStack() + " = " + item + ";");
      return "stack" + this.stackSlot;
    },

    nextStack: function() {
      this.stackSlot++;
      if(this.stackSlot > this.stackVars.length) { this.stackVars.push("stack" + this.stackSlot); }
      return "stack" + this.stackSlot;
    },

    popStack: function() {
      return "stack" + this.stackSlot--;
    },

    topStack: function() {
      return "stack" + this.stackSlot;
    },

    quotedString: function(str) {
      return '"' + str
        .replace(/\\/g, '\\\\')
        .replace(/"/g, '\\"')
        .replace(/\n/g, '\\n')
        .replace(/\r/g, '\\r') + '"';
    }
  };

  var reservedWords = (
    "break else new var" +
    " case finally return void" +
    " catch for switch while" +
    " continue function this with" +
    " default if throw" +
    " delete in try" +
    " do instanceof typeof" +
    " abstract enum int short" +
    " boolean export interface static" +
    " byte extends long super" +
    " char final native synchronized" +
    " class float package throws" +
    " const goto private transient" +
    " debugger implements protected volatile" +
    " double import public let yield"
  ).split(" ");

  var compilerWords = JavaScriptCompiler.RESERVED_WORDS = {};

  for(var i=0, l=reservedWords.length; i<l; i++) {
    compilerWords[reservedWords[i]] = true;
  }

	JavaScriptCompiler.isValidJavaScriptVariableName = function(name) {
		if(!JavaScriptCompiler.RESERVED_WORDS[name] && /^[a-zA-Z_$][0-9a-zA-Z_$]+$/.test(name)) {
			return true;
		}
		return false;
	}

})(Handlebars.Compiler, Handlebars.JavaScriptCompiler);

Handlebars.precompile = function(string, options) {
  options = options || {};

  var ast = Handlebars.parse(string);
  var environment = new Handlebars.Compiler().compile(ast, options);
  return new Handlebars.JavaScriptCompiler().compile(environment, options);
};

Handlebars.compile = function(string, options) {
  options = options || {};

  var compiled;
  function compile() {
    var ast = Handlebars.parse(string);
    var environment = new Handlebars.Compiler().compile(ast, options);
    var templateSpec = new Handlebars.JavaScriptCompiler().compile(environment, options, undefined, true);
    return Handlebars.template(templateSpec);
  }

  // Template is only compiled on first use and cached after that point.
  return function(context, options) {
    if (!compiled) {
      compiled = compile();
    }
    return compiled.call(this, context, options);
  };
};
;
// lib/handlebars/runtime.js
Handlebars.VM = {
  template: function(templateSpec) {
    // Just add water
    var container = {
      escapeExpression: Handlebars.Utils.escapeExpression,
      invokePartial: Handlebars.VM.invokePartial,
      programs: [],
      program: function(i, fn, data) {
        var programWrapper = this.programs[i];
        if(data) {
          return Handlebars.VM.program(fn, data);
        } else if(programWrapper) {
          return programWrapper;
        } else {
          programWrapper = this.programs[i] = Handlebars.VM.program(fn);
          return programWrapper;
        }
      },
      programWithDepth: Handlebars.VM.programWithDepth,
      noop: Handlebars.VM.noop
    };

    return function(context, options) {
      options = options || {};
      return templateSpec.call(container, Handlebars, context, options.helpers, options.partials, options.data);
    };
  },

  programWithDepth: function(fn, data, $depth) {
    var args = Array.prototype.slice.call(arguments, 2);

    return function(context, options) {
      options = options || {};

      return fn.apply(this, [context, options.data || data].concat(args));
    };
  },
  program: function(fn, data) {
    return function(context, options) {
      options = options || {};

      return fn(context, options.data || data);
    };
  },
  noop: function() { return ""; },
  invokePartial: function(partial, name, context, helpers, partials, data) {
    options = { helpers: helpers, partials: partials, data: data };

    if(partial === undefined) {
      throw new Handlebars.Exception("The partial " + name + " could not be found");
    } else if(partial instanceof Function) {
      return partial(context, options);
    } else if (!Handlebars.compile) {
      throw new Handlebars.Exception("The partial " + name + " could not be compiled when running in runtime-only mode");
    } else {
      partials[name] = Handlebars.compile(partial);
      return partials[name](context, options);
    }
  }
};

Handlebars.template = Handlebars.VM.template;
;
//! moment.js
//! version : 2.3.1
//! authors : Tim Wood, Iskren Chernev, Moment.js contributors
//! license : MIT
//! momentjs.com

(function (undefined) {

    /************************************
        Constants
    ************************************/

    var moment,
        VERSION = "2.3.1",
        round = Math.round,
        i,

        YEAR = 0,
        MONTH = 1,
        DATE = 2,
        HOUR = 3,
        MINUTE = 4,
        SECOND = 5,
        MILLISECOND = 6,

        // internal storage for language config files
        languages = {},

        // check for nodeJS
        hasModule = (typeof module !== 'undefined' && module.exports),

        // ASP.NET json date format regex
        aspNetJsonRegex = /^\/?Date\((\-?\d+)/i,
        aspNetTimeSpanJsonRegex = /(\-)?(?:(\d*)\.)?(\d+)\:(\d+)(?:\:(\d+)\.?(\d{3})?)?/,

        // from http://docs.closure-library.googlecode.com/git/closure_goog_date_date.js.source.html
        // somewhat more in line with 4.4.3.2 2004 spec, but allows decimal anywhere
        isoDurationRegex = /^(-)?P(?:(?:([0-9,.]*)Y)?(?:([0-9,.]*)M)?(?:([0-9,.]*)D)?(?:T(?:([0-9,.]*)H)?(?:([0-9,.]*)M)?(?:([0-9,.]*)S)?)?|([0-9,.]*)W)$/,

        // format tokens
        formattingTokens = /(\[[^\[]*\])|(\\)?(Mo|MM?M?M?|Do|DDDo|DD?D?D?|ddd?d?|do?|w[o|w]?|W[o|W]?|YYYYY|YYYY|YY|gg(ggg?)?|GG(GGG?)?|e|E|a|A|hh?|HH?|mm?|ss?|SS?S?|X|zz?|ZZ?|.)/g,
        localFormattingTokens = /(\[[^\[]*\])|(\\)?(LT|LL?L?L?|l{1,4})/g,

        // parsing token regexes
        parseTokenOneOrTwoDigits = /\d\d?/, // 0 - 99
        parseTokenOneToThreeDigits = /\d{1,3}/, // 0 - 999
        parseTokenThreeDigits = /\d{3}/, // 000 - 999
        parseTokenFourDigits = /\d{1,4}/, // 0 - 9999
        parseTokenSixDigits = /[+\-]?\d{1,6}/, // -999,999 - 999,999
        parseTokenWord = /[0-9]*['a-z\u00A0-\u05FF\u0700-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+|[\u0600-\u06FF\/]+(\s*?[\u0600-\u06FF]+){1,2}/i, // any word (or two) characters or numbers including two/three word month in arabic.
        parseTokenTimezone = /Z|[\+\-]\d\d:?\d\d/i, // +00:00 -00:00 +0000 -0000 or Z
        parseTokenT = /T/i, // T (ISO seperator)
        parseTokenTimestampMs = /[\+\-]?\d+(\.\d{1,3})?/, // 123456789 123456789.123

        // preliminary iso regex
        // 0000-00-00 0000-W00 or 0000-W00-0 + T + 00 or 00:00 or 00:00:00 or 00:00:00.000 + +00:00 or +0000)
        isoRegex = /^\s*\d{4}-(?:(\d\d-\d\d)|(W\d\d$)|(W\d\d-\d)|(\d\d\d))((T| )(\d\d(:\d\d(:\d\d(\.\d\d?\d?)?)?)?)?([\+\-]\d\d:?\d\d)?)?$/,

        isoFormat = 'YYYY-MM-DDTHH:mm:ssZ',

        isoDates = [
            'YYYY-MM-DD',
            'GGGG-[W]WW',
            'GGGG-[W]WW-E',
            'YYYY-DDD'
        ],

        // iso time formats and regexes
        isoTimes = [
            ['HH:mm:ss.S', /(T| )\d\d:\d\d:\d\d\.\d{1,3}/],
            ['HH:mm:ss', /(T| )\d\d:\d\d:\d\d/],
            ['HH:mm', /(T| )\d\d:\d\d/],
            ['HH', /(T| )\d\d/]
        ],

        // timezone chunker "+10:00" > ["10", "00"] or "-1530" > ["-15", "30"]
        parseTimezoneChunker = /([\+\-]|\d\d)/gi,

        // getter and setter names
        proxyGettersAndSetters = 'Date|Hours|Minutes|Seconds|Milliseconds'.split('|'),
        unitMillisecondFactors = {
            'Milliseconds' : 1,
            'Seconds' : 1e3,
            'Minutes' : 6e4,
            'Hours' : 36e5,
            'Days' : 864e5,
            'Months' : 2592e6,
            'Years' : 31536e6
        },

        unitAliases = {
            ms : 'millisecond',
            s : 'second',
            m : 'minute',
            h : 'hour',
            d : 'day',
            D : 'date',
            w : 'week',
            W : 'isoWeek',
            M : 'month',
            y : 'year',
            DDD : 'dayOfYear',
            e : 'weekday',
            E : 'isoWeekday',
            gg: 'weekYear',
            GG: 'isoWeekYear'
        },

        camelFunctions = {
            dayofyear : 'dayOfYear',
            isoweekday : 'isoWeekday',
            isoweek : 'isoWeek',
            weekyear : 'weekYear',
            isoweekyear : 'isoWeekYear'
        },

        // format function strings
        formatFunctions = {},

        // tokens to ordinalize and pad
        ordinalizeTokens = 'DDD w W M D d'.split(' '),
        paddedTokens = 'M D H h m s w W'.split(' '),

        formatTokenFunctions = {
            M    : function () {
                return this.month() + 1;
            },
            MMM  : function (format) {
                return this.lang().monthsShort(this, format);
            },
            MMMM : function (format) {
                return this.lang().months(this, format);
            },
            D    : function () {
                return this.date();
            },
            DDD  : function () {
                return this.dayOfYear();
            },
            d    : function () {
                return this.day();
            },
            dd   : function (format) {
                return this.lang().weekdaysMin(this, format);
            },
            ddd  : function (format) {
                return this.lang().weekdaysShort(this, format);
            },
            dddd : function (format) {
                return this.lang().weekdays(this, format);
            },
            w    : function () {
                return this.week();
            },
            W    : function () {
                return this.isoWeek();
            },
            YY   : function () {
                return leftZeroFill(this.year() % 100, 2);
            },
            YYYY : function () {
                return leftZeroFill(this.year(), 4);
            },
            YYYYY : function () {
                return leftZeroFill(this.year(), 5);
            },
            gg   : function () {
                return leftZeroFill(this.weekYear() % 100, 2);
            },
            gggg : function () {
                return this.weekYear();
            },
            ggggg : function () {
                return leftZeroFill(this.weekYear(), 5);
            },
            GG   : function () {
                return leftZeroFill(this.isoWeekYear() % 100, 2);
            },
            GGGG : function () {
                return this.isoWeekYear();
            },
            GGGGG : function () {
                return leftZeroFill(this.isoWeekYear(), 5);
            },
            e : function () {
                return this.weekday();
            },
            E : function () {
                return this.isoWeekday();
            },
            a    : function () {
                return this.lang().meridiem(this.hours(), this.minutes(), true);
            },
            A    : function () {
                return this.lang().meridiem(this.hours(), this.minutes(), false);
            },
            H    : function () {
                return this.hours();
            },
            h    : function () {
                return this.hours() % 12 || 12;
            },
            m    : function () {
                return this.minutes();
            },
            s    : function () {
                return this.seconds();
            },
            S    : function () {
                return toInt(this.milliseconds() / 100);
            },
            SS   : function () {
                return leftZeroFill(toInt(this.milliseconds() / 10), 2);
            },
            SSS  : function () {
                return leftZeroFill(this.milliseconds(), 3);
            },
            Z    : function () {
                var a = -this.zone(),
                    b = "+";
                if (a < 0) {
                    a = -a;
                    b = "-";
                }
                return b + leftZeroFill(toInt(a / 60), 2) + ":" + leftZeroFill(toInt(a) % 60, 2);
            },
            ZZ   : function () {
                var a = -this.zone(),
                    b = "+";
                if (a < 0) {
                    a = -a;
                    b = "-";
                }
                return b + leftZeroFill(toInt(10 * a / 6), 4);
            },
            z : function () {
                return this.zoneAbbr();
            },
            zz : function () {
                return this.zoneName();
            },
            X    : function () {
                return this.unix();
            }
        },

        lists = ['months', 'monthsShort', 'weekdays', 'weekdaysShort', 'weekdaysMin'];

    function padToken(func, count) {
        return function (a) {
            return leftZeroFill(func.call(this, a), count);
        };
    }
    function ordinalizeToken(func, period) {
        return function (a) {
            return this.lang().ordinal(func.call(this, a), period);
        };
    }

    while (ordinalizeTokens.length) {
        i = ordinalizeTokens.pop();
        formatTokenFunctions[i + 'o'] = ordinalizeToken(formatTokenFunctions[i], i);
    }
    while (paddedTokens.length) {
        i = paddedTokens.pop();
        formatTokenFunctions[i + i] = padToken(formatTokenFunctions[i], 2);
    }
    formatTokenFunctions.DDDD = padToken(formatTokenFunctions.DDD, 3);


    /************************************
        Constructors
    ************************************/

    function Language() {

    }

    // Moment prototype object
    function Moment(config) {
        checkOverflow(config);
        extend(this, config);
    }

    // Duration Constructor
    function Duration(duration) {
        var normalizedInput = normalizeObjectUnits(duration),
            years = normalizedInput.year || 0,
            months = normalizedInput.month || 0,
            weeks = normalizedInput.week || 0,
            days = normalizedInput.day || 0,
            hours = normalizedInput.hour || 0,
            minutes = normalizedInput.minute || 0,
            seconds = normalizedInput.second || 0,
            milliseconds = normalizedInput.millisecond || 0;

        // store reference to input for deterministic cloning
        this._input = duration;

        // representation for dateAddRemove
        this._milliseconds = +milliseconds +
            seconds * 1e3 + // 1000
            minutes * 6e4 + // 1000 * 60
            hours * 36e5; // 1000 * 60 * 60
        // Because of dateAddRemove treats 24 hours as different from a
        // day when working around DST, we need to store them separately
        this._days = +days +
            weeks * 7;
        // It is impossible translate months into days without knowing
        // which months you are are talking about, so we have to store
        // it separately.
        this._months = +months +
            years * 12;

        this._data = {};

        this._bubble();
    }

    /************************************
        Helpers
    ************************************/


    function extend(a, b) {
        for (var i in b) {
            if (b.hasOwnProperty(i)) {
                a[i] = b[i];
            }
        }

        if (b.hasOwnProperty("toString")) {
            a.toString = b.toString;
        }

        if (b.hasOwnProperty("valueOf")) {
            a.valueOf = b.valueOf;
        }

        return a;
    }

    function absRound(number) {
        if (number < 0) {
            return Math.ceil(number);
        } else {
            return Math.floor(number);
        }
    }

    // left zero fill a number
    // see http://jsperf.com/left-zero-filling for performance comparison
    function leftZeroFill(number, targetLength) {
        var output = number + '';
        while (output.length < targetLength) {
            output = '0' + output;
        }
        return output;
    }

    // helper function for _.addTime and _.subtractTime
    function addOrSubtractDurationFromMoment(mom, duration, isAdding, ignoreUpdateOffset) {
        var milliseconds = duration._milliseconds,
            days = duration._days,
            months = duration._months,
            minutes,
            hours;

        if (milliseconds) {
            mom._d.setTime(+mom._d + milliseconds * isAdding);
        }
        // store the minutes and hours so we can restore them
        if (days || months) {
            minutes = mom.minute();
            hours = mom.hour();
        }
        if (days) {
            mom.date(mom.date() + days * isAdding);
        }
        if (months) {
            mom.month(mom.month() + months * isAdding);
        }
        if (milliseconds && !ignoreUpdateOffset) {
            moment.updateOffset(mom);
        }
        // restore the minutes and hours after possibly changing dst
        if (days || months) {
            mom.minute(minutes);
            mom.hour(hours);
        }
    }

    // check if is an array
    function isArray(input) {
        return Object.prototype.toString.call(input) === '[object Array]';
    }

    function isDate(input) {
        return Object.prototype.toString.call(input) === '[object Date]';
    }

    // compare two arrays, return the number of differences
    function compareArrays(array1, array2, dontConvert) {
        var len = Math.min(array1.length, array2.length),
            lengthDiff = Math.abs(array1.length - array2.length),
            diffs = 0,
            i;
        for (i = 0; i < len; i++) {
            if ((dontConvert && array1[i] !== array2[i]) ||
                (!dontConvert && toInt(array1[i]) !== toInt(array2[i]))) {
                diffs++;
            }
        }
        return diffs + lengthDiff;
    }

    function normalizeUnits(units) {
        if (units) {
            var lowered = units.toLowerCase().replace(/(.)s$/, '$1');
            units = unitAliases[units] || camelFunctions[lowered] || lowered;
        }
        return units;
    }

    function normalizeObjectUnits(inputObject) {
        var normalizedInput = {},
            normalizedProp,
            prop,
            index;

        for (prop in inputObject) {
            if (inputObject.hasOwnProperty(prop)) {
                normalizedProp = normalizeUnits(prop);
                if (normalizedProp) {
                    normalizedInput[normalizedProp] = inputObject[prop];
                }
            }
        }

        return normalizedInput;
    }

    function makeList(field) {
        var count, setter;

        if (field.indexOf('week') === 0) {
            count = 7;
            setter = 'day';
        }
        else if (field.indexOf('month') === 0) {
            count = 12;
            setter = 'month';
        }
        else {
            return;
        }

        moment[field] = function (format, index) {
            var i, getter,
                method = moment.fn._lang[field],
                results = [];

            if (typeof format === 'number') {
                index = format;
                format = undefined;
            }

            getter = function (i) {
                var m = moment().utc().set(setter, i);
                return method.call(moment.fn._lang, m, format || '');
            };

            if (index != null) {
                return getter(index);
            }
            else {
                for (i = 0; i < count; i++) {
                    results.push(getter(i));
                }
                return results;
            }
        };
    }

    function toInt(argumentForCoercion) {
        var coercedNumber = +argumentForCoercion,
            value = 0;

        if (coercedNumber !== 0 && isFinite(coercedNumber)) {
            if (coercedNumber >= 0) {
                value = Math.floor(coercedNumber);
            } else {
                value = Math.ceil(coercedNumber);
            }
        }

        return value;
    }

    function daysInMonth(year, month) {
        return new Date(Date.UTC(year, month + 1, 0)).getUTCDate();
    }

    function daysInYear(year) {
        return isLeapYear(year) ? 366 : 365;
    }

    function isLeapYear(year) {
        return (year % 4 === 0 && year % 100 !== 0) || year % 400 === 0;
    }

    function checkOverflow(m) {
        var overflow;
        if (m._a && m._pf.overflow === -2) {
            overflow =
                m._a[MONTH] < 0 || m._a[MONTH] > 11 ? MONTH :
                m._a[DATE] < 1 || m._a[DATE] > daysInMonth(m._a[YEAR], m._a[MONTH]) ? DATE :
                m._a[HOUR] < 0 || m._a[HOUR] > 23 ? HOUR :
                m._a[MINUTE] < 0 || m._a[MINUTE] > 59 ? MINUTE :
                m._a[SECOND] < 0 || m._a[SECOND] > 59 ? SECOND :
                m._a[MILLISECOND] < 0 || m._a[MILLISECOND] > 999 ? MILLISECOND :
                -1;

            if (m._pf._overflowDayOfYear && (overflow < YEAR || overflow > DATE)) {
                overflow = DATE;
            }

            m._pf.overflow = overflow;
        }
    }

    function initializeParsingFlags(config) {
        config._pf = {
            empty : false,
            unusedTokens : [],
            unusedInput : [],
            overflow : -2,
            charsLeftOver : 0,
            nullInput : false,
            invalidMonth : null,
            invalidFormat : false,
            userInvalidated : false
        };
    }

    function isValid(m) {
        if (m._isValid == null) {
            m._isValid = !isNaN(m._d.getTime()) &&
                m._pf.overflow < 0 &&
                !m._pf.empty &&
                !m._pf.invalidMonth &&
                !m._pf.nullInput &&
                !m._pf.invalidFormat &&
                !m._pf.userInvalidated;

            if (m._strict) {
                m._isValid = m._isValid &&
                    m._pf.charsLeftOver === 0 &&
                    m._pf.unusedTokens.length === 0;
            }
        }
        return m._isValid;
    }

    function normalizeLanguage(key) {
        return key ? key.toLowerCase().replace('_', '-') : key;
    }

    /************************************
        Languages
    ************************************/


    extend(Language.prototype, {

        set : function (config) {
            var prop, i;
            for (i in config) {
                prop = config[i];
                if (typeof prop === 'function') {
                    this[i] = prop;
                } else {
                    this['_' + i] = prop;
                }
            }
        },

        _months : "January_February_March_April_May_June_July_August_September_October_November_December".split("_"),
        months : function (m) {
            return this._months[m.month()];
        },

        _monthsShort : "Jan_Feb_Mar_Apr_May_Jun_Jul_Aug_Sep_Oct_Nov_Dec".split("_"),
        monthsShort : function (m) {
            return this._monthsShort[m.month()];
        },

        monthsParse : function (monthName) {
            var i, mom, regex;

            if (!this._monthsParse) {
                this._monthsParse = [];
            }

            for (i = 0; i < 12; i++) {
                // make the regex if we don't have it already
                if (!this._monthsParse[i]) {
                    mom = moment.utc([2000, i]);
                    regex = '^' + this.months(mom, '') + '|^' + this.monthsShort(mom, '');
                    this._monthsParse[i] = new RegExp(regex.replace('.', ''), 'i');
                }
                // test the regex
                if (this._monthsParse[i].test(monthName)) {
                    return i;
                }
            }
        },

        _weekdays : "Sunday_Monday_Tuesday_Wednesday_Thursday_Friday_Saturday".split("_"),
        weekdays : function (m) {
            return this._weekdays[m.day()];
        },

        _weekdaysShort : "Sun_Mon_Tue_Wed_Thu_Fri_Sat".split("_"),
        weekdaysShort : function (m) {
            return this._weekdaysShort[m.day()];
        },

        _weekdaysMin : "Su_Mo_Tu_We_Th_Fr_Sa".split("_"),
        weekdaysMin : function (m) {
            return this._weekdaysMin[m.day()];
        },

        weekdaysParse : function (weekdayName) {
            var i, mom, regex;

            if (!this._weekdaysParse) {
                this._weekdaysParse = [];
            }

            for (i = 0; i < 7; i++) {
                // make the regex if we don't have it already
                if (!this._weekdaysParse[i]) {
                    mom = moment([2000, 1]).day(i);
                    regex = '^' + this.weekdays(mom, '') + '|^' + this.weekdaysShort(mom, '') + '|^' + this.weekdaysMin(mom, '');
                    this._weekdaysParse[i] = new RegExp(regex.replace('.', ''), 'i');
                }
                // test the regex
                if (this._weekdaysParse[i].test(weekdayName)) {
                    return i;
                }
            }
        },

        _longDateFormat : {
            LT : "h:mm A",
            L : "MM/DD/YYYY",
            LL : "MMMM D YYYY",
            LLL : "MMMM D YYYY LT",
            LLLL : "dddd, MMMM D YYYY LT"
        },
        longDateFormat : function (key) {
            var output = this._longDateFormat[key];
            if (!output && this._longDateFormat[key.toUpperCase()]) {
                output = this._longDateFormat[key.toUpperCase()].replace(/MMMM|MM|DD|dddd/g, function (val) {
                    return val.slice(1);
                });
                this._longDateFormat[key] = output;
            }
            return output;
        },

        isPM : function (input) {
            // IE8 Quirks Mode & IE7 Standards Mode do not allow accessing strings like arrays
            // Using charAt should be more compatible.
            return ((input + '').toLowerCase().charAt(0) === 'p');
        },

        _meridiemParse : /[ap]\.?m?\.?/i,
        meridiem : function (hours, minutes, isLower) {
            if (hours > 11) {
                return isLower ? 'pm' : 'PM';
            } else {
                return isLower ? 'am' : 'AM';
            }
        },

        _calendar : {
            sameDay : '[Today at] LT',
            nextDay : '[Tomorrow at] LT',
            nextWeek : 'dddd [at] LT',
            lastDay : '[Yesterday at] LT',
            lastWeek : '[Last] dddd [at] LT',
            sameElse : 'L'
        },
        calendar : function (key, mom) {
            var output = this._calendar[key];
            return typeof output === 'function' ? output.apply(mom) : output;
        },

        _relativeTime : {
            future : "in %s",
            past : "%s ago",
            s : "a few seconds",
            m : "a minute",
            mm : "%d minutes",
            h : "an hour",
            hh : "%d hours",
            d : "a day",
            dd : "%d days",
            M : "a month",
            MM : "%d months",
            y : "a year",
            yy : "%d years"
        },
        relativeTime : function (number, withoutSuffix, string, isFuture) {
            var output = this._relativeTime[string];
            return (typeof output === 'function') ?
                output(number, withoutSuffix, string, isFuture) :
                output.replace(/%d/i, number);
        },
        pastFuture : function (diff, output) {
            var format = this._relativeTime[diff > 0 ? 'future' : 'past'];
            return typeof format === 'function' ? format(output) : format.replace(/%s/i, output);
        },

        ordinal : function (number) {
            return this._ordinal.replace("%d", number);
        },
        _ordinal : "%d",

        preparse : function (string) {
            return string;
        },

        postformat : function (string) {
            return string;
        },

        week : function (mom) {
            return weekOfYear(mom, this._week.dow, this._week.doy).week;
        },

        _week : {
            dow : 0, // Sunday is the first day of the week.
            doy : 6  // The week that contains Jan 1st is the first week of the year.
        },

        _invalidDate: 'Invalid date',
        invalidDate: function () {
            return this._invalidDate;
        }
    });

    // Loads a language definition into the `languages` cache.  The function
    // takes a key and optionally values.  If not in the browser and no values
    // are provided, it will load the language file module.  As a convenience,
    // this function also returns the language values.
    function loadLang(key, values) {
        values.abbr = key;
        if (!languages[key]) {
            languages[key] = new Language();
        }
        languages[key].set(values);
        return languages[key];
    }

    // Remove a language from the `languages` cache. Mostly useful in tests.
    function unloadLang(key) {
        delete languages[key];
    }

    // Determines which language definition to use and returns it.
    //
    // With no parameters, it will return the global language.  If you
    // pass in a language key, such as 'en', it will return the
    // definition for 'en', so long as 'en' has already been loaded using
    // moment.lang.
    function getLangDefinition(key) {
        var i = 0, j, lang, next, split,
            get = function (k) {
                if (!languages[k] && hasModule) {
                    try {
                        require('./lang/' + k);
                    } catch (e) { }
                }
                return languages[k];
            };

        if (!key) {
            return moment.fn._lang;
        }

        if (!isArray(key)) {
            //short-circuit everything else
            lang = get(key);
            if (lang) {
                return lang;
            }
            key = [key];
        }

        //pick the language from the array
        //try ['en-au', 'en-gb'] as 'en-au', 'en-gb', 'en', as in move through the list trying each
        //substring from most specific to least, but move to the next array item if it's a more specific variant than the current root
        while (i < key.length) {
            split = normalizeLanguage(key[i]).split('-');
            j = split.length;
            next = normalizeLanguage(key[i + 1]);
            next = next ? next.split('-') : null;
            while (j > 0) {
                lang = get(split.slice(0, j).join('-'));
                if (lang) {
                    return lang;
                }
                if (next && next.length >= j && compareArrays(split, next, true) >= j - 1) {
                    //the next array item is better than a shallower substring of this one
                    break;
                }
                j--;
            }
            i++;
        }
        return moment.fn._lang;
    }

    /************************************
        Formatting
    ************************************/


    function removeFormattingTokens(input) {
        if (input.match(/\[[\s\S]/)) {
            return input.replace(/^\[|\]$/g, "");
        }
        return input.replace(/\\/g, "");
    }

    function makeFormatFunction(format) {
        var array = format.match(formattingTokens), i, length;

        for (i = 0, length = array.length; i < length; i++) {
            if (formatTokenFunctions[array[i]]) {
                array[i] = formatTokenFunctions[array[i]];
            } else {
                array[i] = removeFormattingTokens(array[i]);
            }
        }

        return function (mom) {
            var output = "";
            for (i = 0; i < length; i++) {
                output += array[i] instanceof Function ? array[i].call(mom, format) : array[i];
            }
            return output;
        };
    }

    // format date using native date object
    function formatMoment(m, format) {

        if (!m.isValid()) {
            return m.lang().invalidDate();
        }

        format = expandFormat(format, m.lang());

        if (!formatFunctions[format]) {
            formatFunctions[format] = makeFormatFunction(format);
        }

        return formatFunctions[format](m);
    }

    function expandFormat(format, lang) {
        var i = 5;

        function replaceLongDateFormatTokens(input) {
            return lang.longDateFormat(input) || input;
        }

        localFormattingTokens.lastIndex = 0;
        while (i >= 0 && localFormattingTokens.test(format)) {
            format = format.replace(localFormattingTokens, replaceLongDateFormatTokens);
            localFormattingTokens.lastIndex = 0;
            i -= 1;
        }

        return format;
    }


    /************************************
        Parsing
    ************************************/


    // get the regex to find the next token
    function getParseRegexForToken(token, config) {
        var a;
        switch (token) {
        case 'DDDD':
            return parseTokenThreeDigits;
        case 'YYYY':
        case 'GGGG':
        case 'gggg':
            return parseTokenFourDigits;
        case 'YYYYY':
        case 'GGGGG':
        case 'ggggg':
            return parseTokenSixDigits;
        case 'S':
        case 'SS':
        case 'SSS':
        case 'DDD':
            return parseTokenOneToThreeDigits;
        case 'MMM':
        case 'MMMM':
        case 'dd':
        case 'ddd':
        case 'dddd':
            return parseTokenWord;
        case 'a':
        case 'A':
            return getLangDefinition(config._l)._meridiemParse;
        case 'X':
            return parseTokenTimestampMs;
        case 'Z':
        case 'ZZ':
            return parseTokenTimezone;
        case 'T':
            return parseTokenT;
        case 'MM':
        case 'DD':
        case 'YY':
        case 'GG':
        case 'gg':
        case 'HH':
        case 'hh':
        case 'mm':
        case 'ss':
        case 'M':
        case 'D':
        case 'd':
        case 'H':
        case 'h':
        case 'm':
        case 's':
        case 'w':
        case 'ww':
        case 'W':
        case 'WW':
        case 'e':
        case 'E':
            return parseTokenOneOrTwoDigits;
        default :
            a = new RegExp(regexpEscape(unescapeFormat(token.replace('\\', '')), "i"));
            return a;
        }
    }

    function timezoneMinutesFromString(string) {
        var tzchunk = (parseTokenTimezone.exec(string) || [])[0],
            parts = (tzchunk + '').match(parseTimezoneChunker) || ['-', 0, 0],
            minutes = +(parts[1] * 60) + toInt(parts[2]);

        return parts[0] === '+' ? -minutes : minutes;
    }

    // function to convert string input to date
    function addTimeToArrayFromToken(token, input, config) {
        var a, datePartArray = config._a;

        switch (token) {
        // MONTH
        case 'M' : // fall through to MM
        case 'MM' :
            if (input != null) {
                datePartArray[MONTH] = toInt(input) - 1;
            }
            break;
        case 'MMM' : // fall through to MMMM
        case 'MMMM' :
            a = getLangDefinition(config._l).monthsParse(input);
            // if we didn't find a month name, mark the date as invalid.
            if (a != null) {
                datePartArray[MONTH] = a;
            } else {
                config._pf.invalidMonth = input;
            }
            break;
        // DAY OF MONTH
        case 'D' : // fall through to DD
        case 'DD' :
            if (input != null) {
                datePartArray[DATE] = toInt(input);
            }
            break;
        // DAY OF YEAR
        case 'DDD' : // fall through to DDDD
        case 'DDDD' :
            if (input != null) {
                config._dayOfYear = toInt(input);
            }

            break;
        // YEAR
        case 'YY' :
            datePartArray[YEAR] = toInt(input) + (toInt(input) > 68 ? 1900 : 2000);
            break;
        case 'YYYY' :
        case 'YYYYY' :
            datePartArray[YEAR] = toInt(input);
            break;
        // AM / PM
        case 'a' : // fall through to A
        case 'A' :
            config._isPm = getLangDefinition(config._l).isPM(input);
            break;
        // 24 HOUR
        case 'H' : // fall through to hh
        case 'HH' : // fall through to hh
        case 'h' : // fall through to hh
        case 'hh' :
            datePartArray[HOUR] = toInt(input);
            break;
        // MINUTE
        case 'm' : // fall through to mm
        case 'mm' :
            datePartArray[MINUTE] = toInt(input);
            break;
        // SECOND
        case 's' : // fall through to ss
        case 'ss' :
            datePartArray[SECOND] = toInt(input);
            break;
        // MILLISECOND
        case 'S' :
        case 'SS' :
        case 'SSS' :
            datePartArray[MILLISECOND] = toInt(('0.' + input) * 1000);
            break;
        // UNIX TIMESTAMP WITH MS
        case 'X':
            config._d = new Date(parseFloat(input) * 1000);
            break;
        // TIMEZONE
        case 'Z' : // fall through to ZZ
        case 'ZZ' :
            config._useUTC = true;
            config._tzm = timezoneMinutesFromString(input);
            break;
        case 'w':
        case 'ww':
        case 'W':
        case 'WW':
        case 'd':
        case 'dd':
        case 'ddd':
        case 'dddd':
        case 'e':
        case 'E':
            token = token.substr(0, 1);
            /* falls through */
        case 'gg':
        case 'gggg':
        case 'GG':
        case 'GGGG':
        case 'GGGGG':
            token = token.substr(0, 2);
            if (input) {
                config._w = config._w || {};
                config._w[token] = input;
            }
            break;
        }
    }

    // convert an array to a date.
    // the array should mirror the parameters below
    // note: all values past the year are optional and will default to the lowest possible value.
    // [year, month, day , hour, minute, second, millisecond]
    function dateFromConfig(config) {
        var i, date, input = [], currentDate,
            yearToUse, fixYear, w, temp, lang, weekday, week;

        if (config._d) {
            return;
        }

        currentDate = currentDateArray(config);

        //compute day of the year from weeks and weekdays
        if (config._w && config._a[DATE] == null && config._a[MONTH] == null) {
            fixYear = function (val) {
                return val ?
                  (val.length < 3 ? (parseInt(val, 10) > 68 ? '19' + val : '20' + val) : val) :
                  (config._a[YEAR] == null ? moment().weekYear() : config._a[YEAR]);
            };

            w = config._w;
            if (w.GG != null || w.W != null || w.E != null) {
                temp = dayOfYearFromWeeks(fixYear(w.GG), w.W || 1, w.E, 4, 1);
            }
            else {
                lang = getLangDefinition(config._l);
                weekday = w.d != null ?  parseWeekday(w.d, lang) :
                  (w.e != null ?  parseInt(w.e, 10) + lang._week.dow : 0);

                week = parseInt(w.w, 10) || 1;

                //if we're parsing 'd', then the low day numbers may be next week
                if (w.d != null && weekday < lang._week.dow) {
                    week++;
                }

                temp = dayOfYearFromWeeks(fixYear(w.gg), week, weekday, lang._week.doy, lang._week.dow);
            }

            config._a[YEAR] = temp.year;
            config._dayOfYear = temp.dayOfYear;
        }

        //if the day of the year is set, figure out what it is
        if (config._dayOfYear) {
            yearToUse = config._a[YEAR] == null ? currentDate[YEAR] : config._a[YEAR];

            if (config._dayOfYear > daysInYear(yearToUse)) {
                config._pf._overflowDayOfYear = true;
            }

            date = makeUTCDate(yearToUse, 0, config._dayOfYear);
            config._a[MONTH] = date.getUTCMonth();
            config._a[DATE] = date.getUTCDate();
        }

        // Default to current date.
        // * if no year, month, day of month are given, default to today
        // * if day of month is given, default month and year
        // * if month is given, default only year
        // * if year is given, don't default anything
        for (i = 0; i < 3 && config._a[i] == null; ++i) {
            config._a[i] = input[i] = currentDate[i];
        }

        // Zero out whatever was not defaulted, including time
        for (; i < 7; i++) {
            config._a[i] = input[i] = (config._a[i] == null) ? (i === 2 ? 1 : 0) : config._a[i];
        }

        // add the offsets to the time to be parsed so that we can have a clean array for checking isValid
        input[HOUR] += toInt((config._tzm || 0) / 60);
        input[MINUTE] += toInt((config._tzm || 0) % 60);

        config._d = (config._useUTC ? makeUTCDate : makeDate).apply(null, input);
    }

    function dateFromObject(config) {
        var normalizedInput;

        if (config._d) {
            return;
        }

        normalizedInput = normalizeObjectUnits(config._i);
        config._a = [
            normalizedInput.year,
            normalizedInput.month,
            normalizedInput.day,
            normalizedInput.hour,
            normalizedInput.minute,
            normalizedInput.second,
            normalizedInput.millisecond
        ];

        dateFromConfig(config);
    }

    function currentDateArray(config) {
        var now = new Date();
        if (config._useUTC) {
            return [
                now.getUTCFullYear(),
                now.getUTCMonth(),
                now.getUTCDate()
            ];
        } else {
            return [now.getFullYear(), now.getMonth(), now.getDate()];
        }
    }

    // date from string and format string
    function makeDateFromStringAndFormat(config) {

        config._a = [];
        config._pf.empty = true;

        // This array is used to make a Date, either with `new Date` or `Date.UTC`
        var lang = getLangDefinition(config._l),
            string = '' + config._i,
            i, parsedInput, tokens, token, skipped,
            stringLength = string.length,
            totalParsedInputLength = 0;

        tokens = expandFormat(config._f, lang).match(formattingTokens) || [];

        for (i = 0; i < tokens.length; i++) {
            token = tokens[i];
            parsedInput = (getParseRegexForToken(token, config).exec(string) || [])[0];
            if (parsedInput) {
                skipped = string.substr(0, string.indexOf(parsedInput));
                if (skipped.length > 0) {
                    config._pf.unusedInput.push(skipped);
                }
                string = string.slice(string.indexOf(parsedInput) + parsedInput.length);
                totalParsedInputLength += parsedInput.length;
            }
            // don't parse if it's not a known token
            if (formatTokenFunctions[token]) {
                if (parsedInput) {
                    config._pf.empty = false;
                }
                else {
                    config._pf.unusedTokens.push(token);
                }
                addTimeToArrayFromToken(token, parsedInput, config);
            }
            else if (config._strict && !parsedInput) {
                config._pf.unusedTokens.push(token);
            }
        }

        // add remaining unparsed input length to the string
        config._pf.charsLeftOver = stringLength - totalParsedInputLength;
        if (string.length > 0) {
            config._pf.unusedInput.push(string);
        }

        // handle am pm
        if (config._isPm && config._a[HOUR] < 12) {
            config._a[HOUR] += 12;
        }
        // if is 12 am, change hours to 0
        if (config._isPm === false && config._a[HOUR] === 12) {
            config._a[HOUR] = 0;
        }

        dateFromConfig(config);
        checkOverflow(config);
    }

    function unescapeFormat(s) {
        return s.replace(/\\(\[)|\\(\])|\[([^\]\[]*)\]|\\(.)/g, function (matched, p1, p2, p3, p4) {
            return p1 || p2 || p3 || p4;
        });
    }

    // Code from http://stackoverflow.com/questions/3561493/is-there-a-regexp-escape-function-in-javascript
    function regexpEscape(s) {
        return s.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
    }

    // date from string and array of format strings
    function makeDateFromStringAndArray(config) {
        var tempConfig,
            bestMoment,

            scoreToBeat,
            i,
            currentScore;

        if (config._f.length === 0) {
            config._pf.invalidFormat = true;
            config._d = new Date(NaN);
            return;
        }

        for (i = 0; i < config._f.length; i++) {
            currentScore = 0;
            tempConfig = extend({}, config);
            initializeParsingFlags(tempConfig);
            tempConfig._f = config._f[i];
            makeDateFromStringAndFormat(tempConfig);

            if (!isValid(tempConfig)) {
                continue;
            }

            // if there is any input that was not parsed add a penalty for that format
            currentScore += tempConfig._pf.charsLeftOver;

            //or tokens
            currentScore += tempConfig._pf.unusedTokens.length * 10;

            tempConfig._pf.score = currentScore;

            if (scoreToBeat == null || currentScore < scoreToBeat) {
                scoreToBeat = currentScore;
                bestMoment = tempConfig;
            }
        }

        extend(config, bestMoment || tempConfig);
    }

    // date from iso format
    function makeDateFromString(config) {
        var i,
            string = config._i,
            match = isoRegex.exec(string);

        if (match) {
            for (i = 4; i > 0; i--) {
                if (match[i]) {
                    // match[5] should be "T" or undefined
                    config._f = isoDates[i - 1] + (match[6] || " ");
                    break;
                }
            }
            for (i = 0; i < 4; i++) {
                if (isoTimes[i][1].exec(string)) {
                    config._f += isoTimes[i][0];
                    break;
                }
            }
            if (parseTokenTimezone.exec(string)) {
                config._f += " Z";
            }
            makeDateFromStringAndFormat(config);
        }
        else {
            config._d = new Date(string);
        }
    }

    function makeDateFromInput(config) {
        var input = config._i,
            matched = aspNetJsonRegex.exec(input);

        if (input === undefined) {
            config._d = new Date();
        } else if (matched) {
            config._d = new Date(+matched[1]);
        } else if (typeof input === 'string') {
            makeDateFromString(config);
        } else if (isArray(input)) {
            config._a = input.slice(0);
            dateFromConfig(config);
        } else if (isDate(input)) {
            config._d = new Date(+input);
        } else if (typeof(input) === 'object') {
            dateFromObject(config);
        } else {
            config._d = new Date(input);
        }
    }

    function makeDate(y, m, d, h, M, s, ms) {
        //can't just apply() to create a date:
        //http://stackoverflow.com/questions/181348/instantiating-a-javascript-object-by-calling-prototype-constructor-apply
        var date = new Date(y, m, d, h, M, s, ms);

        //the date constructor doesn't accept years < 1970
        if (y < 1970) {
            date.setFullYear(y);
        }
        return date;
    }

    function makeUTCDate(y) {
        var date = new Date(Date.UTC.apply(null, arguments));
        if (y < 1970) {
            date.setUTCFullYear(y);
        }
        return date;
    }

    function parseWeekday(input, language) {
        if (typeof input === 'string') {
            if (!isNaN(input)) {
                input = parseInt(input, 10);
            }
            else {
                input = language.weekdaysParse(input);
                if (typeof input !== 'number') {
                    return null;
                }
            }
        }
        return input;
    }

    /************************************
        Relative Time
    ************************************/


    // helper function for moment.fn.from, moment.fn.fromNow, and moment.duration.fn.humanize
    function substituteTimeAgo(string, number, withoutSuffix, isFuture, lang) {
        return lang.relativeTime(number || 1, !!withoutSuffix, string, isFuture);
    }

    function relativeTime(milliseconds, withoutSuffix, lang) {
        var seconds = round(Math.abs(milliseconds) / 1000),
            minutes = round(seconds / 60),
            hours = round(minutes / 60),
            days = round(hours / 24),
            years = round(days / 365),
            args = seconds < 45 && ['s', seconds] ||
                minutes === 1 && ['m'] ||
                minutes < 45 && ['mm', minutes] ||
                hours === 1 && ['h'] ||
                hours < 22 && ['hh', hours] ||
                days === 1 && ['d'] ||
                days <= 25 && ['dd', days] ||
                days <= 45 && ['M'] ||
                days < 345 && ['MM', round(days / 30)] ||
                years === 1 && ['y'] || ['yy', years];
        args[2] = withoutSuffix;
        args[3] = milliseconds > 0;
        args[4] = lang;
        return substituteTimeAgo.apply({}, args);
    }


    /************************************
        Week of Year
    ************************************/


    // firstDayOfWeek       0 = sun, 6 = sat
    //                      the day of the week that starts the week
    //                      (usually sunday or monday)
    // firstDayOfWeekOfYear 0 = sun, 6 = sat
    //                      the first week is the week that contains the first
    //                      of this day of the week
    //                      (eg. ISO weeks use thursday (4))
    function weekOfYear(mom, firstDayOfWeek, firstDayOfWeekOfYear) {
        var end = firstDayOfWeekOfYear - firstDayOfWeek,
            daysToDayOfWeek = firstDayOfWeekOfYear - mom.day(),
            adjustedMoment;


        if (daysToDayOfWeek > end) {
            daysToDayOfWeek -= 7;
        }

        if (daysToDayOfWeek < end - 7) {
            daysToDayOfWeek += 7;
        }

        adjustedMoment = moment(mom).add('d', daysToDayOfWeek);
        return {
            week: Math.ceil(adjustedMoment.dayOfYear() / 7),
            year: adjustedMoment.year()
        };
    }

    //http://en.wikipedia.org/wiki/ISO_week_date#Calculating_a_date_given_the_year.2C_week_number_and_weekday
    function dayOfYearFromWeeks(year, week, weekday, firstDayOfWeekOfYear, firstDayOfWeek) {
        var d = new Date(Date.UTC(year, 0)).getUTCDay(),
            daysToAdd, dayOfYear;

        weekday = weekday != null ? weekday : firstDayOfWeek;
        daysToAdd = firstDayOfWeek - d + (d > firstDayOfWeekOfYear ? 7 : 0);
        dayOfYear = 7 * (week - 1) + (weekday - firstDayOfWeek) + daysToAdd + 1;

        return {
            year: dayOfYear > 0 ? year : year - 1,
            dayOfYear: dayOfYear > 0 ?  dayOfYear : daysInYear(year - 1) + dayOfYear
        };
    }

    /************************************
        Top Level Functions
    ************************************/

    function makeMoment(config) {
        var input = config._i,
            format = config._f;

        if (typeof config._pf === 'undefined') {
            initializeParsingFlags(config);
        }

        if (input === null) {
            return moment.invalid({nullInput: true});
        }

        if (typeof input === 'string') {
            config._i = input = getLangDefinition().preparse(input);
        }


        if (moment.isMoment(input)) {
            config = extend({}, input);

            config._d = new Date(+input._d);
        } else if (format) {
            if (isArray(format)) {
                makeDateFromStringAndArray(config);
            } else {
                makeDateFromStringAndFormat(config);
            }
        } else {
            makeDateFromInput(config);
        }

        return new Moment(config);
    }

    moment = function (input, format, lang, strict) {
        if (typeof(lang) === "boolean") {
            strict = lang;
            lang = undefined;
        }
        return makeMoment({
            _i : input,
            _f : format,
            _l : lang,
            _strict : strict,
            _isUTC : false
        });
    };

    // creating with utc
    moment.utc = function (input, format, lang, strict) {
        var m;

        if (typeof(lang) === "boolean") {
            strict = lang;
            lang = undefined;
        }
        m = makeMoment({
            _useUTC : true,
            _isUTC : true,
            _l : lang,
            _i : input,
            _f : format,
            _strict : strict
        }).utc();

        return m;
    };

    // creating with unix timestamp (in seconds)
    moment.unix = function (input) {
        return moment(input * 1000);
    };

    // duration
    moment.duration = function (input, key) {
        var isDuration = moment.isDuration(input),
            isNumber = (typeof input === 'number'),
            duration = (isDuration ? input._input : (isNumber ? {} : input)),
            // matching against regexp is expensive, do it on demand
            match = null,
            sign,
            ret,
            parseIso,
            timeEmpty,
            dateTimeEmpty;

        if (isNumber) {
            if (key) {
                duration[key] = input;
            } else {
                duration.milliseconds = input;
            }
        } else if (!!(match = aspNetTimeSpanJsonRegex.exec(input))) {
            sign = (match[1] === "-") ? -1 : 1;
            duration = {
                y: 0,
                d: toInt(match[DATE]) * sign,
                h: toInt(match[HOUR]) * sign,
                m: toInt(match[MINUTE]) * sign,
                s: toInt(match[SECOND]) * sign,
                ms: toInt(match[MILLISECOND]) * sign
            };
        } else if (!!(match = isoDurationRegex.exec(input))) {
            sign = (match[1] === "-") ? -1 : 1;
            parseIso = function (inp) {
                // We'd normally use ~~inp for this, but unfortunately it also
                // converts floats to ints.
                // inp may be undefined, so careful calling replace on it.
                var res = inp && parseFloat(inp.replace(',', '.'));
                // apply sign while we're at it
                return (isNaN(res) ? 0 : res) * sign;
            };
            duration = {
                y: parseIso(match[2]),
                M: parseIso(match[3]),
                d: parseIso(match[4]),
                h: parseIso(match[5]),
                m: parseIso(match[6]),
                s: parseIso(match[7]),
                w: parseIso(match[8])
            };
        }

        ret = new Duration(duration);

        if (isDuration && input.hasOwnProperty('_lang')) {
            ret._lang = input._lang;
        }

        return ret;
    };

    // version number
    moment.version = VERSION;

    // default format
    moment.defaultFormat = isoFormat;

    // This function will be called whenever a moment is mutated.
    // It is intended to keep the offset in sync with the timezone.
    moment.updateOffset = function () {};

    // This function will load languages and then set the global language.  If
    // no arguments are passed in, it will simply return the current global
    // language key.
    moment.lang = function (key, values) {
        var r;
        if (!key) {
            return moment.fn._lang._abbr;
        }
        if (values) {
            loadLang(normalizeLanguage(key), values);
        } else if (values === null) {
            unloadLang(key);
            key = 'en';
        } else if (!languages[key]) {
            getLangDefinition(key);
        }
        r = moment.duration.fn._lang = moment.fn._lang = getLangDefinition(key);
        return r._abbr;
    };

    // returns language data
    moment.langData = function (key) {
        if (key && key._lang && key._lang._abbr) {
            key = key._lang._abbr;
        }
        return getLangDefinition(key);
    };

    // compare moment object
    moment.isMoment = function (obj) {
        return obj instanceof Moment;
    };

    // for typechecking Duration objects
    moment.isDuration = function (obj) {
        return obj instanceof Duration;
    };

    for (i = lists.length - 1; i >= 0; --i) {
        makeList(lists[i]);
    }

    moment.normalizeUnits = function (units) {
        return normalizeUnits(units);
    };

    moment.invalid = function (flags) {
        var m = moment.utc(NaN);
        if (flags != null) {
            extend(m._pf, flags);
        }
        else {
            m._pf.userInvalidated = true;
        }

        return m;
    };

    moment.parseZone = function (input) {
        return moment(input).parseZone();
    };

    /************************************
        Moment Prototype
    ************************************/


    extend(moment.fn = Moment.prototype, {

        clone : function () {
            return moment(this);
        },

        valueOf : function () {
            return +this._d + ((this._offset || 0) * 60000);
        },

        unix : function () {
            return Math.floor(+this / 1000);
        },

        toString : function () {
            return this.clone().lang('en').format("ddd MMM DD YYYY HH:mm:ss [GMT]ZZ");
        },

        toDate : function () {
            return this._offset ? new Date(+this) : this._d;
        },

        toISOString : function () {
            return formatMoment(moment(this).utc(), 'YYYY-MM-DD[T]HH:mm:ss.SSS[Z]');
        },

        toArray : function () {
            var m = this;
            return [
                m.year(),
                m.month(),
                m.date(),
                m.hours(),
                m.minutes(),
                m.seconds(),
                m.milliseconds()
            ];
        },

        isValid : function () {
            return isValid(this);
        },

        isDSTShifted : function () {

            if (this._a) {
                return this.isValid() && compareArrays(this._a, (this._isUTC ? moment.utc(this._a) : moment(this._a)).toArray()) > 0;
            }

            return false;
        },

        parsingFlags : function () {
            return extend({}, this._pf);
        },

        invalidAt: function () {
            return this._pf.overflow;
        },

        utc : function () {
            return this.zone(0);
        },

        local : function () {
            this.zone(0);
            this._isUTC = false;
            return this;
        },

        format : function (inputString) {
            var output = formatMoment(this, inputString || moment.defaultFormat);
            return this.lang().postformat(output);
        },

        add : function (input, val) {
            var dur;
            // switch args to support add('s', 1) and add(1, 's')
            if (typeof input === 'string') {
                dur = moment.duration(+val, input);
            } else {
                dur = moment.duration(input, val);
            }
            addOrSubtractDurationFromMoment(this, dur, 1);
            return this;
        },

        subtract : function (input, val) {
            var dur;
            // switch args to support subtract('s', 1) and subtract(1, 's')
            if (typeof input === 'string') {
                dur = moment.duration(+val, input);
            } else {
                dur = moment.duration(input, val);
            }
            addOrSubtractDurationFromMoment(this, dur, -1);
            return this;
        },

        diff : function (input, units, asFloat) {
            var that = this._isUTC ? moment(input).zone(this._offset || 0) : moment(input).local(),
                zoneDiff = (this.zone() - that.zone()) * 6e4,
                diff, output;

            units = normalizeUnits(units);

            if (units === 'year' || units === 'month') {
                // average number of days in the months in the given dates
                diff = (this.daysInMonth() + that.daysInMonth()) * 432e5; // 24 * 60 * 60 * 1000 / 2
                // difference in months
                output = ((this.year() - that.year()) * 12) + (this.month() - that.month());
                // adjust by taking difference in days, average number of days
                // and dst in the given months.
                output += ((this - moment(this).startOf('month')) -
                        (that - moment(that).startOf('month'))) / diff;
                // same as above but with zones, to negate all dst
                output -= ((this.zone() - moment(this).startOf('month').zone()) -
                        (that.zone() - moment(that).startOf('month').zone())) * 6e4 / diff;
                if (units === 'year') {
                    output = output / 12;
                }
            } else {
                diff = (this - that);
                output = units === 'second' ? diff / 1e3 : // 1000
                    units === 'minute' ? diff / 6e4 : // 1000 * 60
                    units === 'hour' ? diff / 36e5 : // 1000 * 60 * 60
                    units === 'day' ? (diff - zoneDiff) / 864e5 : // 1000 * 60 * 60 * 24, negate dst
                    units === 'week' ? (diff - zoneDiff) / 6048e5 : // 1000 * 60 * 60 * 24 * 7, negate dst
                    diff;
            }
            return asFloat ? output : absRound(output);
        },

        from : function (time, withoutSuffix) {
            return moment.duration(this.diff(time)).lang(this.lang()._abbr).humanize(!withoutSuffix);
        },

        fromNow : function (withoutSuffix) {
            return this.from(moment(), withoutSuffix);
        },

        calendar : function () {
            var diff = this.diff(moment().zone(this.zone()).startOf('day'), 'days', true),
                format = diff < -6 ? 'sameElse' :
                diff < -1 ? 'lastWeek' :
                diff < 0 ? 'lastDay' :
                diff < 1 ? 'sameDay' :
                diff < 2 ? 'nextDay' :
                diff < 7 ? 'nextWeek' : 'sameElse';
            return this.format(this.lang().calendar(format, this));
        },

        isLeapYear : function () {
            return isLeapYear(this.year());
        },

        isDST : function () {
            return (this.zone() < this.clone().month(0).zone() ||
                this.zone() < this.clone().month(5).zone());
        },

        day : function (input) {
            var day = this._isUTC ? this._d.getUTCDay() : this._d.getDay();
            if (input != null) {
                input = parseWeekday(input, this.lang());
                return this.add({ d : input - day });
            } else {
                return day;
            }
        },

        month : function (input) {
            var utc = this._isUTC ? 'UTC' : '',
                dayOfMonth;

            if (input != null) {
                if (typeof input === 'string') {
                    input = this.lang().monthsParse(input);
                    if (typeof input !== 'number') {
                        return this;
                    }
                }

                dayOfMonth = this.date();
                this.date(1);
                this._d['set' + utc + 'Month'](input);
                this.date(Math.min(dayOfMonth, this.daysInMonth()));

                moment.updateOffset(this);
                return this;
            } else {
                return this._d['get' + utc + 'Month']();
            }
        },

        startOf: function (units) {
            units = normalizeUnits(units);
            // the following switch intentionally omits break keywords
            // to utilize falling through the cases.
            switch (units) {
            case 'year':
                this.month(0);
                /* falls through */
            case 'month':
                this.date(1);
                /* falls through */
            case 'week':
            case 'isoWeek':
            case 'day':
                this.hours(0);
                /* falls through */
            case 'hour':
                this.minutes(0);
                /* falls through */
            case 'minute':
                this.seconds(0);
                /* falls through */
            case 'second':
                this.milliseconds(0);
                /* falls through */
            }

            // weeks are a special case
            if (units === 'week') {
                this.weekday(0);
            } else if (units === 'isoWeek') {
                this.isoWeekday(1);
            }

            return this;
        },

        endOf: function (units) {
            units = normalizeUnits(units);
            return this.startOf(units).add((units === 'isoWeek' ? 'week' : units), 1).subtract('ms', 1);
        },

        isAfter: function (input, units) {
            units = typeof units !== 'undefined' ? units : 'millisecond';
            return +this.clone().startOf(units) > +moment(input).startOf(units);
        },

        isBefore: function (input, units) {
            units = typeof units !== 'undefined' ? units : 'millisecond';
            return +this.clone().startOf(units) < +moment(input).startOf(units);
        },

        isSame: function (input, units) {
            units = typeof units !== 'undefined' ? units : 'millisecond';
            return +this.clone().startOf(units) === +moment(input).startOf(units);
        },

        min: function (other) {
            other = moment.apply(null, arguments);
            return other < this ? this : other;
        },

        max: function (other) {
            other = moment.apply(null, arguments);
            return other > this ? this : other;
        },

        zone : function (input) {
            var offset = this._offset || 0;
            if (input != null) {
                if (typeof input === "string") {
                    input = timezoneMinutesFromString(input);
                }
                if (Math.abs(input) < 16) {
                    input = input * 60;
                }
                this._offset = input;
                this._isUTC = true;
                if (offset !== input) {
                    addOrSubtractDurationFromMoment(this, moment.duration(offset - input, 'm'), 1, true);
                }
            } else {
                return this._isUTC ? offset : this._d.getTimezoneOffset();
            }
            return this;
        },

        zoneAbbr : function () {
            return this._isUTC ? "UTC" : "";
        },

        zoneName : function () {
            return this._isUTC ? "Coordinated Universal Time" : "";
        },

        parseZone : function () {
            if (typeof this._i === 'string') {
                this.zone(this._i);
            }
            return this;
        },

        hasAlignedHourOffset : function (input) {
            if (!input) {
                input = 0;
            }
            else {
                input = moment(input).zone();
            }

            return (this.zone() - input) % 60 === 0;
        },

        daysInMonth : function () {
            return daysInMonth(this.year(), this.month());
        },

        dayOfYear : function (input) {
            var dayOfYear = round((moment(this).startOf('day') - moment(this).startOf('year')) / 864e5) + 1;
            return input == null ? dayOfYear : this.add("d", (input - dayOfYear));
        },

        weekYear : function (input) {
            var year = weekOfYear(this, this.lang()._week.dow, this.lang()._week.doy).year;
            return input == null ? year : this.add("y", (input - year));
        },

        isoWeekYear : function (input) {
            var year = weekOfYear(this, 1, 4).year;
            return input == null ? year : this.add("y", (input - year));
        },

        week : function (input) {
            var week = this.lang().week(this);
            return input == null ? week : this.add("d", (input - week) * 7);
        },

        isoWeek : function (input) {
            var week = weekOfYear(this, 1, 4).week;
            return input == null ? week : this.add("d", (input - week) * 7);
        },

        weekday : function (input) {
            var weekday = (this.day() + 7 - this.lang()._week.dow) % 7;
            return input == null ? weekday : this.add("d", input - weekday);
        },

        isoWeekday : function (input) {
            // behaves the same as moment#day except
            // as a getter, returns 7 instead of 0 (1-7 range instead of 0-6)
            // as a setter, sunday should belong to the previous week.
            return input == null ? this.day() || 7 : this.day(this.day() % 7 ? input : input - 7);
        },

        get : function (units) {
            units = normalizeUnits(units);
            return this[units]();
        },

        set : function (units, value) {
            units = normalizeUnits(units);
            if (typeof this[units] === 'function') {
                this[units](value);
            }
            return this;
        },

        // If passed a language key, it will set the language for this
        // instance.  Otherwise, it will return the language configuration
        // variables for this instance.
        lang : function (key) {
            if (key === undefined) {
                return this._lang;
            } else {
                this._lang = getLangDefinition(key);
                return this;
            }
        }
    });

    // helper for adding shortcuts
    function makeGetterAndSetter(name, key) {
        moment.fn[name] = moment.fn[name + 's'] = function (input) {
            var utc = this._isUTC ? 'UTC' : '';
            if (input != null) {
                this._d['set' + utc + key](input);
                moment.updateOffset(this);
                return this;
            } else {
                return this._d['get' + utc + key]();
            }
        };
    }

    // loop through and add shortcuts (Month, Date, Hours, Minutes, Seconds, Milliseconds)
    for (i = 0; i < proxyGettersAndSetters.length; i ++) {
        makeGetterAndSetter(proxyGettersAndSetters[i].toLowerCase().replace(/s$/, ''), proxyGettersAndSetters[i]);
    }

    // add shortcut for year (uses different syntax than the getter/setter 'year' == 'FullYear')
    makeGetterAndSetter('year', 'FullYear');

    // add plural methods
    moment.fn.days = moment.fn.day;
    moment.fn.months = moment.fn.month;
    moment.fn.weeks = moment.fn.week;
    moment.fn.isoWeeks = moment.fn.isoWeek;

    // add aliased format methods
    moment.fn.toJSON = moment.fn.toISOString;

    /************************************
        Duration Prototype
    ************************************/


    extend(moment.duration.fn = Duration.prototype, {

        _bubble : function () {
            var milliseconds = this._milliseconds,
                days = this._days,
                months = this._months,
                data = this._data,
                seconds, minutes, hours, years;

            // The following code bubbles up values, see the tests for
            // examples of what that means.
            data.milliseconds = milliseconds % 1000;

            seconds = absRound(milliseconds / 1000);
            data.seconds = seconds % 60;

            minutes = absRound(seconds / 60);
            data.minutes = minutes % 60;

            hours = absRound(minutes / 60);
            data.hours = hours % 24;

            days += absRound(hours / 24);
            data.days = days % 30;

            months += absRound(days / 30);
            data.months = months % 12;

            years = absRound(months / 12);
            data.years = years;
        },

        weeks : function () {
            return absRound(this.days() / 7);
        },

        valueOf : function () {
            return this._milliseconds +
              this._days * 864e5 +
              (this._months % 12) * 2592e6 +
              toInt(this._months / 12) * 31536e6;
        },

        humanize : function (withSuffix) {
            var difference = +this,
                output = relativeTime(difference, !withSuffix, this.lang());

            if (withSuffix) {
                output = this.lang().pastFuture(difference, output);
            }

            return this.lang().postformat(output);
        },

        add : function (input, val) {
            // supports only 2.0-style add(1, 's') or add(moment)
            var dur = moment.duration(input, val);

            this._milliseconds += dur._milliseconds;
            this._days += dur._days;
            this._months += dur._months;

            this._bubble();

            return this;
        },

        subtract : function (input, val) {
            var dur = moment.duration(input, val);

            this._milliseconds -= dur._milliseconds;
            this._days -= dur._days;
            this._months -= dur._months;

            this._bubble();

            return this;
        },

        get : function (units) {
            units = normalizeUnits(units);
            return this[units.toLowerCase() + 's']();
        },

        as : function (units) {
            units = normalizeUnits(units);
            return this['as' + units.charAt(0).toUpperCase() + units.slice(1) + 's']();
        },

        lang : moment.fn.lang,

        toIsoString : function () {
            // inspired by https://github.com/dordille/moment-isoduration/blob/master/moment.isoduration.js
            var years = Math.abs(this.years()),
                months = Math.abs(this.months()),
                days = Math.abs(this.days()),
                hours = Math.abs(this.hours()),
                minutes = Math.abs(this.minutes()),
                seconds = Math.abs(this.seconds() + this.milliseconds() / 1000);

            if (!this.asSeconds()) {
                // this is the same as C#'s (Noda) and python (isodate)...
                // but not other JS (goog.date)
                return 'P0D';
            }

            return (this.asSeconds() < 0 ? '-' : '') +
                'P' +
                (years ? years + 'Y' : '') +
                (months ? months + 'M' : '') +
                (days ? days + 'D' : '') +
                ((hours || minutes || seconds) ? 'T' : '') +
                (hours ? hours + 'H' : '') +
                (minutes ? minutes + 'M' : '') +
                (seconds ? seconds + 'S' : '');
        }
    });

    function makeDurationGetter(name) {
        moment.duration.fn[name] = function () {
            return this._data[name];
        };
    }

    function makeDurationAsGetter(name, factor) {
        moment.duration.fn['as' + name] = function () {
            return +this / factor;
        };
    }

    for (i in unitMillisecondFactors) {
        if (unitMillisecondFactors.hasOwnProperty(i)) {
            makeDurationAsGetter(i, unitMillisecondFactors[i]);
            makeDurationGetter(i.toLowerCase());
        }
    }

    makeDurationAsGetter('Weeks', 6048e5);
    moment.duration.fn.asMonths = function () {
        return (+this - this.years() * 31536e6) / 2592e6 + this.years() * 12;
    };


    /************************************
        Default Lang
    ************************************/


    // Set default language, other languages will inherit from English.
    moment.lang('en', {
        ordinal : function (number) {
            var b = number % 10,
                output = (toInt(number % 100 / 10) === 1) ? 'th' :
                (b === 1) ? 'st' :
                (b === 2) ? 'nd' :
                (b === 3) ? 'rd' : 'th';
            return number + output;
        }
    });

    /* EMBED_LANGUAGES */

    /************************************
        Exposing Moment
    ************************************/

    function makeGlobal() {
        /*global ender:false */
        if (typeof ender === 'undefined') {
            // here, `this` means `window` in the browser, or `global` on the server
            // add `moment` as a global object via a string identifier,
            // for Closure Compiler "advanced" mode
            this['moment'] = moment;
        }
    }

    // CommonJS module is defined
    if (hasModule) {
        module.exports = moment;
        makeGlobal();
    } else if (typeof define === "function" && define.amd) {
        define("moment", function (require, exports, module) {
            if (module.config().noGlobal !== true) {
                makeGlobal();
            }

            return moment;
        });
    } else {
        makeGlobal();
    }
}).call(this);

function WeeWorldNotificationEvent(eventId, eventParams, link)
{
    //console.log("id:" + eventId + ", params:" + eventParams + ", link:" + link);
    
	switch (eventId)
    {
	    // Notifications events
	    case "open_notifications":
	        // Params is number of unread messages displayed to the user
	        // action, label, category, value
	        sendEventTrackingTag("Click on bell", "", "Notification", eventParams);
	        break;
	    case "click_user_thumbnail":
	        // Link   : redirect url
            // Category : "Notifications"
	        // Action :  i.e. Message thumbnail, or Friend request thumbnail
	        // Label  : read, or unread
	        // Value  : index
	        recordOutboundLink(link, "Notification", eventParams.t + " thumbnail", eventParams.b, eventParams.i);
	        break;
	    case "click_username":
	        // Link   : redirect url
	        // Category : "Notifications"
	        // Action :  i.e. Message thumbnail, or Friend request thumbnail
	        // Label  : read, or unread
	        // Value  : index
	        recordOutboundLink(link, "Notification", eventParams.t + " username", eventParams.b, eventParams.i);
	        break;
	    case "click_notification_text":
	        // Link   : redirect url
	        // Category : "Notifications"
	        // Action :  i.e. Message text, or Friend request text
	        // Label  : read, or unread
	        // Value  : index
	        recordOutboundLink(link, "Notification", eventParams.t + " text", eventParams.b, eventParams.i);
	        break;
	    case "click_notification_image":
	        // Link   : redirect url
	        // Category : "Notifications"
	        // Action :  i.e. Message image, or Friend request image
	        // Label  : read, or unread
	        // Value  : index
	        recordOutboundLink(link, "Notification", eventParams.t + " image", eventParams.b, eventParams.i);
	        break;
	    case "click_notification_container":
	        // Link   : redirect url
	        // Category : "Notifications"
	        // Action :  i.e. Message container, or Message text
	        // Label  : read, or unread
	        // Value  : index
	        recordOutboundLink(link, "Notification", eventParams.t + " container", eventParams.b, eventParams.i);
	        break;
		default:
			break;
		
		return true;
	}
}
jQuery(document).ready(function ($) {

    // Initialise notification scrollbar properties
    jQuery("#notiScroll").mCustomScrollbar({
        autoHideScrollbar: true,
        theme: "dark-thick"
    });

    // Click event for top level menu item
    jQuery("A#UserNotificationsClick").click(function (e) {
        e.preventDefault();

        if (!jQuery("#notiDropdown").is(':visible')) {
            
            // Clear current notifications, and add placeholder
            jQuery('ul#notiList').empty();
            jQuery('.notiSummary').text('');

            // Hide unread state
            jQuery('#unreadbg').hide();

            jQuery('ul#notiList').append('<li class=\"notiSpinner\"></li>');
            // Show notifications and refresh scrollbar
            jQuery("A#UserNotificationsClick").addClass('selected');
            jQuery("#notiDropdown").show();

            // Get number of notifications displayed to the user
            var notiCounter = jQuery('#notiCounter').html();
            if (notiCounter == '') {
                notiCounter = 0;
            }
            // Raise notification
            WeeWorldNotificationEvent('open_notifications', notiCounter, null);

            // Dropdown isn't currently on display, get current notification json
            WeeWorld.Web.services.Notifications.GetNotifications(GetNotifications_SuccessCallback);
        }
        else {
            // Dropdown is displayed, close it
            closeDropDown();
        }
    });

    // Prevent click event on notification drop down
    jQuery("#notiDropdown *").click(function (e) {
        e.stopPropagation();
    });
    
    // Notifications list has been returned
    function GetNotifications_SuccessCallback(data) {
        // Parse notifications from json string representation
        var notifications = JSON.parse(data);

        // Total number of items we're displaying
        var totalItems = 0;

        // Clear current notifications placeholder that we're showing
        jQuery('ul#notiList').empty();

        // For analytics reporting, so start index at 1
        var index = 1;
        // Loop through each top level bucket (read, and unread)
        jQuery.each(notifications, function (notificationBucket, val) {

            // Parse notification bucket and apply the templates to each display notification
            jQuery.each(this, function () {

                // Write index and new flag to object
                this.bucket = notificationBucket;
                this.index = index;
                index++;

                var templateName = this.t.toLowerCase().replace(/ /g, '');
                if (this.g) {
                    totalItems += this.gc;
                }
                else {
                    // Increment the item count by one
                    totalItems++;
                }

                // Render html template
                var rendered_html = render(templateName, this);
                var output = rendered_html;

                // Add html wrapped in a listitem to notification list
                jQuery('ul#notiList').append(output);
            });
        });
       
        // Check total number of notifications
        if (totalItems == 0) {
            // Apply no message template
            jQuery('.notiSummary').text('You have no recent notifications');
            jQuery('ul#notiList').append('<li class=\"notiEmpty\"></li>');
        }
        else {
            jQuery('.notiSummary').text('Your notifications');
        }
        
        jQuery("#notiScroll").mCustomScrollbar('update');

        // Apply new item background if required
        var templateHeight = 62;
        var unreadHeight = notifications["unread"].length * templateHeight;

        if (unreadHeight > 0) {
            jQuery('#unreadbg').show();
            jQuery('#unreadbg').css({ "height": unreadHeight + 'px' });
        }

        // Register click to close dropdown
        jQuery('body').on('click', closeDropDown);
    }

    // Closes the drop down list
    function closeDropDown() {
        // Deselect the notifications button and hide the menu
        jQuery("A#UserNotificationsClick").removeClass('selected');
        jQuery("#notiDropdown").hide();

        // Unregister click event that closes drop down
        jQuery('body').off('click', closeDropDown);

        // Mark any new notifications as read
        WeeWorld.Web.services.Notifications.MarkNotificationsAsRead(MarkNotificationsAsRead_SuccessCallback);
    }

    // Update client to show that notifications have been marked as read
    function MarkNotificationsAsRead_SuccessCallback(data) {
        // Clear and hide notification counter
        jQuery('#notiCounter').html('');
        jQuery('#notiCounter').hide();
    }

    // Render notifications template
    function render(templateName, data) {
        if (!render.tmpl_cache) {
            render.tmpl_cache = {};
        }

        if (!render.tmpl_cache[templateName]) {
            var tmpl_dir = Utilities.getRootUrl() + 'notifications/templates';
            var tmpl_url = tmpl_dir + '/' + templateName + '.html';
            var err = false;
            var tmpl_string;
            jQuery.ajax({
                url: tmpl_url,
                method: 'GET',
                async: false,
                success: function (data) {
                    tmpl_string = data;
                },
                error: function()
                {
                    err = true;
                }
            });

            if (err) {
                // Template not implemented, don't try to compile this and add to the cache
                // just return the unformatted string
                return '<span style="font-size:10px;">' + JSON.stringify(data) + '</span>';
            }
            render.tmpl_cache[templateName] = Handlebars.compile(tmpl_string);
        
        }

        return render.tmpl_cache[templateName](data);
    }

    /* Handlebars helper methods */

    // Gets the imaging url for notifications
    Handlebars.registerHelper("getRootUrl", function () {
        return Utilities.getRootUrl();
    });

    // Converts text input to lower case
    Handlebars.registerHelper("toLower", function (input) {
        return input.toLowerCase();
    });

    // Gets current timestamp
    Handlebars.registerHelper("getTimestamp", function (timestamp) {
        return moment(timestamp, "YYYY-MM-DD HH:mm:ssZ").fromNow();
    });


    // Write event parameters required for actioning a message 
    Handlebars.registerHelper("writeContext", function () {
        // t:notification type, b:bucket, i:index, id:entity id, n: username
        var params = { "t": this.t, "b": this.bucket, "i": this.index};
        return JSON.stringify(params);

    });

    // Is there only a single user affecting any number of entities?
    Handlebars.registerHelper("singleUser", function (g, options) {
        if (g == undefined) {
            // No group defined, single element, true
            return options.fn(this);;
        }
        else {
            if (g.fl == '') {
                // List is undefined, no other users, true
                return options.fn(this);
            }
            else {
                // More than one user in the list, false
                return options.inverse(this);;
            }
        }
    });

    var owner;
    // Load the 
    if (jQuery("#notiDropdown").length > 0) {
        WeeWorld.Web.services.Notifications.GetNotificationOwner(function (data) { owner = data; });
    }

    Handlebars.registerHelper("getOwner", function (timestamp) {
        return owner;
    });

    // Top level container click event
    jQuery("#notiList").on('click', 'li', function (e) {
        e.preventDefault();
        // Get data context for the message
        var containerContext = JSON.parse(jQuery(this).attr('context'));
        var containerLink = jQuery(this).attr('link');
        var link = document.createElement('a');

        // Mark elements as read before redirecting the user
        WeeWorld.Web.services.Notifications.MarkNotificationsAsRead(function () {
            if (jQuery(e.target).hasClass('thumbnail')) {
                // Thumbnail clicked, get link from parent element
                link.href = jQuery(e.target).parent().attr('href');
                WeeWorldNotificationEvent('click_user_thumbnail', containerContext, link);
            }
            else if (jQuery(e.target).hasClass('username')) {
                // Username link clicked
                link.href = e.target;
                WeeWorldNotificationEvent('click_username', containerContext, link);
            }
            else if (jQuery(e.target).hasClass('text')) {
                // Text link clicked
                link.href = e.target;
                WeeWorldNotificationEvent('click_notification_text', containerContext, link);
            }
            else if (jQuery(e.target).hasClass('photo')) {
                // Entity image clicked
                link.setAttribute('href', jQuery(e.target).parent().attr('href'));
                WeeWorldNotificationEvent('click_notification_image', containerContext, link);
            }
            else {
                if (jQuery(e.target).hasClass('notiDate')) {
                    // Date element clicked
                    link.setAttribute('href', jQuery(e.target).parent().parent().attr('link'));
                }
                else if (jQuery(e.target).hasClass('notiText')) {
                    // Info text clicked
                    link.setAttribute('href', jQuery(e.target).parent().attr('link'));
                } else {
                    // Container clicked
                    link.setAttribute('href', jQuery(e.target).attr('link'));
                }
                

                // Container area clicked
                
                WeeWorldNotificationEvent('click_notification_container', containerContext, link);
            }

        });
    });
});
function EventDispatcher(){function n(n,t){this.type=n,this.callback=t}this._listeners=[],this.DispatchEvent=function(n,t){for(var i=0;i<this._listeners.length;i++)this._dispatchIfType(this._listeners[i],n,t)},this._dispatchIfType=function(n,t,i){t==n.type&&n.callback(t,i)},this.AddEventListener=function(t,i){this._listeners.push(new n(t,i))},this.RemoveEventListener=function(n){for(var t=0;t<this._listeners.length;t++)this._removeIfDelegate(this._listeners[t],n)},this._removeIfDelegate=function(n,t){n.callback==t&&this._removeFromArray(this._listeners,n)},this._removeFromArray=function(n,t){var i=this._indexOfWithinArray(n,t);i!=-1&&this._removeFromArrayAtIndex(n,i)},this._indexOfWithinArray=function(n,t){for(var i=0;i<n.length;i++)if(n[i]==t)return i;return-1},this._removeFromArrayAtIndex=function(n,t){this._isValidIndexWithinArray(n,t)&&n.splice(t,1)},this._isValidIndexWithinArray=function(n,t){return t>=0&&t<=n.length-1}}this.JSON||(this.JSON={}),function(){"use strict";function i(n){return n<10?"0"+n:n}function e(n){return f.lastIndex=0,f.test(n)?'"'+n.replace(f,function(n){var t=o[n];return typeof t=="string"?t:"\\u"+("0000"+n.charCodeAt(0).toString(16)).slice(-4)})+'"':'"'+n+'"'}function u(i,f){var c,l,s,a,v=n,h,o=f[i];o&&typeof o=="object"&&typeof o.toJSON=="function"&&(o=o.toJSON(i)),typeof t=="function"&&(o=t.call(f,i,o));switch(typeof o){case"string":return e(o);case"number":return isFinite(o)?String(o):"null";case"boolean":case"null":return String(o);case"object":if(!o)return"null";if(n+=r,h=[],Object.prototype.toString.apply(o)==="[object Array]"){for(a=o.length,c=0;c<a;c+=1)h[c]=u(c,o)||"null";return s=h.length===0?"[]":n?"[\n"+n+h.join(",\n"+n)+"\n"+v+"]":"["+h.join(",")+"]",n=v,s}if(t&&typeof t=="object")for(a=t.length,c=0;c<a;c+=1)l=t[c],typeof l=="string"&&(s=u(l,o),s&&h.push(e(l)+(n?": ":":")+s));else for(l in o)Object.hasOwnProperty.call(o,l)&&(s=u(l,o),s&&h.push(e(l)+(n?": ":":")+s));return s=h.length===0?"{}":n?"{\n"+n+h.join(",\n"+n)+"\n"+v+"}":"{"+h.join(",")+"}",n=v,s}}typeof Date.prototype.toJSON!="function"&&(Date.prototype.toJSON=function(){return isFinite(this.valueOf())?this.getUTCFullYear()+"-"+i(this.getUTCMonth()+1)+"-"+i(this.getUTCDate())+"T"+i(this.getUTCHours())+":"+i(this.getUTCMinutes())+":"+i(this.getUTCSeconds())+"Z":null},String.prototype.toJSON=Number.prototype.toJSON=Boolean.prototype.toJSON=function(){return this.valueOf()});var s=/[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,f=/[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,n,r,o={"\b":"\\b","\t":"\\t","\n":"\\n","\f":"\\f","\r":"\\r",'"':'\\"',"\\":"\\\\"},t;typeof JSON.stringify!="function"&&(JSON.stringify=function(i,f,e){var o;if(n="",r="",typeof e=="number")for(o=0;o<e;o+=1)r+=" ";else typeof e=="string"&&(r=e);if(t=f,f&&typeof f!="function"&&(typeof f!="object"||typeof f.length!="number"))throw new Error("JSON.stringify");return u("",{"":i})})}();var deconcept,oldBeforeUnload;typeof deconcept=="undefined"&&(deconcept={}),typeof deconcept.util=="undefined"&&(deconcept.util={}),typeof deconcept.SWFObjectUtil=="undefined"&&(deconcept.SWFObjectUtil={}),deconcept.SWFObject=function(n,t,i,r,u,f,e,o,s,h,c){var l,a;document.getElementById&&(this.DETECT_KEY=c?c:"detectflash",this.skipDetect=deconcept.util.getRequestParameter(this.DETECT_KEY),this.params={},this.variables={},this.attributes=[],n&&this.setAttribute("swf",n),t&&this.setAttribute("id",t),i&&this.setAttribute("width",i),r&&this.setAttribute("height",r),u&&this.setAttribute("version",new deconcept.PlayerVersion(u.toString().split("."))),this.installedVer=deconcept.SWFObjectUtil.getPlayerVersion(),f&&this.addParam("bgcolor",f),l=o?o:"high",this.addParam("quality",l),this.setAttribute("useExpressInstall",e),this.setAttribute("doExpressInstall",!1),a=s?s:window.location,this.setAttribute("xiRedirectUrl",a),this.setAttribute("redirectUrl",""),h&&this.setAttribute("redirectUrl",h))},deconcept.SWFObject.prototype={setAttribute:function(n,t){this.attributes[n]=t},getAttribute:function(n){return this.attributes[n]},addParam:function(n,t){this.params[n]=t},getParams:function(){return this.params},addVariable:function(n,t){this.variables[n]=t},getVariable:function(n){return this.variables[n]},getVariables:function(){return this.variables},getVariablePairs:function(){var t=[],n,i=this.getVariables();for(n in i)t.push(n+"="+i[n]);return t},getSWFHTML:function(){var n="",i,r,u,t,f;if(navigator.plugins&&navigator.mimeTypes&&navigator.mimeTypes.length){this.getAttribute("doExpressInstall")&&this.addVariable("MMplayerType","PlugIn"),n='<embed type="application/x-shockwave-flash" src="'+this.getAttribute("swf")+'" width="'+this.getAttribute("width")+'" height="'+this.getAttribute("height")+'"',n+=' id="'+this.getAttribute("id")+'" name="'+this.getAttribute("id")+'" ',i=this.getParams();for(t in i)n+=[t]+'="'+i[t]+'" ';r=this.getVariablePairs().join("&"),r.length>0&&(n+='flashvars="'+r+'"'),n+="/>"}else{this.getAttribute("doExpressInstall")&&this.addVariable("MMplayerType","ActiveX"),n='<object id="'+this.getAttribute("id")+'" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="'+this.getAttribute("width")+'" height="'+this.getAttribute("height")+'">',n+='<param name="movie" value="'+this.getAttribute("swf")+'" />',u=this.getParams();for(t in u)n+='<param name="'+t+'" value="'+u[t]+'" />';f=this.getVariablePairs().join("&"),f.length>0&&(n+='<param name="flashvars" value="'+f+'" />'),n+="<\/object>"}return n},write:function(n){var t,i;return(this.getAttribute("useExpressInstall")&&(t=new deconcept.PlayerVersion([6,0,65]),this.installedVer.versionIsValid(t)&&!this.installedVer.versionIsValid(this.getAttribute("version"))&&(this.setAttribute("doExpressInstall",!0),this.addVariable("MMredirectURL",escape(this.getAttribute("xiRedirectUrl"))),document.title=document.title.slice(0,47)+" - Flash Player Installation",this.addVariable("MMdoctitle",document.title))),this.skipDetect||this.getAttribute("doExpressInstall")||this.installedVer.versionIsValid(this.getAttribute("version")))?(i=typeof n=="string"?document.getElementById(n):n,i.innerHTML=this.getSWFHTML(),!0):(this.getAttribute("redirectUrl")!=""&&document.location.replace(this.getAttribute("redirectUrl")),!1)}},deconcept.SWFObjectUtil.getPlayerVersion=function(){var t=new deconcept.PlayerVersion([0,0,0]),i,n;if(navigator.plugins&&navigator.mimeTypes.length)i=navigator.plugins["Shockwave Flash"],i&&i.description&&(t=new deconcept.PlayerVersion(i.description.replace(/([a-zA-Z]|\s)+/,"").replace(/(\s+r|\s+b[0-9]+)/,".").split(".")));else{try{n=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7")}catch(r){try{n=new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6"),t=new deconcept.PlayerVersion([6,0,21]),n.AllowScriptAccess="always"}catch(r){if(t.major==6)return t}try{n=new ActiveXObject("ShockwaveFlash.ShockwaveFlash")}catch(r){}}n!=null&&(t=new deconcept.PlayerVersion(n.GetVariable("$version").split(" ")[1].split(",")))}return t},deconcept.PlayerVersion=function(n){this.major=n[0]!=null?parseInt(n[0]):0,this.minor=n[1]!=null?parseInt(n[1]):0,this.rev=n[2]!=null?parseInt(n[2]):0},deconcept.PlayerVersion.prototype.versionIsValid=function(n){return this.major<n.major?!1:this.major>n.major?!0:this.minor<n.minor?!1:this.minor>n.minor?!0:this.rev<n.rev?!1:!0},deconcept.util={getRequestParameter:function(n){var r=document.location.search||document.location.hash,i,t;if(r)for(i=r.substring(1).split("&"),t=0;t<i.length;t++)if(i[t].substring(0,i[t].indexOf("="))==n)return i[t].substring(i[t].indexOf("=")+1);return""}},deconcept.SWFObjectUtil.cleanupSWFs=function(){var t,n,i;if(!window.opera&&document.all)for(t=document.getElementsByTagName("OBJECT"),n=0;n<t.length;n++){t[n].style.display="none";for(i in t[n])typeof t[n][i]=="function"&&(t[n][i]=function(){})}},deconcept.SWFObjectUtil.prepUnload=function(){if(__flash_unloadHandler=function(){},__flash_savedUnloadHandler=function(){},typeof window.onunload=="function"){var n=window.onunload;window.onunload=function(){deconcept.SWFObjectUtil.cleanupSWFs(),n()}}else window.onunload=deconcept.SWFObjectUtil.cleanupSWFs},typeof window.onbeforeunload=="function"?(oldBeforeUnload=window.onbeforeunload,window.onbeforeunload=function(){deconcept.SWFObjectUtil.prepUnload(),oldBeforeUnload()}):window.onbeforeunload=deconcept.SWFObjectUtil.prepUnload,Array.prototype.push==null&&(Array.prototype.push=function(n){return this[this.length]=n,this.length});var getQueryParamValue=deconcept.util.getRequestParameter,FlashObject=deconcept.SWFObject,SWFObject=deconcept.SWFObject;AjaxJQuery={},AjaxJQuery.ActiveRequests=[],AjaxJQuery.MakeCall=function(n,t,i,r,u){var f=this;return jQuery.ajax({type:"POST",url:this.url,data:JSON.stringify(t),dataType:"json",contentType:"application/json; charset=utf-8",context:u,beforeSend:function(t){AjaxJQuery.ActiveRequests.push(n),t.setRequestHeader("X-AjaxPro-Method",n)},success:function(t){if(AjaxJQuery.ActiveRequests.pop(n),t!=null){if(typeof t.value!="undefined"&&typeof i=="function"){i(t.value,this);return}if(typeof t.error!="undefined"&&typeof r=="function"){r(t.error,this);return}}typeof r=="function"&&r({Type:"",Message:"Failed"})},error:function(t,i,u){AjaxJQuery.ActiveRequests.pop(n),typeof r=="function"&&r({Type:"JQuery."+i,Message:u})}})};function ClientLoggerProto(){this.logToServer=function(n,t,i){function u(n,t,r){var u={msg:n,pn:t};return r!=null&&(u.ep=i),JSON.stringify(u)}var r={logMsg:u(n,t,i)};jQuery.ajax({url:Utilities.getRootUrl()+"logging/ClientLogger.ashx",type:"POST",data:r,success:null})}}var ClientLogger=new ClientLoggerProto;(function(n){for(var t,i=function(){},r="assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,markTimeline,profile,profileEnd,time,timeEnd,trace,warn".split(",");t=r.pop();)n[t]=n[t]||i})(window.console=window.console||{});displayArrow=function(n,t,i){var f,e,s,h,r,l=function(){r.animate({left:f+"px"}).animate({left:e+"px"},l)},a=function(){r.animate({top:s+"px"}).animate({top:h+"px"},a)},o,c,u,v;r=jQuery(t),r.removeAttr("style"),jQuery(n).append(r),r.stop(!0),f=-40,e=-30,s=-40,h=-30,o=i.type,c=o=="left"||o=="right",i!=undefined&&(i.type!==undefined&&(o=="left"?(u=jQuery(n).width(),r.addClass("pointingArrowLeft"),f=u-10,e=u):o=="right"?(u=jQuery(n).width(),r.addClass("pointingArrowRight"),f=u,e=u-10):o=="down"&&(v=jQuery(n).height(),r.addClass("pointingArrowDown"),f=u,e=u-10)),i.css!==undefined&&(r.css(i.css),c?(f=parseInt(r.css("left"))-40,e=parseInt(r.css("left"))-30):(s=parseInt(r.css("top"))-40,h=parseInt(r.css("top"))-30))),r.css("display","block"),c?(r.css("left",f),l()):(r.css("top",s),a())};/*!
* jQuery blockUI plugin
* Version 2.33 (29-MAR-2010)
* @requires jQuery v1.2.3 or later
*
* Examples at: http://malsup.com/jquery/block/
* Copyright (c) 2007-2008 M. Alsup
* Dual licensed under the MIT and GPL licenses:
* http://www.opensource.org/licenses/mit-license.php
* http://www.gnu.org/licenses/gpl.html
*
* Thanks to Amir-Hossein Sobhi for some excellent contributions! 
*/
(function(n){function o(u,e){var o=e&&e.message!==undefined?e.message:undefined,y,d,p,c,nt,tt,rt;e=n.extend({},n.blockUI.defaults,e||{}),e.overlayCSS=n.extend({},n.blockUI.defaults.overlayCSS,e.overlayCSS||{}),y=u==window||e.forcePageOverlay,d=n.extend({},n.blockUI.defaults.css,e.css||{}),o=o===undefined?e.message:o,y&&t&&f(window,{fadeOut:0,forcePageOverlay:e.forcePageOverlay}),o&&typeof o!="string"&&(o.parentNode||o.jquery)&&(p=o.jquery?o[0]:o,c={},n(u).data("blockUI.history",c),c.el=p,c.parent=p.parentNode,c.display=p.style.display,c.position=p.style.position,c.parent&&c.parent.removeChild(p));var w=e.baseZ,k=n.browser.msie||e.forceIframe?n('<iframe class="blockUI" style="z-index:'+w+++';display:none;border:none;margin:0;padding:0;position:absolute;width:100%;height:100%;top:0;left:0" src="'+e.iframeSrc+'"><\/iframe>'):n('<div class="blockUI" style="display:none"><\/div>'),b=n('<div class="blockUI blockOverlay" style="z-index:'+w+++';display:none;border:none;margin:0;padding:0;width:100%;height:100%;top:0;left:0"><\/div>'),s,g;if(g=e.customCssClass.length>0?'<div class="blockUI blockMsg blockElement" style="z-index:'+w+';display:none;"><\/div>':y&&!e.forcePageOverlay?'<div class="blockUI blockMsg blockPage" style="z-index:'+w+';display:none;position:fixed"><\/div>':'<div class="blockUI blockMsg blockElement" style="z-index:'+w+';display:none;position:absolute"><\/div>',s=n(g),e.applyPlatformOpacityRules&&n.browser.mozilla&&/Linux/.test(navigator.platform)||b.css(e.overlayCSS),b.css("position",y?"fixed":"absolute"),(n.browser.msie||e.forceIframe)&&k.css("opacity",0),nt=[k,b,s],tt=y?n("body"):n(u),n.each(nt,function(){this.appendTo(tt)}),o&&(s.append(o),(o.jquery||o.nodeType)&&n(o).show()),(n.browser.msie||e.forceIframe)&&e.showOverlay&&k.show(),e.fadeIn){var it=e.onBlock?e.onBlock:r,ut=e.showOverlay&&!o?it:r,ft=o?it:r;e.showOverlay&&b._fadeIn(e.fadeIn,ut),o&&s._fadeIn(e.fadeIn,ft)}else e.showOverlay&&b.show(),o&&s.show(),e.onBlock&&e.onBlock();h(1,u,e),e.customCssClass&&s.addClass(e.customCssClass),e.customCssClass.length>0||!y||e.forcePageOverlay?e.forcePageOverlay?v(u,s,e):!e.customCssClass.length>0&&a(s[0]):(t=s[0],i=n(":input:enabled:visible",t),e.focusInput&&setTimeout(l,20),a(s[0])),o&&(e.theme?(s.css(themedCSS),s.addClass("ui-widget-content")):s.css(d)),e.timeout&&(rt=setTimeout(function(){y?n.unblockUI(e):n(u).unblock(e)},e.timeout),n(u).data("blockUI.timeout",rt))}function f(r,u){var e=n(r),c=e.data("blockUI.history"),l=e.data("blockUI.timeout"),o,f;l&&(clearTimeout(l),e.removeData("blockUI.timeout")),u=n.extend({},n.blockUI.defaults,u||{}),o=r==window||u.forcePageOverlay,h(0,r,u),f=o&&!u.forcePageOverlay?n("body").children().filter(".blockUI").add("body > .blockUI"):n(".blockUI",r),o&&(t=i=null),u.fadeOut?(f.fadeOut(u.fadeOut),setTimeout(function(){s(f,c,u,r)},u.fadeOut)):s(f,c,u,r)}function s(t,i,r,u){if(t.each(function(){this.parentNode&&this.parentNode.removeChild(this)}),i&&i.el&&(i.el.style.display=i.display,i.el.style.position=i.position,i.parent&&i.parent.appendChild(i.el),n(u).removeData("blockUI.history")),typeof r.onUnblock=="function")r.onUnblock(u,r)}function h(i,r,u){var f=r==window,o=n(r),e;(i||(!f||t)&&(f||o.data("blockUI.isBlocked")))&&(f||o.data("blockUI.isBlocked",i),u.bindEvents&&(!i||u.showOverlay))&&(e="mousedown mouseup keydown keypress",i?n(document).bind(e,u,c):n(document).unbind(e,c))}function c(r){if(r.keyCode&&r.keyCode==9&&t&&r.data.constrainTabKey){var u=i,e=!r.shiftKey&&r.target==u[u.length-1],f=r.shiftKey&&r.target==u[0];if(e||f)return setTimeout(function(){l(f)},10),!1}return n(r.target).parents("div.blockMsg").length>0?!0:n(r.target).parents().children().filter("div.blockUI").length==0}function l(n){if(i){var t=i[n===!0?i.length-1:0];t&&t.focus()}}function a(n){var t=n.parentNode,i=n.style,r=(t.offsetWidth-n.offsetWidth)/2-e(t,"borderLeftWidth"),u=(t.offsetHeight-n.offsetHeight)/2-e(t,"borderTopWidth");i.left=r>0?r+"px":"0",i.top=u>0?u+"px":"0"}function v(t,i,r){var o=n(t).offset(),l=t.parentNode,c=i[0].style,u,s,f,h;r.centerX&&(u=(t.offsetWidth-i.width())/2+l.offsetLeft-e(t,"borderLeftWidth"),s=i.css("left").replace("px",""),s>0&&(u=u+parseInt(s)),c.left=u>0?u+"px":"0"),r.autoHeight&&(o=n(t).offset(),h=i.css("top").replace("px",""),f=o.top,h>0&&(f=f+parseInt(h)),c.top=f>0?f+"px":"0")}function e(t,i){return parseInt(n.css(t,i))||0}var t,i;n.fn._fadeIn=n.fn.fadeIn;var r=function(){},u=document.documentMode||0,y=n.browser.msie&&(n.browser.version<8&&!u||u<8),p=n.browser.msie&&/MSIE 6.0/.test(navigator.userAgent)&&!u;n.blockUI=function(n){o(window,n)},n.unblockUI=function(n){f(window,n)},n.fn.block=function(t){return this.unblock({fadeOut:0}).each(function(){n.css(this,"position")=="static"&&(this.style.position="relative"),n.browser.msie&&(this.style.zoom=1),o(this,t)})},n.fn.unblock=function(n){return this.each(function(){f(this,n)})},n.blockUI.version=2.33,n.blockUI.defaults={title:null,draggable:!0,theme:!1,overlayCSS:{backgroundColor:"#000000",opacity:.5},iframeSrc:/^https/i.test(window.location.href||"")?"javascript:false":"about:blank",forceIframe:!1,baseZ:1e3,centerX:!0,centerY:!0,allowBodyStretch:!0,bindEvents:!0,constrainTabKey:!0,fadeIn:0,fadeOut:0,timeout:0,showOverlay:!0,forcePageOverlay:!1,customCssClass:"",autoHeight:!0,focusInput:!0,applyPlatformOpacityRules:!0,onBlock:null,onUnblock:null,quirksmodeOffsetHack:4},t=null,i=[]})(jQuery);
/*
 *	Copyright (C) 2013 WeeWorld Limited. All rights reserved.
 *	@author Callum Leggat
 *
 *	UniqueDailyLoginAlert
 *	
 *	Manages the UniqueDailyLoginAlertControl, which is displayed when a user has a unique daily login.
 *	The modal popup informs the user of the number of green points that they have recieved for that days
 *	unique login and also displays the previous days login awards.
 */

/*
 * @requires window.Utilities (@see scripts.aspx)
 * @requires jQuery.js
 * @requires jQuery.blockUI.js
 */
( function ( window, $ ) {
	"use strict";

	var CONST = {
		/*
		 * The CSS ids.
		 * @type {Object}
		 */
		ID: {
			/*
			 *	The main div element id.
			 *	@type {String}
			 */
			ELEMENT: "#UniqueDailyLoginAlert",

			/*
			 *	The page overlay element id.
			 *	@type {String}
			 */
			OVERLAY: "#wwPageOverlay",

			/*
			 *	The awarded glow div element id.
			 *	@type {String}
			 */
			AWARDED_GLOW: "#udlaAwardedGlow",
			/*
			 *	The sparkle div element id.
			 *	@type {String}
			 */
			SPARKLE: "#udlaAwardedSparkle",
			/*
			 * The OK button id.
			 * @type {String}
			 */
			OK_BUTTON: "#udlaBtnOK"
		},

		/*
		 * The CSS classes.
		 * @type {Object}
		 */
		CLASS: {
			/*
			 *	The animate sparkle class.
			 *	@type {String}
			 */
			SPARKLE: "udlaAnimateSparkle",

			/*
			 * The main bonus day box class.
			 * @type {String}
			 */
			MAIN_BONUS_BOX: ".udlaGreenBonusBox",

			/*
			 * The active bonus day box class.
			 * @type {String}
			 */
			ACTIVE: ".udlaAwarded"
		}
	};

	/* Private Properties */

	/*
	 *	Holds the singleton instance flag.
	 *	@private
	 *	@type {Boolean}
	 */
	var _hasInstance = false;

	/* Constructor */

	/*
	 *	@class UniqueDailyLoginAlert
	 *	@memberOf WeeWorld
	 *	@constructor
	 */
	var UniqueDailyLoginAlert = function ()
	{
		return new UniqueDailyLoginAlert.fn._Initialise();
	};

	/* Prototype */

	UniqueDailyLoginAlert.fn = UniqueDailyLoginAlert.prototype = {

		/* Private Methods */

		/* 
		 *	Initialise Method.
		 */
		_Initialise: function () {

			// Create as a Singleton.

			if ( _hasInstance ) {

				return this;
			}
			else {

				_hasInstance = true;
			}

			// Set default properties.

			/*
			 * Flag indicating wether the sparkle animation is running.
			 * @type {Boolean}
			 */
			this.hasAnimation = null;

			/*
			 * Holds the main div element as a jQuery object.
			 * @type {Object}
			 */
			this.element = $( CONST.ID.ELEMENT );

			return this;
		},

		/*
		 * Get the active award information and position for the award glow element from
		 * the active bonus day element.
		 */
		_GetActiveAwardFromActiveBonusDay: function() {

			var self = this;
			var actBounsDayEl = $( CONST.CLASS.ACTIVE );
			var pos = this._GetActiveBonusDayPosition( actBounsDayEl );
			var actBounsDayPara = actBounsDayEl.children().clone();

			$( CONST.ID.AWARDED_GLOW ).prepend( actBounsDayPara ).css( {
				"left": pos.left,
				"top": pos.top
			} ).fadeIn( 100, function () {

				self.hasAnimation = true;
				self._RunSparkleAnimation()
			});
		},

		/*
		 * Get the passed the active bonus day elements position and returns the adjusted
		 * position value for the active glow element.
		 */
		_GetActiveBonusDayPosition: function( actEl )
		{
			var result = {
				"left": null,
				"top": null
			};

			var actPos = actEl.position();
			var mainBoxPos = $( CONST.CLASS.MAIN_BONUS_BOX ).position();

			result.left = parseInt( mainBoxPos.left ) + parseInt( actPos.left ) + 1;
			result.top = parseInt( mainBoxPos.top ) + parseInt( actPos.top ) + 1;

			return result;
		},

		/*
		 * Runs the sparkle animation by adding the CSS animation class to the element, wait till the end event 
		 * is called which then removes the animation class.
		 */
		_RunSparkleAnimation: function () {

			if ( this.hasAnimation ) {

				var self = this;
				var count = 0;
				var sparkle = $( CONST.ID.SPARKLE );

				if ( !sparkle.hasClass( CONST.CLASS.SPARKLE ) ) {

					sparkle.addClass( CONST.CLASS.SPARKLE );

					sparkle.on( 'animationEnd webkitAnimationEnd oAnimationEnd MSAnimationEnd', function ( event ) {

						count++;

						if ( count >= 1 ) {

							sparkle.off( 'animationEnd webkitAnimationEnd oAnimationEnd MSAnimationEnd' );

							sparkle.removeClass( CONST.CLASS.SPARKLE );

							self._RunPulseAnimation();
						}
					} );
				}
			}
		},

		/*
		 * Runs the sparkle animation by adding the CSS animation class to the element, wait till the end event 
		 * is called which then removes the animation class.
		 */
		_RunPulseAnimation: function () {

			var self = this;
			var sparkle = $( CONST.ID.SPARKLE );

			if ( !sparkle.hasClass( CONST.CLASS.SPARKLE ) ) {

				sparkle
					.fadeTo( 1250, 0 )
					.fadeTo( 250, 1, function () {
						self._RunSparkleAnimation();
					})
			}
		},

		/* Public Methods */

		/*
		 *	Displays the UniqueDailyLoginAlertControl
		 */
		DisplayAlert: function () {

			var awardDay = $( CONST.CLASS.ACTIVE ).data( "awardDay" );
			sendPageViewTag( 'Day' + awardDay, 'Green Points Message' );

			if ( !this.element.is( ':visible' ) )
			{
				var self = this;
				var xPos = ( $( '#wwMainContent' ).offset().left + 97 ) + 'px';
				var yPos = ( $( '#wwMainContent' ).offset().top + 5 ) + 'px';

				$.blockUI( {
					message: self.element,
					baseZ: 2000,
					css:
					{
						position: 'fixed',
						top: yPos,
						left: xPos
					},
					fadeIn: 350,
					overlayCSS:
					{
						backgroundcolor: '#f00',
						opacity: 0.65
					},
					onUnblock: function () {
						self.element.remove();
					},
					onBlock: function()
					{
						self.element.show();
						self._GetActiveAwardFromActiveBonusDay();

						// Register that the user has seen the alert
						$.ajax( {
							url: Utilities.getRootUrl() + 'NewUserExperience/services/GetUniqueDailyLoginAlert.ashx',
							dataType: 'json'
						} );

						$( CONST.ID.OK_BUTTON ).one( "click", function ( e ) {

							e.preventDefault();

							self.hasAnimation = false;
							$.unblockUI( { fadeOut: 350	} );
							
						} );
					}
				} );
			}
		}
	};

	UniqueDailyLoginAlert.fn._Initialise.prototype = UniqueDailyLoginAlert.fn;

	/* Add to the global namespace */
	if ( typeof window.WeeWorld == "undefined" ) window.WeeWorld = {};
	window.WeeWorld.UniqueDailyLoginAlert = UniqueDailyLoginAlert;

} )( window, jQuery );

function $id()
{var results=[],element;for(var i=0;i<arguments.length;i++)
{element=arguments[i];if(typeof element=='string')
{element=document.getElementById(element);};results.push(element);};return results.length<2?results[0]:results;};function goToUrl(url)
{document.location.href=url;}
function addLoadEvent(func)
{var oldonload=window.onload;if(typeof window.onload!='function')
{window.onload=func;}
else
{window.onload=function()
{if(oldonload)
{oldonload();}
func();}}}
function loadScript(url,callback)
{var script=document.createElement("script")
script.type="text/javascript";script.language="JavaScript";if(script.readyState)
{script.onreadystatechange=function()
{if(script.readyState=="loaded"||script.readyState=="complete")
{script.onreadystatechange=null;callback();}};}
else
{script.onload=function()
{callback();};}
script.src=url;document.body.appendChild(script);}
function ParseScriptTag(divElement)
{var e=divElement.getElementsByTagName("script");var script=document.createElement("script");var head=document.getElementsByTagName("head")[0];script.type="text/javascript";if(e.length>0)
{script.text=e[0].text;}
head.insertBefore(script,head.firstChild);head.removeChild(script);}
var Class=window.Class||{create:function(){return function(){this.Initialize.apply(this,arguments);}}}
if(!Function.prototype.bind){Function.prototype.bind=function(oThis){if(typeof this!=="function"){throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");}
var aArgs=Array.prototype.slice.call(arguments,1),fToBind=this,fNOP=function(){},fBound=function(){return fToBind.apply(this instanceof fNOP&&oThis?this:oThis,aArgs.concat(Array.prototype.slice.call(arguments)));};fNOP.prototype=this.prototype;fBound.prototype=new fNOP();return fBound;};}
function openPromoPayoffPopup(srcURL)
{var width=400;var widthParam="popupWidth=";try
{if(srcURL.indexOf(widthParam)>-1)
{width=srcURL.substring(srcURL.indexOf(widthParam)+widthParam.length,srcURL.indexOf(widthParam)+widthParam.length+3);}}
catch(e)
{}
var height=400;var heightParam="popupHeight=";try
{if(srcURL.indexOf(heightParam)>-1)
{height=srcURL.substring(srcURL.indexOf(heightParam)+heightParam.length,srcURL.indexOf(heightParam)+heightParam.length+3);}}
catch(e)
{}
var left=(screen.width-width)/2;var top=(screen.height-height)/2;var popURL=Utilities.getRootUrl()+srcURL;var windowArgs='scrollbars=no,height='+height+',width='+width+',left='+left+',top='+top+',resizable=no,status=no';window.open(popURL,'',windowArgs);}
var pointsWhatsThis=false;function openPointsWhatsThisPopup()
{if(pointsWhatsThis==false)
{pointsWhatsThis=true;window.open(Utilities.getRootUrl()+"popups/pointsWhatsThis.aspx",'','scrollbars=yes,height=640,width=435,resizable=no,status=yes');}}
function openPointsWhatsThisPopup_Closed()
{window.opener.pointsWhatsThis=false;}
function openTermsAndConditions()
{window.open(Utilities.getRootUrl()+"tsandcs/default.aspx",'','scrollbars=yes,height=600,width=800,resizable=yes,status=yes');}
function openSafetyAdvicePopup()
{window.open(Utilities.getRootUrl()+"popups/safetyAdvice.aspx",'','scrollbars=yes,height=610,width=425,resizable=no,status=yes');}
function startQuest_FromAnywhere(windowId,trackingActionID,trackingCatID)
{if(trackingActionID!=null&&trackingCatID!=null)
{sendEventTrackingTag(trackingActionID,"2",trackingCatID,"0");}
dropDownNotifications.splice(0,dropDownNotifications.length);WeeWorldAjax.ChallengeAjax.StartQuest(windowId);ShowNotification(dropDownNotifications[0]);UpdateUsersNotifications(false);}
function showPrivateTV()
{window.open("http://www.teen.com/showcase/private/weeworld/index.vm","teenmovie","scrollbars=0,menubar=0,status=0,toolbar=0,width=749,height=445,resizable=0");raiseEarningEvent('JSPRIVATETV');}
function BuilderSaveComplete()
{startShareWeeMeeProcess();UpdateUsersNotifications(false);}
var AllowPointsUpdate=true;function setAllowPointsUpdate(state)
{AllowPointsUpdate=state;}
var dropDownNotifications;var fireAlertConversionEvents=true;var prioritiseNotification=false;function setFireAlertConversionEvents(state)
{fireAlertConversionEvents=state;}
var notificationVisible=false;function raiseEarningEvent(eventName)
{try
{WeeWorldAjax.UserNotifications.RaiseEarningEvent(eventName);}
catch(e)
{}}
function UpdateUsersNotifications(addSurfingAction,cb)
{try
{if(AllowPointsUpdate)
{WeeWorldAjax.UserNotifications.GetActionNotifier(addSurfingAction,UpdateUsersNotifications_SuccessCallback.bind(this,cb),function(){if(cb){cb();}});}}
catch(e)
{}}
function UpdateUsersNotifications_SuccessCallback(cb,data)
{var userNotifications=data;Utilities.updateBalance(data[1],data[0]);UpdateUserStatusSwf(userNotifications);$id('PointsGold').innerHTML=data[0];$id('PointsGreen').innerHTML=data[1];if(!jQuery("#notiDropdown").is(':visible')){var newNotifications=userNotifications[8];if(newNotifications>0)
{if(newNotifications>=99)
{jQuery('#notiCounter').html('99+');}
else
{jQuery('#notiCounter').html(newNotifications);}
jQuery('#notiCounter').show();}
else
{jQuery('#notiCounter').html('');jQuery('#notiCounter').hide();}}
for(var i=0;i<=userNotifications[7].length-1;i++)
{if(userNotifications[7][i][1].split(/\b/)[1]=="starter")
{userNotifications[7].splice(i,1);DisplayUniqueDailyLoginAlert();userNotifications[7].splice(i,1);}}
if(notificationVisible)
{var lastIndex=dropDownNotifications.length-1;if(prioritiseNotification==false)
{for(var i=0;i<=userNotifications[7].length-1;i++)
{lastIndex++;dropDownNotifications[lastIndex]=userNotifications[7][i];if(cb){cb()}
return;}}
else
{for(var i=0;i<=userNotifications[7].length-1;i++)
{dropDownNotifications.splice(0,0,userNotifications[7][i]);}
prioritiseNotification=false;ShowNotification(dropDownNotifications[0]);}}
else
{dropDownNotifications=userNotifications[7];if(dropDownNotifications.length>0)
{ShowNotification(dropDownNotifications[0]);}}
if(cb){cb()}}
function UpdateUsersNotificationsFromVideoAd()
{try
{WeeWorldAjax.UserNotifications.GetActionNotifier(false,UpdateUsersNotificationsFromVideoAd_SuccessCallback);}
catch(e)
{}}
function UpdateUsersNotificationsFromVideoAd_SuccessCallback(data)
{UpdateUserStatusSwf(data);}
function ShowNotification(notification)
{setFireAlertConversionEvents(true);if(notification[0]!="")
{LoadAlertCSS(notification[0]);}
SetAlertCSSClass(notification[2]);jQuery("#notificationcontainer").height("auto");jQuery("#achDropDynamic").html(notification[1]);if(jQuery("#levelupanimation").length>0)
{var aniColour=jQuery("#levelupanimation").attr('anicolour');LoadLevelUpAnimation(aniColour);}
var panelHeight='';if(jQuery("#marketingAlertDiv").length>0&&fireAlertConversionEvents)
{try
{jQuery('A.fireOnLoad').each(function(i){sendPageViewTag(this.id,'/WeeHome/Marketing-Messages');sendEventTrackingTag(this.id,'',this.title,'0');});setFireAlertConversionEvents(false);}
catch(e)
{}
panelHeight='100%';}
if(notificationVisible==false)
{jQuery("#notificationcontainer").height(0);}
if(panelHeight=='')
{panelHeight=jQuery("#achDropContent").css("height");if(panelHeight=='auto')
{panelHeight=jQuery("#achDropContent").height()+'px';}}
jQuery("#notificationcontainer").animate({height:panelHeight},"slow");jQuery("#levelclose").show();notificationVisible=true;}
function DisplayUniqueDailyLoginAlert(){if(typeof WeeWorld.UniqueDailyLoginAlert!=="undefined")
{jQuery.ajax({cache:false,url:Utilities.getRootUrl()+"newUserExperience/services/GetUniqueDailyLoginAlert.ashx",success:function(data)
{jQuery("body").append(data);uniqueDailyLoginAlert=new WeeWorld.UniqueDailyLoginAlert();uniqueDailyLoginAlert.DisplayAlert();clearInterval(pollIntervalID);pollIntervalID=window.setInterval("UpdateUsersNotifications(true);",30000);},error:function(data)
{if(window.console&&window.console.log)
{window.console.log("Error creating UniqueDailyLoginAlert control.");}}});}
else
{if(window.console&&window.console.log)
{window.console.log("The JS Object WeeWorld.UniqueDailyLoginAlert is undefined in DisplayUniqueDailyLoginAlert()");}}}
function CloseAchievementNotification()
{if(dropDownNotifications.length==1)
{jQuery('#notificationcontainer').height('0px');jQuery('#levelclose').hide();jQuery('#notificationcontainer').removeAttr('class');jQuery('#notificationcontainer').removeAttr('classname');jQuery("#achDropDynamic").html('');notificationVisible=false;}
else
{dropDownNotifications.splice(0,1);ShowNotification(dropDownNotifications[0]);}}
function LoadAlertCSS(cssFilePath)
{var filename=cssFilePath;var fileref=document.createElement("link");fileref.setAttribute("rel","stylesheet");fileref.setAttribute("type","text/css");fileref.setAttribute("href",filename);if(typeof fileref!="undefined")
{document.getElementsByTagName("head")[0].appendChild(fileref);}}
function SetAlertCSSClass(cssClass)
{$id('notificationcontainer').setAttribute("class",cssClass);$id('notificationcontainer').setAttribute("className",cssClass);}
function LoadLevelUpAnimation(colour)
{$id('levelupanimation').innerHTML='<p><strong>You need to upgrade your Flash Player</strong>Download the latest Flashplayer for free <a href="http://www.macromedia.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash">HERE</a>!</p>';var animation=new SWFObject(Utilities.getRootUrl()+"flash/achievements/LockAnimation.swf","LevelUpSwf","110","140","10","#000000");animation.addParam("quality","high");animation.addParam("wmode","transparent");animation.addVariable("lockColour",colour);animation.addVariable("menu","false");animation.write("levelupanimation");}
function facebookLevelUp(username,level,achievementsURL,levelImageURL){var name='New level on WeeWorld';var caption=username+' is now at level '+level+'  - check out their latest achievements.';postToFacebook(name,caption,achievementsURL,levelImageURL);}
function facebookChallengeComplete(username,trophyName,achievementsURL,trophyImageURL){var name='New Trophy on WeeWorld';var caption=username+' earned the '+trophyName+' trophy - check out their latest achievements.';postToFacebook(name,caption,achievementsURL,trophyImageURL);}
function postToFacebook(name,caption,link,picture){FB.login(function(response){if(response.status==='connected'){FB.api('/me/permissions',function(response){var perms=response.data[0];if(perms.publish_stream){var params={};params['name']=name;params['caption']=caption;params['link']=link;params['picture']=picture;FB.api('/me/feed','post',params,function(response){jQuery('.publishtofacebook').fadeOut('slow');});}});}},{scope:'email,publish_stream,user_birthday'});}
var userStatsLoaded=false;function GetUserStatusAreaSwf()
{return $id('userStats_swf');}
function LoadUserStatusArea(rootURL,jsonString)
{if(!userStatsLoaded)
{$id('user-status-area-swf').innerHTML='<p><strong>You need to upgrade your Flash Player</strong>Download the latest Flashplayer for free <a href="http://www.macromedia.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash">HERE</a>!</p>';var userStatsObject=new SWFObject(rootURL+"flash/achievements/achievementsPanel.swf?v=7594","userStats_swf","319","45","7","#FFFFFF");userStatsObject.addParam("allowScriptAccess","always");userStatsObject.addParam("wmode","transparent");userStatsObject.addVariable("data",jsonString);userStatsObject.addVariable("vars","data");userStatsObject.addVariable("onInit","OnAchievementPanelInit");userStatsObject.write("user-status-area-swf");userStatsLoaded=true;window.userStats_swf=document.forms[0].userStats_swf;}}
var levelTimer;function NotificationBegin()
{levelTimer=setTimeout(function(){document.getElementById('user-status-area-swf').style.zIndex=1020;},350);}
function NotificationComplete()
{document.getElementById('user-status-area-swf').style.zIndex=1005;clearTimeout(levelTimer);}
function OnAchievementPanelInit()
{UpdateUserStatusSwf(achievementsPanelStatusData);}
var achievementsPanelStatusData;function UpdateUserStatusSwf(statusData)
{achievementsPanelStatusData=statusData;try
{var userStatusArea=GetUserStatusAreaSwf();userStatusArea.ext_UpdateUserStatusArea(statusData);}
catch(err)
{}}
function ToggleUserStatusZindex()
{var zBelow=1005;var zAbove=1015;var zIndex=jQuery('#user-status-area-swf').css('z-index');var newIndex=(zIndex==zBelow)?zAbove:zBelow;jQuery('#user-status-area-swf').css({'z-index':newIndex});}
jQuery(document).ready(function($)
{jQuery('.WW_Nav_Event').click(function(e){var id=jQuery(this).attr('id');if(id.indexOf('WW_Nav_Event')!=-1)
{id=id.substring(13);switch(id)
{case'SettingsJS':break;case'Settings':sendEventTrackingTag('Settings','','User Status Nav','0');break;case'Faq':sendEventTrackingTag('Faq','','User Status Nav','0');break;case'HelpCenter':sendEventTrackingTag('HelpCenter','','User Status Nav','0');break;case'Logout':e.preventDefault();sendEventTrackingTag('Sign Out','','User Status Nav','0');setTimeout(function()
{window.location=Utilities.getLogoutRootUrl()+"loggedout.aspx";},500);break;case'Subscribe':sendEventTrackingTag('Subscribe','','User Status Nav','0');break;case'CreditCard':sendEventTrackingTag('Credit Card','','User Status Nav','0');break;case'PayPal':sendEventTrackingTag('PayPal','','User Status Nav','0');break;case'Ultimate':sendEventTrackingTag('Ultimate','','User Status Nav','0');break;case'Mobile':sendEventTrackingTag('Mobile','','User Status Nav','0');break;case'Rixty':sendEventTrackingTag('Rixty','','User Status Nav','0');break;case'Offers':sendEventTrackingTag('Offers','','User Status Nav','0');break;case'Surveys':sendEventTrackingTag('Surveys','','User Status Nav','0');break;case'Videos':sendEventTrackingTag('Videos','','User Status Nav','0');break;case'Redeem':sendEventTrackingTag('Redeem','','User Status Nav','0');break;case'InviteFriends':sendEventTrackingTag('Invite Friends','','User Status Nav','0');break;case'TrophiesQuests':sendEventTrackingTag('Trophies and Quests','','User Status Nav','0');break;case'ConfirmEmail':sendEventTrackingTag('Confirm Email','','User Status Nav','0');break;case'Toolbar':sendEventTrackingTag('Toolbar','','User Status Nav','0');break;case'MoreGreenPoints':sendEventTrackingTag('More Green Points','','User Status Nav','0');break;default:e.preventDefault();break;}}});});function ShowGetPointsAsPopup(flag)
{try
{var userStatusArea=GetUserStatusAreaSwf();userStatusArea.ext_UpdateInBuilderStatus(flag);}
catch(err)
{}}
function openPopup(popupUrl,eventName)
{if(eventName!=null)
{raiseEarningEvent(eventName);}
window.open(popupUrl,'','scrollbars=yes,height=600,width=800,resizable=yes,status=yes');}
function downloadToolbar()
{if(navigator.appName=="Netscape")
{$id("toolbarDownload").href="http://s31.freecause.com/WeeWorld.xpi";}
else
{$id("toolbarDownload").href="http://s31.freecause.com/WeeWorld.exe";}}
function DeepLinkEventHandler(eventId)
{switch(eventId)
{case"offers":sendEventTrackingTag("Offers","","Marketing Message Link","0");break;case"surveys":sendEventTrackingTag("Surveys","","Marketing Message Link","0");break;case"paypal":sendEventTrackingTag("Paypal","","Marketing Message Link","0");break;case"creditcards":sendEventTrackingTag("CreditCards","","Marketing Message Link","0");break;case"boku":sendEventTrackingTag("Boku","","Marketing Message Link","0");break;case"paybycash":sendEventTrackingTag("PayByCash","","Marketing Message Link","0");break;case"subscribe":sendEventTrackingTag("Subscribe","","Marketing Message Link","0");break;case"cashcards":sendEventTrackingTag("CashCards","","Marketing Message Link","0");break;case"pins":sendEventTrackingTag("PINs","","Marketing Message Link","0");break;case'Videos':sendEventTrackingTag('Videos','','User Status Nav','0');break;}}
function WeeWorldNavEventHandler(eventId,categoryId)
{sendEventTrackingTag(eventId,"",categoryId,"0");}
var movieState;function changeWeeHomeState(stateChange)
{if(stateChange!=null)
{var flashMovie=$id('weehome_flash_movie');flashMovie.ext_changeWeeHomeState(stateChange);}}
function MovieStateChanged(currentState)
{switch(currentState+'')
{case'4':ClearMenuItems();break;case'10':HighlightMenuItem('myfriends');break;case'11':HighlightMenuItem('findfriends');break;case'7':break;}
movieState=currentState;}
(function($){$.fn.hoverIntent=function(f,g)
{var cfg={sensitivity:7,interval:100,timeout:100};cfg=$.extend(cfg,g?{over:f,out:g}:f);var cX,cY,pX,pY;var track=function(ev){cX=ev.pageX;cY=ev.pageY;};var compare=function(ev,ob){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);if((Math.abs(pX-cX)+Math.abs(pY-cY))<cfg.sensitivity){$(ob).unbind("mousemove",track);ob.hoverIntent_s=1;return cfg.over.apply(ob,[ev]);}
else
{pX=cX;pY=cY;ob.hoverIntent_t=setTimeout(function(){compare(ev,ob);},cfg.interval);}};var delay=function(ev,ob){ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);ob.hoverIntent_s=0;return cfg.out.apply(ob,[ev]);};var handleHover=function(e){var p=(e.type=="mouseover"?e.fromElement:e.toElement)||e.relatedTarget;while(p&&p!=this){try{p=p.parentNode;}
catch(e){p=this;}}
if(p==this){return false;}
var ev=jQuery.extend({},e);var ob=this;if(ob.hoverIntent_t)
{ob.hoverIntent_t=clearTimeout(ob.hoverIntent_t);}
if(e.type=="mouseover"){pX=ev.pageX;pY=ev.pageY;$(ob).bind("mousemove",track);if(ob.hoverIntent_s!=1){ob.hoverIntent_t=setTimeout(function(){compare(ev,ob);},cfg.interval);}}
else
{$(ob).unbind("mousemove",track);if(ob.hoverIntent_s==1){ob.hoverIntent_t=setTimeout(function(){delay(ev,ob);},cfg.timeout);}}};return this.mouseover(handleHover).mouseout(handleHover);};})(jQuery);jQuery(document).ready(function($)
{jQuery('UL#WW_Nav_TopLevel LI').hoverIntent({interval:85,over:MainDropDownShow,timeout:100,out:MainDropDownHide});jQuery('UL#WW_Nav_UserMenuItem LI').hoverIntent({interval:85,over:MainDropDownShow,timeout:100,out:MainDropDownHide});jQuery('A#UserSpriteClick, A#GreenSpriteClick').click(function(e)
{e.preventDefault();});if($("#WW_Nav_Friends .WW_Nav_DropDown").length){$("#WW_Nav_Friends").append("<span id='onlineFriends'></span><span id='partyroomFriends'></span><span id='worldFriends'></span>");GetTopFriendStatus();window.setInterval("GetTopFriendStatus()",30000);}});function GetTopFriendStatus()
{WeeWorld.Web.services.friends.GetTopFriendsStatus(function(data)
{if(data.of==true)
{jQuery("#onlineFriends").show();jQuery("#worldFriends").toggle(data.wf);jQuery("#partyroomFriends").toggle(data.pf);}
else
{jQuery("#WW_Nav_Friends span").hide();}});}
function MainDropDownShow()
{jQuery(this).addClass('show').removeClass('with-js');}
function MainDropDownHide()
{jQuery(this).addClass('with-js').removeClass('show');}
function ShowAccountDropDown()
{jQuery('DIV#WW_Nav_UserDropDown').removeClass("hideLayer").addClass("showLayer");jQuery('A#UserSpriteBG A#GoldSpriteBG A#GreenSpriteBG').unbind('click').bind('click',function(e){e.preventDefault();});AccountHoverIntent();}
function ShowGoldPointsDropDown()
{jQuery('#WW_Nav_UserDropDown').removeClass("hideLayer").addClass("showLayer");jQuery('A#UserSpriteBG A#GoldSpriteBG A#GreenSpriteBG').unbind('click').bind('click',function(e){e.preventDefault();});AccountHoverIntent();}
function ShowGreenPointsDropDown()
{jQuery('#WW_Nav_UserDropDown').removeClass("hideLayer").addClass("showLayer");jQuery('A#UserSpriteBG A#GoldSpriteBG A#GreenSpriteBG').unbind('click').bind('click',function(e){e.preventDefault();});AccountHoverIntent();}
function AccountHoverIntent()
{jQuery('#WW_Nav_UserDropDown').mouseleave(function(e){jQuery('#WW_Nav_UserDropDown').removeClass("showLayer").addClass("hideLayer");});jQuery('UL#WW_Nav_UserMenuItem LI').hoverIntent({interval:85,over:UserDropDownShow,timeout:100,out:UserDropDownHide});}
function UserDropDownShow()
{jQuery(this).addClass('show').removeClass('with-js');}
function UserDropDownHide()
{jQuery(this).removeClass('show').addClass('with-js');}
var locks=new Object();function isChildOf(child,parent){while(child!=parent&&child.parentNode!=null)
child=child.parentNode
if(child==parent)return true;else return false;}
function displayOnMouseOut(evt,elementName){var el=(evt.toElement)?evt.toElement:(evt.relatedTarget)?evt.relatedTarget:null;if(isChildOf(el,$id(elementName))){return;}
if(locks[elementName]!=null){locks[elementName]=false;}
HideElement(elementName);}
function displayOnMouseOver(elementName){if(locks[elementName]==null){locks[elementName]=true;}
else if(!locks[elementName]){locks[elementName]=true;}
ShowElement(elementName);}
function UnlockElement(elementName){locks[elementName]=false;}
function HideElement(elementName){if(locks[elementName]==null){$id(elementName).style.display='none';}
else if(!locks[elementName]){$id(elementName).style.display='none';}}
function ShowElement(elementName){$id(elementName).style.display='block';}
var Utilities=window.Utilities||{};Utilities.getDaysInMonth=function(m,y)
{return/8|3|5|10/.test(--m)?30:m==1?(!(y%4)&&y%100)||!(y%400)?29:28:31;};Utilities.IsEmail=function(email)
{var isEmail_re=/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;return email.search(isEmail_re)!=-1;};Utilities.IsUsername=function(username)
{var isSymbols_re=/[$&+,/:;=?@<>#%{}\|\\^~\[\]`""]/;var isNotAlphaNumeric_re=/^[0-9a-zA-Z]+$/;var reTest1=username.search(isSymbols_re)!=-1;var reTest2=username.search(isNotAlphaNumeric_re)!=-1;if(reTest1||!reTest2){return false;}else{return true;}};Utilities.IsPassword=function(password,username)
{if(password==username){return false;}
var isNumeric_re=/[0-9]/;var reTest=password.search(isNumeric_re)!=-1;var lengthTest=password.length>=6;if(reTest&&lengthTest){return true;}else{return false;}};Utilities.arrayToString=function(obj_array)
{var str_return='';var int_lastIndex=obj_array.length-1;if(obj_array.length!=1){$each(obj_array,function(value,i){if(i==int_lastIndex){str_return=str_return+value;}
else{str_return=str_return+value+',';}});}
else{if(typeof obj_array[0]==="object"){str_return=str_return+obj_array[0].id;}
else{str_return=str_return+obj_array[0];}}
return str_return;};Utilities.shortenString=function(str,length)
{var str_return='';if(str.length>length)
{var lastIndex=length-3;var str_sub=str.substring(0,lastIndex);str_return=str_sub+'...';}
else
{str_return=str;}
return str_return;};Utilities.openLink=function(str_link,str_name,str_params,bool_newwindow)
{if(bool_newwindow)
{newPopup=window.open(str_link,str_name,str_params);}
else
{window.location.href=str_link;}};Utilities.setDocumentDomain=function()
{var domainName='weeworld.com';if(document.domain.indexOf(domainName)>-1)
{document.domain=domainName;}};Utilities.getRootUrl=function()
{return'http://www.weeworld.com/';};Utilities.currentBalance={isDirty:true,greenPoints:0,goldPoints:0};Utilities.updateBalance=function(greenPoints,goldPoints)
{Utilities.currentBalance.greenPoints=greenPoints;Utilities.currentBalance.goldPoints=goldPoints;Utilities.currentBalance.isDirty=false;};Utilities.getCurrentBalance=function(cb)
{if(!(Utilities.currentBalance.isDirty))
{if(cb){cb();}
return Utilities.currentBalance;}
else
{UpdateUsersNotifications(false,cb);return null;}};Utilities.getLogoutRootUrl=function()
{return'http://www.weeworld.com/';}
Utilities.getBuilderCdnUrl=function()
{return'http://cdn.weeworld.com/';}
Utilities.getStaticCdnUrl=function()
{return'http://cdn.weeworld.com/';}
Utilities.getWeeMeeImagingUrl=function()
{return'http://207.211.22.113/weemeeimaging/getweemeeimage.aspx';}
Utilities.getFlashQueryStringVersionNo=function()
{return'7594';}
Utilities.Debug={_allowDebug:null,setAllowDebug:function(bool_state)
{this._allowDebug=bool_state;},setDebugQueue:function(queueKey,bool_state)
{if(this._allowDebug)
{jQuery.data(document.body,queueKey,bool_state);}},writeDebug:function(queueKey,str_txt)
{if(window.console&&window.console.log&&this._allowDebug)
{if(jQuery.data(document.body,queueKey)===true)
{window.console.log(str_txt);}}}};var ObjErrorBubble=window.ObjErrorBubble||null;var FormErrorBubble=window.FormErrorBubble||{};FormErrorBubble.CreateBubble=Class.create();FormErrorBubble.CreateBubble.prototype={IsActive:null,BubbleType:null,Top:null,Left:null,RgtBubble:null,RgtSmlBubble:null,RgtBubbleText:null,RgtSmlBubbleText:null,RgtBubbleInfoClass:null,RgtSmlBubbleInfoClass:null,RgtBubbleErrorClass:null,RgtSmlBubbleErrorClass:null,LftBubble:null,LftBubbleText:null,LftBubbleInfoClass:null,LftBubbleErrorClass:null,BtmBubble:null,BtmBubbleText:null,BtmBubbleInfoClass:null,BtmBubbleErrorClass:null,TxtBoxErrorClass:null,UseHilight:null,Initialize:function()
{this.IsActive=false;this.UseHilight=true;this.RgtBubble=jQuery('#rightError');this.RgtSmlBubble=jQuery('#rightSmlError');this.LftBubble=jQuery('#leftError');this.BtmBubble=jQuery('#btmError');this.RgtBubbleText=jQuery('#rightError P');this.RgtSmlBubbleText=jQuery('#rightSmlError P');this.LftBubbleText=jQuery('#leftError P');this.BtmBubbleText=jQuery('#btmError P');this.RgtBubbleInfoClass='wwFrmModalPopup wwFrmModalHintRight';this.RgtBubbleErrorClass='wwFrmModalPopup wwFrmModalErrorRight';this.RgtSmlBubbleInfoClass='wwFrmModalPopup wwFrmModalHintRightSml';this.RgtSmlBubbleErrorClass='wwFrmModalPopup wwFrmModalErrorRightSml';this.LftBubbleInfoClass='wwFrmModalPopup wwFrmModalHintLeft';this.LftBubbleErrorClass='wwFrmModalPopup wwFrmModalErrorLeft';this.BtmBubbleInfoClass='wwFrmModalPopup wwFrmModalHintBtm';this.BtmBubbleErrorClass='wwFrmModalPopup wwFrmModalErrorBtm';this.TxtBoxErrorClass='wwFrmModalTxtBoxError'},SetRightSmlBubble:function(oPosItem,isFixed,message,isError)
{this.IsActive=true;this.SetBubblePosition(oPosItem,isFixed,'right');this.RgtSmlBubbleText.html(message);if(isError)
{this.BubbleType='Error';this.HilightInputItem(oPosItem);this.RgtSmlBubble.removeClass().addClass(this.RgtSmlBubbleErrorClass);}
else
{this.BubbleType='Info';if(oPosItem.hasClass(this.TxtBoxErrorClass))
{oPosItem.toggleClass(this.TxtBoxErrorClass);}
this.RgtSmlBubble.removeClass().addClass(this.RgtSmlBubbleInfoClass);}
if(this.RgtSmlBubble.is(':hidden'))
{this.RgtSmlBubble.show();}
this.RgtSmlBubble.css({'top':this.Top,'left':this.Left});},SetRightBubble:function(oPosItem,isFixed,message,isError)
{this.IsActive=true;this.SetBubblePosition(oPosItem,isFixed,'right');this.RgtBubbleText.html(message);if(isError)
{this.BubbleType='Error';this.HilightInputItem(oPosItem);this.RgtBubble.removeClass().addClass(this.RgtBubbleErrorClass);}
else
{this.BubbleType='Info';if(oPosItem.hasClass(this.TxtBoxErrorClass))
{oPosItem.toggleClass(this.TxtBoxErrorClass);}
this.RgtBubble.removeClass().addClass(this.RgtBubbleInfoClass);}
if(this.RgtBubble.is(':hidden'))
{this.RgtBubble.show();}
this.RgtBubble.css({'top':this.Top,'left':this.Left});},SetLeftBubble:function(oPosItem,isFixed,message,isError)
{this.IsActive=true;this.SetBubblePosition(oPosItem,isFixed,'left');this.LftBubbleText.html(message);if(isError)
{this.BubbleType='Error';this.HilightInputItem(oPosItem);this.LftBubble.removeClass().addClass(this.LftBubbleErrorClass);}
else
{this.BubbleType='Info';if(oPosItem.hasClass(this.TxtBoxErrorClass))
{oPosItem.toggleClass(this.TxtBoxErrorClass);}
this.LftBubble.removeClass().addClass(this.LftBubbleInfoClass);}
if(this.LftBubble.is(':hidden'))
{this.LftBubble.show();}
this.LftBubble.css({'top':this.Top,'left':this.Left});},SetBtmBubble:function(oPosItem,isFixed,message,isError)
{this.IsActive=true;this.SetBubblePosition(oPosItem,isFixed,'bottom');this.BtmBubbleText.html(message);if(isError)
{this.BubbleType='Error';this.BtmBubble.removeClass().addClass(this.BtmBubbleErrorClass);}
else
{this.BubbleType='Info';this.BtmBubble.removeClass().addClass(this.BtmBubbleInfoClass);}
if(this.BtmBubble.is(':hidden'))
{this.BtmBubble.show();}
this.BtmBubble.css({'top':this.Top,'left':this.Left});},SetBubblePosition:function(oPosItem,isFixed,posType)
{if(isFixed)
{this.UseHilight=false;this.Top=oPosItem.top;this.Left=oPosItem.left;}
else
{var oPos=oPosItem.position();var pageOffsetLeft=jQuery('#wwPageContent').offset().left;var mainOffsetTop=jQuery('#wwMainContent').offset().top;var oOffsetTop=oPosItem.offset().top;var oOffsetLeft=oPosItem.offset().left;var oTop=oOffsetTop-mainOffsetTop;var oLeft=oOffsetLeft-pageOffsetLeft;var oWidth=oPosItem.width();var oHalfWidth=Math.floor(oPosItem.width()/2);var oHeight=oPosItem.height();var oHalfHeight=Math.floor(oPosItem.height()/2)+2;var popWidth=253;var halfPopWidth=126;var arrowHeight=3;var arrorWidth=8;if(posType=='right')
{this.Top=oTop-oHalfHeight;this.Left=oLeft+oWidth+arrorWidth;}
if(posType=='left')
{this.Top=oTop-oHalfHeight;this.Left=oLeft-popWidth-arrorWidth;}
if(posType=='bottom')
{this.Top=oTop+oHeight+arrowHeight;if(typeof(LOGIN_TYPE)=='undefined'||LOGIN_TYPE=='')
{LOGIN_TYPE='UNKNOWN'}
if(LOGIN_TYPE=='HOME')
{this.Left=oLeft-halfPopWidth+13;}
else
{this.Left=oLeft-halfPopWidth+oHalfWidth;}}}},HilightInputItem:function(oTxtBox)
{if(this.UseHilight==false)
{return;}
if(oTxtBox.attr('type')=='password'||oTxtBox.attr('type')=='text')
{if(!oTxtBox.hasClass(this.TxtBoxErrorClass))
{oTxtBox.addClass(this.TxtBoxErrorClass);}}},HilightItem:function(oElement)
{if(!oElement.hasClass(this.TxtBoxErrorClass))
{oElement.addClass(this.TxtBoxErrorClass);}},ResetHilightItem:function(oElement)
{if(oElement.hasClass(this.TxtBoxErrorClass))
{oElement.removeClass(this.TxtBoxErrorClass);}},HideBubble:function()
{this.BubbleType=null;this.IsActive=false;if(this.LftBubble.is(':visible'))
{this.LftBubble.hide();}
if(this.RgtBubble.is(':visible'))
{this.RgtBubble.hide();}
if(this.RgtSmlBubble.is(':visible'))
{this.RgtSmlBubble.hide();}
if(this.BtmBubble.is(':visible'))
{this.BtmBubble.hide();}},ResetBubble:function(oTxtBox)
{this.HideBubble();this.ResetHilightItem(oTxtBox);}};