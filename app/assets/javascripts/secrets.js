// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

window.addEventListener("DOMContentLoaded", function() {
  document.querySelector("#copy-to-clipboard").addEventListener("click", e => {
    const secret = document.getElementById("encrypted-secret");
    window.getSelection().selectAllChildren(secret);
    document.execCommand("copy");
    window.getSelection().removeAllRanges();
  });

  document.querySelector("#file-download").addEventListener("click", e => {
    const secret = document.getElementById("encrypted-secret");
    const file = document.createElement('a');
    file.href = 'data:text/plain;charset=utf-8,' + encodeURIComponent(secret.innerText);
    file.target = '_blank';
    file.download = 'secret.gpg';
    file.click();
  });
});