document.addEventListener("DOMContentLoaded", () => {
  const counters = document.querySelectorAll('.counter');

  function animateCounter(el, duration = 2000) {
    const target = parseInt(el.getAttribute('data-target'), 10);
    const startTime = performance.now();

    function tick(now) {
      const progress = Math.min((now - startTime) / duration, 1);
      const current = Math.round(target * progress);
      el.textContent = current;
      if (progress < 1) {
        requestAnimationFrame(tick);
      }
    }

    requestAnimationFrame(tick);
  }

  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      const el = entry.target;
      if (entry.isIntersecting) {
        el.textContent = "0";
        animateCounter(el, 2000);
      } else {
        el.textContent = "0";
      }
    });
  }, { threshold: 0.5 });

  counters.forEach(el => observer.observe(el));
});
