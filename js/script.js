document.addEventListener('DOMContentLoaded', function () {
    var navbarToggler = document.querySelector('.navbar-toggler');
    if (!navbarToggler.classList.contains('collapsed')) {
        navbarToggler.classList.add('collapsed');
    }
});