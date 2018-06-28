function copyPrRequest() {
  let prTitle = document.querySelector("h2.title").textContent.trim();
  let href = document.location.href;

  let string = `**${prTitle}**\n${href}`;

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
  let prTitle = document.querySelector("h2.title");

  if(existingButton || !prTitle) return;

  let button = document.createElement("button");
  button.classList.add("btn", "copy-pr-string-button");
  button.textContent = "Copy PR string";
  button.addEventListener("click", () => {
    copyPrRequest();
  });

  prTitle.parentNode.insertBefore(button, prTitle.nextSibling);
}

createCopyButton();
