document.addEventListener('DOMContentLoaded', () => {
  const elements = document.querySelectorAll('.animate-on-scroll');

  const observer = new IntersectionObserver((entries, obs) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('visible');
        obs.unobserve(entry.target);
      }
    });
  }, { threshold: 0.2 });

  elements.forEach(el => observer.observe(el));
});

document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener("click", function(e) {
        e.preventDefault();
        const targetId = this.getAttribute("href").substring(1);
        const target = document.getElementById(targetId);

        if (target) {
            const offset = window.innerWidth>1025?80:10; // hauteur offset
            const topPos = target.getBoundingClientRect().top + window.scrollY - offset;

            window.scrollTo({
                top: topPos,
                behavior: "smooth"
            });
        }
    });
});


document.addEventListener("DOMContentLoaded", () => {
    
    initFormHandler(document);

    
    const iframe = document.getElementById("trainingIframe");
    if (iframe) {
        iframe.addEventListener("load", () => {
            const iframeDoc = iframe.contentDocument || iframe.contentWindow.document;
            initFormHandler(iframeDoc);
        });
    }
});

function initFormHandler(doc) {
    const form = doc.getElementById("contactForm");
    const formResponse = doc.getElementById("formResponse");

    if (!form) return;
    
    form.addEventListener("submit", function (e) {
        e.preventDefault();

        let formData = new FormData(this);

        fetch("includes/contact.php", {
            method: "POST",
            body: formData
        })
        .then(r => r.json())
        .then(data => {
            if (data.success) {
                formResponse.style.color = "green";
                formResponse.textContent = data.message;
                form.reset();
            } else {
                formResponse.style.color = "red";
                formResponse.textContent = data.error;
            }

            formResponse.style.opacity = "1";
            setTimeout(() => {
                formResponse.style.transition = "opacity 1s ease-out";
                formResponse.style.opacity = "0";
            }, 3000);
        })
        .catch(err => {
            formResponse.style.color = "red";
            formResponse.textContent = "An error occurred.";
            console.error(err);
        });
    });
}
