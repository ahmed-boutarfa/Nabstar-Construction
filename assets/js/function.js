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
    // Configuration
    const CONFIG = {
        iframeId: "trainingIframe",
        formId: "contactForm",
        responseId: "formResponse",
        endpoint: "includes/contact.php",
        animationDuration: 3000
    };

    // Initialisation principale
    initFormHandler(document);

    // Gestion de l'iframe
    const iframe = document.getElementById(CONFIG.iframeId);
    if (iframe) {
        iframe.addEventListener("load", () => {
            try {
                const iframeDoc = iframe.contentDocument || iframe.contentWindow.document;
                initFormHandler(iframeDoc);
            } catch (error) {
                console.error("Erreur d'accès à l'iframe:", error);
            }
        });
    }
});

function initFormHandler(doc) {
    const { formId, responseId, endpoint, animationDuration } = CONFIG;
    
    const form = doc.getElementById(formId);
    const formResponse = doc.getElementById(responseId);

    if (!form) {
        console.warn(`Formulaire ${formId} introuvable`);
        return;
    }

    form.addEventListener("submit", handleSubmit);

    async function handleSubmit(e) {
        e.preventDefault();

        // Désactivation du bouton d'envoi
        const submitBtn = form.querySelector('button[type="submit"]');
        const originalText = submitBtn.textContent;
        submitBtn.disabled = true;
        submitBtn.textContent = "Envoi en cours...";

        // Réinitialisation de la réponse
        resetResponse(formResponse);

        try {
            const formData = new FormData(form);
            
            const response = await fetch(endpoint, {
                method: "POST",
                body: formData
            });

            if (!response.ok) throw new Error(`HTTP ${response.status}`);
            
            const data = await response.json();

            if (data.success) {
                showResponse(formResponse, data.message, "success");
                form.reset();
            } else {
                showResponse(formResponse, data.error, "error");
            }

        } catch (error) {
            console.error("Erreur:", error);
            showResponse(
                formResponse,
                "Erreur de connexion. Veuillez réessayer.",
                "error"
            );
        } finally {
            // Réactivation du bouton
            submitBtn.disabled = false;
            submitBtn.textContent = originalText;
        }
    }

    function resetResponse(responseElement) {
        responseElement.style.opacity = "0";
        responseElement.textContent = "";
        responseElement.className = "form-response";
    }

    function showResponse(responseElement, message, type) {
        responseElement.textContent = message;
        responseElement.style.color = type === "success" ? "#22c55e" : "#ef4444";
        responseElement.classList.add(type);
        
        // Animation d'apparition
        responseElement.style.opacity = "1";
        
        // Disparition progressive après délai
        setTimeout(() => {
            responseElement.style.transition = `opacity ${animationDuration}ms ease-out`;
            responseElement.style.opacity = "0";
        }, animationDuration);
    }
}

// show loading (pass container)
function showLoading(container, msg) {
  container.innerHTML = `
    <div class="loading">
      <i class="fas fa-spinner fa-spin loading__spinner"></i>
      <p>Loading ${msg}</p>
    </div>
  `;
}

// show error (pass container)
function showError(container, msg, retryCallback = null) {
  container.innerHTML = `
    <div class="error-message">
      <i class="fas fa-exclamation-circle"></i>
      <p>${msg}</p>
      ${retryCallback ? '<button class="retry-btn">Réessayer</button>' : ""}
    </div>
  `;

  if (retryCallback) {
    const retryBtn = container.querySelector(".retry-btn");
    retryBtn.addEventListener("click", retryCallback);
  }
}