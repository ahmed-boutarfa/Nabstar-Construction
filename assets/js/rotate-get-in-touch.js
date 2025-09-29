document.addEventListener('DOMContentLoaded', function() {
            // Animation du texte circulaire
            const textCircle = document.querySelector('.circle-text-circle');
            const text = "GET IN TOUCH • GET IN TOUCH ";
            const characters = text.split('');
            const totalChars = characters.length;

            textCircle.innerHTML = '';

            characters.forEach((char, index) => {
                const span = document.createElement('span');
                span.textContent = char;
                span.style.setProperty('--i', index + 1);
                span.style.setProperty('--total-chars', totalChars);
                textCircle.appendChild(span);
            });

            // Animation des compteurs
            const counters = document.querySelectorAll('.counter');
            const animationDuration = 2000; // 2 seconds
            const frameDuration = 1000 / 60; // 60 frames per second
            const totalFrames = Math.round(animationDuration / frameDuration);
            
            const easeOutQuad = t => t * (2 - t);
            
            const startCounterAnimation = () => {
                counters.forEach(counter => {
                    const target = parseInt(counter.getAttribute('data-target'));
                    let current = 0;
                    const increment = target / totalFrames;
                    
                    const updateCounter = () => {
                        current += increment;
                        if (current < target) {
                            counter.textContent = Math.round(current);
                            requestAnimationFrame(updateCounter);
                        } else {
                            counter.textContent = target;
                        }
                    };
                    
                    // Observer pour déclencher l'animation lorsque l'élément est visible
                    const observer = new IntersectionObserver((entries) => {
                        entries.forEach(entry => {
                            if (entry.isIntersecting) {
                                counter.style.opacity = 1;
                                updateCounter();
                                observer.unobserve(entry.target);
                            }
                        });
                    }, { threshold: 0.5 });
                    
                    observer.observe(counter);
                });
            };

            // Démarrer l'animation des compteurs
            startCounterAnimation();

            // Animation d'apparition des éléments au défilement
            const animateOnScroll = () => {
                const elements = document.querySelectorAll('.service-div, .features-table td, .experiance-info-div');
                
                const observer = new IntersectionObserver((entries) => {
                    entries.forEach(entry => {
                        if (entry.isIntersecting) {
                            entry.target.style.opacity = 1;
                            entry.target.style.transform = 'translateY(0)';
                            observer.unobserve(entry.target);
                        }
                    });
                }, { threshold: 0.1 });
                
                elements.forEach(element => {
                    element.style.opacity = 0;
                    element.style.transform = 'translateY(20px)';
                    element.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
                    observer.observe(element);
                });
            };

            // Démarrer l'animation au défilement
            animateOnScroll();
        });