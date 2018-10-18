// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

window.addEventListener("DOMContentLoaded", function() {
  document.querySelector("#copy-to-clipboard").addEventListener("click", e => {
    const secret = document.getElementById("encrypted-secret");
    window.getSelection().selectAllChildren(secret);
    document.execCommand("copy");
    window.getSelection().removeAllRanges();
  });
});
