/*
 * Bilingual (English / Hindi) switcher for the public site.
 *
 * Markup contract:
 *   <p data-hi="नमस्ते">Hello</p>              -> swaps innerHTML
 *   <input data-hi-placeholder="नाम" ... />    -> swaps the placeholder attribute
 *
 * Supported attribute suffixes: placeholder, value, title, alt, aria-label.
 * The English version is whatever is already authored in the markup; it is
 * captured on first run and kept in memory, so no duplicate markup is needed.
 */
(function (window, document) {
    'use strict';

    var STORAGE_KEY = 'bmk_lang';
    var COOKIE_NAME = 'bmk_lang';
    var DEFAULT_LANG = 'en';
    var ATTRS = ['placeholder', 'value', 'title', 'alt', 'aria-label'];

    function readCookie(name) {
        var parts = ('; ' + document.cookie).split('; ' + name + '=');
        return parts.length === 2 ? decodeURIComponent(parts.pop().split(';').shift()) : null;
    }

    function writeCookie(name, value) {
        var expiry = new Date();
        expiry.setFullYear(expiry.getFullYear() + 1);
        document.cookie = name + '=' + encodeURIComponent(value) +
            ';expires=' + expiry.toUTCString() + ';path=/;SameSite=Lax';
    }

    function storedLang() {
        var value = null;
        try {
            value = window.localStorage.getItem(STORAGE_KEY);
        } catch (e) {
            value = null;
        }
        if (!value) {
            value = readCookie(COOKIE_NAME);
        }
        return value === 'hi' || value === 'en' ? value : DEFAULT_LANG;
    }

    function persist(lang) {
        try {
            window.localStorage.setItem(STORAGE_KEY, lang);
        } catch (e) {
            /* private browsing — cookie fallback below is enough */
        }
        writeCookie(COOKIE_NAME, lang);
    }

    function captureOriginals(root) {
        var nodes = root.querySelectorAll('[data-hi]');
        var i;
        for (i = 0; i < nodes.length; i++) {
            if (typeof nodes[i].bmkEnHtml !== 'string') {
                nodes[i].bmkEnHtml = nodes[i].innerHTML;
            }
        }
        for (var a = 0; a < ATTRS.length; a++) {
            var attr = ATTRS[a];
            var withAttr = root.querySelectorAll('[data-hi-' + attr + ']');
            for (i = 0; i < withAttr.length; i++) {
                var el = withAttr[i];
                if (!el.bmkEnAttrs) {
                    el.bmkEnAttrs = {};
                }
                if (!(attr in el.bmkEnAttrs)) {
                    el.bmkEnAttrs[attr] = el.getAttribute(attr) || '';
                }
            }
        }
    }

    function translate(root, lang) {
        var nodes = root.querySelectorAll('[data-hi]');
        var i;
        for (i = 0; i < nodes.length; i++) {
            var next = lang === 'hi' ? nodes[i].getAttribute('data-hi') : nodes[i].bmkEnHtml;
            if (typeof next === 'string' && nodes[i].innerHTML !== next) {
                nodes[i].innerHTML = next;
            }
        }
        for (var a = 0; a < ATTRS.length; a++) {
            var attr = ATTRS[a];
            var withAttr = root.querySelectorAll('[data-hi-' + attr + ']');
            for (i = 0; i < withAttr.length; i++) {
                var el = withAttr[i];
                var value = lang === 'hi'
                    ? el.getAttribute('data-hi-' + attr)
                    : (el.bmkEnAttrs ? el.bmkEnAttrs[attr] : null);
                if (typeof value === 'string') {
                    el.setAttribute(attr, value);
                }
            }
        }
    }

    function syncSwitcher(lang) {
        var buttons = document.querySelectorAll('.top-lang-btn');
        for (var i = 0; i < buttons.length; i++) {
            var isActive = buttons[i].getAttribute('data-lang') === lang;
            buttons[i].classList.toggle('is-active', isActive);
            buttons[i].setAttribute('aria-pressed', isActive ? 'true' : 'false');
        }
    }

    var current = DEFAULT_LANG;

    function setLang(lang, options) {
        current = lang === 'hi' ? 'hi' : 'en';
        captureOriginals(document);
        translate(document, current);
        syncSwitcher(current);
        document.documentElement.setAttribute('lang', current);
        document.documentElement.setAttribute('data-lang', current);
        if (!options || options.persist !== false) {
            persist(current);
        }
        try {
            document.dispatchEvent(new CustomEvent('bmk:langchange', { detail: { lang: current } }));
        } catch (e) {
            /* CustomEvent unsupported — listeners are optional */
        }
    }

    function bindSwitcher() {
        var switcher = document.querySelector('.top-lang-switch');
        if (!switcher || switcher.bmkBound) {
            return;
        }
        switcher.bmkBound = true;
        switcher.addEventListener('click', function (e) {
            var btn = e.target.closest ? e.target.closest('.top-lang-btn') : null;
            if (!btn) {
                return;
            }
            e.preventDefault();
            setLang(btn.getAttribute('data-lang'));
        });
    }

    window.BMKLang = {
        get: function () {
            return current;
        },
        set: setLang,
        /* Re-apply to markup injected after load (e.g. AJAX/UpdatePanel content). */
        refresh: function (root) {
            var scope = root || document;
            captureOriginals(scope);
            translate(scope, current);
        }
    };

    function init() {
        bindSwitcher();
        setLang(storedLang(), { persist: false });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }

    /* ASP.NET partial postbacks replace DOM chunks — re-translate afterwards. */
    if (window.Sys && window.Sys.WebForms && window.Sys.WebForms.PageRequestManager) {
        window.Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            bindSwitcher();
            window.BMKLang.refresh();
            syncSwitcher(current);
        });
    }
})(window, document);
