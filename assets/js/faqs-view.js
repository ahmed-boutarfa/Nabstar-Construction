document.addEventListener("DOMContentLoaded", () => {
    const container = document.getElementById("faqsContainer");

    async function loadFaqs() {
        try {
            showLoading(container,"Faq");
            const response = await fetch("api/faqs-api.php");
            if (!response.ok) throw new Error(`HTTP error: ${response.status}`);
            
            const result = await response.json();
            const faqs = result.data;
            renderFaqs(faqs);
        } catch (err) {
            console.error("error:", err);
            showError(container,"Failed to load FAQs");
        }
    }

    function renderFaqs(faqs) {
        container.innerHTML = "";
        faqs.forEach((item, index) => {
            const el = document.createElement("div");
            el.className = "faqs__item";
            
            // Generate unique IDs for accessibility
            const questionId = `question-${item.id}`;
            const answerId = `answer-${item.id}`;

            el.innerHTML = `
                <div class="faqs__header">
                    <button class="faqs__question-btn" 
                            aria-expanded="false" 
                            aria-controls="${answerId}">
                        <span class="faq__question">${item.question}</span>
                        <span class="faq__toggle-icon">+</span>
                    </button>
                </div>
                <div class="faqs__answers" id="${answerId}">
                    <span class="faq__answer">${item.answer}</span>
                </div>
            `;
            container.appendChild(el);
        });

        // Event delegation: Attach a single listener to the parent container
        container.addEventListener("click", (event) => {
            const btn = event.target.closest(".faqs__question-btn");
            if (btn) {
                const faqItem = btn.closest(".faqs__item");
                const isExpanded = btn.getAttribute("aria-expanded") === "true";

                // Toggle the 'is-active' class and aria attributes
                faqItem.classList.toggle("is-active", !isExpanded);
                btn.setAttribute("aria-expanded", !isExpanded);
            }
        });
    }
    loadFaqs();
});