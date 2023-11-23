document.addEventListener("DOMContentLoaded", function () {
    const themeToggleButton = document.getElementById("theme-toggle-button");
    const themeStylesheet = document.getElementById("theme-stylesheet");

    themeToggleButton.addEventListener("click", function () {
        if (themeStylesheet.getAttribute("href") === "light-theme.css") {
            themeStylesheet.setAttribute("href", "dark-theme.css");
        } else {
            themeStylesheet.setAttribute("href", "light-theme.css");
        }
    });
});