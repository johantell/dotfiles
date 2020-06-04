// ==UserScript==
// @name         Github PR button
// @namespace    https://mintcore.se/
// @version      0.2
// @description  Adds a copy PR string button on to github pull requests
// @author       Johan Tell
// @match        https://github.com/*
// @grant        none
// ==/UserScript==

(function() {
  'use strict';

  const SHARE_PR_BUTTON_CLASS = ".copy-pr-string-button"
  const PR_TITLE_HEADER_CLASS = ".js-issue-title";

  function copyPrRequest() {
    let prTitle = document.querySelector(PR_TITLE_HEADER_CLASS).textContent.trim();
    let href = document.location.href;

    let string = `:pr: *${prTitle}* \n${href}`;

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
    if(!isViewingPullRequest()) return;

    const container = document.querySelector(".gh-header-actions")

    let existingButton = document.querySelector(SHARE_PR_BUTTON_CLASS);

    console.log({container, existingButton});

    if(existingButton) return;

    let button = document.createElement("button");

    button.classList.add("btn", "btn-sm", "d-inline-block", SHARE_PR_BUTTON_CLASS);
    button.textContent = "Copy PR string";
    button.addEventListener("click", (e) => {
      e.preventDefault();
      copyPrRequest();
    });

    container.insertBefore(button, container.firstChild);
  }

  function isViewingPullRequest() {
    return document.location.href.includes("/pull/");
  }

  createCopyButton();
})();


