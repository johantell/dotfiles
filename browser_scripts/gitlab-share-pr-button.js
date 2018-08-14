// ==UserScript==
// @name         GitLab PR button
// @namespace    https://mintcore.se/
// @version      0.1
// @description  Adds a copy PR string button on to gitlab Merge requests
// @author       Johan Tell
// @match        http://gitlab.a.snowmen.se/*
// @grant        none
// ==/UserScript==

(function() {
    'use strict';

    function copyPrRequest() {
        let prTitle = document.querySelector("h2.title").textContent.trim();
        let href = document.location.href;

        let string = `(pr) **${prTitle}**\n${href}`;

        copyToClipboard(string);
    }

    function copyToClipboard(str) {
        const el = document.createElement('textarea');
        el.value = str;
        el.setAttribute('readonly', '');
        el.style.position = 'absolute';
        el.style.left = '-9999px';
        document.body.appendChild(el);
        el.select();
        document.execCommand('copy');
        document.body.removeChild(el);
    };

    function createCopyButton() {
        if(!document.location.href.includes("merge_requests")) return;

        let existingButton = document.querySelector(".copy-pr-string-button")
        let editButton = document.querySelector(
          ".detail-page-header-actions .js-issuable-edit"
        );

        if(existingButton || !editButton) return;

        let button = document.createElement("button");
        button.classList.add("btn", "btn-grouped", "copy-pr-string-button");
        button.textContent = "Copy PR string";
        button.addEventListener("click", () => {
            copyPrRequest();
        });

        editButton.parentNode.insertBefore(button, editButton);
    }

    createCopyButton();

})();


