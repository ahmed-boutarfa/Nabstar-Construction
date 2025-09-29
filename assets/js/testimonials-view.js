document.addEventListener("DOMContentLoaded", () => {
    const container = document.getElementById("testimonialsContainer");
    const prevBtn = document.getElementById("prevBtn");
    const nextBtn = document.getElementById("nextBtn");
    const dotsContainer = document.getElementById("testimonialsDots");

    const MAX_VISIBLE_DOTS = 9;
    let testimonials = [];
    let itemViewCard = getItemViewCard();

    function getItemViewCard() {
        return window.innerWidth > 968 ? 2 : 1;
    }

    // Ajuste le nombre de cartes visibles au resize
    window.addEventListener("resize", () => {
        const newItemViewCard = getItemViewCard();
        if (newItemViewCard !== itemViewCard) {
            itemViewCard = newItemViewCard;
            updateDots();
            updateSliderState();
        }
    });

    async function loadTestimonials() {
        try {
            showLoading();
            const response = await fetch("api/testimonials-api.php");
            if (!response.ok) throw new Error(`HTTP error: ${response.status}`);
            const result = await response.json();
            testimonials = result.data.map(item => ({
                id: item.id,
                name: item.client_name,
                company: item.company,
                content: item.content,
                rating: item.rating
            }));
            renderTestimonials();
            updateDots();
            updateSliderState();
        } catch (err) {
            console.error("Erreur:", err);
            showError("Échec du chargement des témoignages. Veuillez réessayer plus tard.");
        }
    }

    function renderTestimonials() {
        container.innerHTML = "";
        testimonials.forEach(item => {
            const el = document.createElement("div");
            el.className = "testimonial__item";
            el.setAttribute("data-id", item.id);
            el.innerHTML = `
                <div class="testimonial__rating">
                    ${renderStars(item.rating)} <span>${item.rating ? item.rating.toFixed(1) : '0.0'}</span>
                </div>
                <p class="testimonial__text">${item.content || "Aucun témoignage disponible."}</p>
                <div class="testimonial__footer">
                    <p class="testimonial__name">${item.name || "Anonyme"}</p>
                    <p class="testimonial__role">${item.company || "Client heureux"}</p>
                </div>
            `;
            container.appendChild(el);
        });
    }

    function renderStars(rating = 0) {
        let stars = "";
        const fullStars = Math.floor(rating);
        const hasHalfStar = rating % 1 >= 0.5;
        for (let i = 1; i <= 5; i++) {
            if (i <= fullStars) stars += `<i class="fas fa-star"></i>`;
            else if (i === fullStars + 1 && hasHalfStar) stars += `<i class="fas fa-star-half-alt"></i>`;
            else stars += `<i class="far fa-star"></i>`;
        }
        return stars;
    }

    // Création des dots
    function updateDots() {
        const numDots = Math.ceil(testimonials.length / itemViewCard);
        const existingDots = dotsContainer.querySelectorAll("button");

        if (existingDots.length === numDots) return;

        dotsContainer.innerHTML = "";
        for (let i = 0; i < numDots; i++) {
            const dot = document.createElement("button");
            dot.setAttribute("aria-label", `Aller à la slide ${i + 1}`);
            dot.addEventListener("click", () => scrollToSlide(i));
            dotsContainer.appendChild(dot);
        }
    }

    // Met à jour le slider et l'état des dots
    function updateSliderState() {
        const scrollLeft = container.scrollLeft;
        const firstCard = container.querySelector(".testimonial__item");
        if (!firstCard) return;

        const cardWidth = firstCard.offsetWidth + 30;
        const currentIndex = Math.round(scrollLeft / cardWidth);

        prevBtn.disabled = currentIndex === 0;
        nextBtn.disabled = currentIndex + itemViewCard >= testimonials.length;

        const activeDotIndex = Math.floor(currentIndex / itemViewCard);
        dotsContainer.querySelectorAll("button").forEach((dot, idx) => {
            dot.classList.toggle("active", idx === activeDotIndex);
        });

        updateDotsVisible(activeDotIndex);
    }

    // Fenêtre glissante des dots
    function updateDotsVisible(activeDotIndex) {
        const dots = Array.from(dotsContainer.querySelectorAll("button"));
        if (dots.length <= MAX_VISIBLE_DOTS) {
            dots.forEach(dot => dot.style.display = "inline-block");
            return;
        }

        let start = Math.max(0, activeDotIndex - Math.floor(MAX_VISIBLE_DOTS / 2));
        let end = start + MAX_VISIBLE_DOTS;

        if (end > dots.length) {
            end = dots.length;
            start = Math.max(0, end - MAX_VISIBLE_DOTS);
        }

        dots.forEach((dot, idx) => {
            dot.style.display = (idx >= start && idx < end) ? "inline-block" : "none";
        });
    }

    function scrollToSlide(index) {
        const firstCard = container.querySelector(".testimonial__item");
        if (!firstCard) return;

        const cardWidth = firstCard.offsetWidth + 60;
        container.scrollTo({
            left: index * cardWidth * itemViewCard,
            behavior: "smooth"
        });
    }

    prevBtn.addEventListener("click", () => {
        container.scrollBy({ left: -container.offsetWidth, behavior: "smooth" });
    });

    nextBtn.addEventListener("click", () => {
        container.scrollBy({ left: container.offsetWidth, behavior: "smooth" });
    });

    container.addEventListener("scroll", updateSliderState);

    function showLoading() {
        container.innerHTML = `
            <div class="loading">
                <i class="fas fa-spinner fa-spin loading__spinner"></i>
                <p>Chargement des témoignages...</p>
            </div>
        `;
    }

    function showError(msg) {
        container.innerHTML = `
            <div class="error-message">
                <i class="fas fa-exclamation-circle"></i>
                <p>${msg}</p>
                <button class="retry-btn" onclick="loadTestimonials()">Réessayer</button>
            </div>
        `;
    }

    loadTestimonials();
});
