document.addEventListener('DOMContentLoaded', function () {
    const mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
    const headerContactNavWrapper = document.querySelector('.header-contact-nav-wrapper');
    const mainNavList = document.querySelector('.main-nav-list');
    const iconMenu = mobileMenuToggle.querySelector('.icon-menu');
    const iconClose = mobileMenuToggle.querySelector('.icon-close');

    function closeMenu() {
        mobileMenuToggle.setAttribute('aria-expanded', 'false');
        mobileMenuToggle.setAttribute('aria-label', 'Open menu');
        headerContactNavWrapper.classList.remove('is-active');
        iconMenu.classList.remove('hide');
        iconClose.classList.add('hide');
    }

    function openMenu() {
        mobileMenuToggle.setAttribute('aria-expanded', 'true');
        mobileMenuToggle.setAttribute('aria-label', 'Close menu');
        headerContactNavWrapper.classList.add('is-active');
        iconMenu.classList.add('hide');
        iconClose.classList.remove('hide');
    }

    mobileMenuToggle.addEventListener('click', function () {
        const isExpanded = this.getAttribute('aria-expanded') === 'true';
        isExpanded ? closeMenu() : openMenu();
    });

    // Fermer le menu quand on clique sur un lien
    mainNavList?.querySelectorAll('a').forEach(link => {
        link.addEventListener('click', closeMenu);
    });

    // Fermer en cliquant dehors
    document.addEventListener('click', function (e) {
        if (
            headerContactNavWrapper.classList.contains('is-active') &&
            !headerContactNavWrapper.contains(e.target) &&
            !mobileMenuToggle.contains(e.target)
        ) {
            closeMenu();
        }
    });
});
