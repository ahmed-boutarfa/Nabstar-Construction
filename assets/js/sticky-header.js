document.addEventListener('DOMContentLoaded', function() {
    const header = document.querySelector('.main-header');
    const scrollThreshold = 100;

    window.addEventListener('scroll', () => {
        if (window.scrollY > scrollThreshold) {
            header.classList.add('is-sticky');
        } else {
            header.classList.remove('is-sticky');
        }
    });
});