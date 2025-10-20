document.addEventListener("DOMContentLoaded", () => {
    const container = document.getElementById("workContainer");
    const toggleBtn = document.getElementById("toggleWorkBtn");
    let expanded = false;
    let allWorks = [];

    // Déterminer la limite en fonction de la largeur d'écran
    function getLimit(defaultLimit = 2) {
        return window.innerWidth < 756 ? 2 : defaultLimit;
    }

    // Charger les œuvres depuis l'API
    async function loadWorks(offset = 0, limit = 2) {
        try {
            showLoading();
            
            const response = await fetch(`api/work-api.php?offset=${offset}&limit=${limit}`);
            
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            
            const data = await response.json();
            
            if (data.status === 'error') {
                throw new Error(data.message);
            }
            
            if (data.data.length > 0) {
                renderWorks(data.data);
                
                // Si on charge toutes les œuvres, on les stocke
                if (limit === 100) {
                    allWorks = data.data;
                }
                
                // Masquer le bouton s'il n'y a pas assez d'œuvres
                if (data.data.length < getLimit() && !expanded) {
                    toggleBtn.style.display = 'none';
                } else {
                    toggleBtn.style.display = 'block';
                }
            } else {
                showError("No works found");
            }
        } catch (error) {
            console.error("Error fetching works:", error);
            showError("Failed to load works. Please try again later.");
        }
    }

    // Afficher les œuvres dans le conteneur
    function renderWorks(works) {
        // Clear the container
        container.innerHTML = '';

        // Use a document fragment for better performance when appending multiple elements
        const fragment = document.createDocumentFragment();

        works.forEach(item => {
            const workElement = document.createElement('div');
            workElement.classList.add('work__item');

            // Format dates
            const dateText = item.date_fin && item.date_fin > item.date_beg 
                ? `${item.date_beg} - ${item.date_fin}` 
                : item.date_beg || '';

            workElement.innerHTML = `
                <div class="work__image__div">
                    <img alt="${item.title}" class="work__image" loading="lazy" 
                         src="${item.image || 'https://placehold.co/600x400/3498db/white?text=No+Image'}">
                    <div class="date-display">${dateText || '0'}</div>
                </div>
                <div class="work__item__data">
                    <div class="work__headline">
                    <h2>${item.title || 'Untitled'}</h2>
                    <p class="work__bio">${item.bio || 'No description available.'}</p>
                    ${item.bio && item.bio.length > 100 ? `<a class="view-more-btn">View More</a>` : ""}
                    </div>
                    <div class="work__info">
                    <p><div class="icon__bg__accent"><i class="fa-solid fa-location-dot"></i></div> 
                         <span>Location: ${item.location || 'Not specified'}</span></p>
                    <p><div class="icon__bg__accent"><i class="fa-solid fa-up-down-left-right"></i></div> 
                         <span>Total Area: ${item.total_area || 'Not specified'}</span></p>
                    <p><div class="icon__bg__accent"><i class="fa-solid fa-calendar"></i></div> 
                         <span>Duration: ${item.duration || 'Not specified'}</span></p>
                    </div>
                    <a href="#" class="learn__more__card" data-title="${item.title || ''}">Learn more <i class="fa-solid fa-arrow-right"></i></a>
                </div>
            `;
        
            const bio = workElement.querySelector(".work__bio");
            const btn = workElement.querySelector(".view-more-btn");
        
            if (btn) {
                btn.addEventListener("click", () => {
                    bio.classList.toggle("expanded");
                    btn.textContent = bio.classList.contains("expanded") ? "View Less" : "View More";
                });
            }

            fragment.appendChild(workElement);
        });
    
        // Append all elements at once after the loop
        container.appendChild(fragment);
    
        // Add event listeners for all cards *once* after they are rendered
        document.querySelectorAll(".work__item").forEach(card => {
            card.addEventListener("mousemove", (e) => {
                const rect = card.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;
            
                const centerX = rect.width / 2;
                const centerY = rect.height / 2;
            
                const rotateX = ((y - centerY) / centerY) * 2;
                const rotateY = ((x - centerX) / centerX) * -2;
            
                card.style.transform = `scale(1.01) perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg)`;
            });
        
            card.addEventListener("mouseleave", () => {
                card.style.transform = "scale(1) perspective(1000px) rotateX(0deg) rotateY(0deg)";
            });
        });
    }

    // Fonction pour ouvrir l'overlay du projet - DÉPLACÉE ICI
    async function openProjectOverlay(title) {
        try {
            // Afficher l'animation de chargement
            showIframeLoading();
            
            const res = await fetch(`api/work-detaille-api.php?id=${encodeURIComponent(title)}`);
            const json = await res.json();
          
            if (json.status !== 'success') {
                throw new Error(json.message || 'Failed to load project');
            }
            
            const { project, gallery } = json.data;
            showProjectIframe(project, gallery);
          
        } catch (err) {
            console.error("Error loading project details:", err);
            showIframeError("Failed to load project details.");
        }
    }
    function showProjectIframe(project, gallery) {
        // CRÉATION CORRECTE DE LA GALERIE
        const galleryHtml = gallery && gallery.length > 0 ? 
            `<div class="gallery-section">
                <h3>Project Gallery (${gallery.length})</h3>
                <div class="gallery-grid">
                    ${gallery.map((img, index) => 
                        `<img class="gallery__image" src="${img.filename}" alt="Gallery image ${index + 1}" data-index="${index}">`
                    ).join('')}
                </div>
            </div>` : 
            '<p class="no-gallery">No gallery images available</p>';

        const html = `
            <!DOCTYPE html>
            <html>
            <head>
                <meta charset="utf-8">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
                <link rel="stylesheet" href="assets/css/iframe.css">
                <style>
                    body {
                        font-family: Arial, Helvetica, sans-serif;
                        padding: 20px;
                        color: #222;
                        background: #f5f5f5;
                    }
                    .work__bio {
                        max-height: 2.5em;
                        overflow: hidden;
                        transition: max-height 0.5s ease;
                        margin-bottom:0;
                    }
                    .work__bio.expanded {
                        max-height: 500px;
                    }
                    .gallery-grid {
                        display: grid;
                        grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
                        gap: 15px;
                        margin: 20px 0;
                    }
                    .gallery__image {
                        width: 100%;
                        height: 150px;
                        object-fit: cover;
                        border-radius: 8px;
                        cursor: pointer;
                        transition: transform 0.3s ease;
                    }
                    .gallery__image:hover {
                        transform: scale(1.05);
                    }
                    .gallery-section h3 {
                        color: var(--primary-color);
                        margin-bottom: 15px;
                    }
                </style>
            </head>
            <body>
                <div class="project-container">
                    <div class="work__info__content">
                        <div class="work__headline">
                            <h2>${project.title || 'Untitled'}</h2>
                            <p class="work__bio">${project.bio || 'No description available.'}</p>
                            ${project.bio && project.bio.length > 150 ? 
                                '<button class="view-more-btn">View More</button>' : ''}
                        </div>
                        <div class="work__info">
                            <div class="degradation"></div>
                            <div class="work__info__">
                                <p><span class="work__info__type">Location: </span><br>${project.location || 'Not specified'}</p>
                                <p><span class="work__info__type">Total Area: </span><br>${project.total_area || 'Not specified'}</p>
                                <p><span class="work__info__type">Duration: </span><br>${project.duration || 'Not specified'}</p>
                            </div>
                            <div class="degradation"></div>
                        </div>
                    </div>
                    
                    ${galleryHtml}
                </div>

                <!-- Lightbox pour la galerie -->
                <div class="image-overlay" id="imageOverlay">
                    <span class="close-btn" id="closeOverlay">&times;</span>
                    <button class="nav-btn" id="prevBtn">&#10094;</button>
                    <img src="" alt="" id="overlayImg">
                    <button class="nav-btn" id="nextBtn">&#10095;</button>
                    <div class="image-counter" id="imageCounter"></div>
                </div>

                <script>
                    // Gestion du View More
                    document.addEventListener('click', (e) => {
                        if (e.target.classList.contains('view-more-btn')) {
                            e.preventDefault();
                            const bio = e.target.closest('.work__headline').querySelector('.work__bio');
                            bio.classList.toggle('expanded');
                            e.target.textContent = bio.classList.contains('expanded') ? 'View Less' : 'View More';
                        }
                    });

                    // Galerie d'images - FONCTIONNEL
                    const overlay = document.getElementById('imageOverlay');
                    const overlayImg = document.getElementById('overlayImg');
                    const closeOverlay = document.getElementById('closeOverlay');
                    const prevBtn = document.getElementById('prevBtn');
                    const nextBtn = document.getElementById('nextBtn');
                    const imageCounter = document.getElementById('imageCounter');
                    
                    const galleryImages = document.querySelectorAll('.gallery__image');
                    let currentImageIndex = 0;

                    // Vérifier qu'il y a des images
                    if (galleryImages.length > 0) {
                        // Clic sur une image
                        galleryImages.forEach((img, index) => {
                            img.addEventListener('click', () => {
                                currentImageIndex = index;
                                showImage(currentImageIndex);
                            });
                        });

                        function showImage(index) {
                            overlayImg.src = galleryImages[index].src;
                            imageCounter.textContent = \`\${index + 1} / \${galleryImages.length}\`;
                            overlay.style.display = 'flex';
                            document.body.style.overflow = 'hidden';
                        }

                        // Navigation
                        prevBtn.addEventListener('click', (e) => {
                            e.stopPropagation();
                            currentImageIndex = (currentImageIndex - 1 + galleryImages.length) % galleryImages.length;
                            showImage(currentImageIndex);
                        });

                        nextBtn.addEventListener('click', (e) => {
                            e.stopPropagation();
                            currentImageIndex = (currentImageIndex + 1) % galleryImages.length;
                            showImage(currentImageIndex);
                        });

                        // Fermer
                        closeOverlay.addEventListener('click', (e) => {
                            e.stopPropagation();
                            closeLightbox();
                        });

                        overlay.addEventListener('click', (e) => {
                            if (e.target === overlay) closeLightbox();
                        });

                        function closeLightbox() {
                            overlay.style.display = 'none';
                            document.body.style.overflow = '';
                        }

                        // Clavier
                        document.addEventListener('keydown', (e) => {
                            if (overlay.style.display === 'flex') {
                                if (e.key === 'Escape') closeLightbox();
                                if (e.key === 'ArrowLeft') prevBtn.click();
                                if (e.key === 'ArrowRight') nextBtn.click();
                            }
                        });

                        // Swipe mobile
                        let startX = 0;
                        overlay.addEventListener('touchstart', (e) => {
                            startX = e.touches[0].clientX;
                        });

                        overlay.addEventListener('touchend', (e) => {
                            const endX = e.changedTouches[0].clientX;
                            if (startX - endX > 50) nextBtn.click();
                            else if (endX - startX > 50) prevBtn.click();
                        });
                    }
                </script>
            </body>
            </html>
        `;

        const iframe = document.getElementById('trainingIframe');
        const overlay = document.getElementById('iframeOverlay');
        
        // Animation d'ouverture
        overlay.style.display = 'flex';
        setTimeout(() => {
            overlay.classList.add('active');
            iframe.srcdoc = html;
        }, 50);
    }

    // Animation de chargement pour l'iframe
    function showIframeLoading() {
        const overlay = document.getElementById('iframeOverlay');
        const iframe = document.getElementById('trainingIframe');
        
        overlay.style.display = 'flex';
        overlay.classList.add('loading');
        iframe.srcdoc = `
            <!DOCTYPE html>
            <html>
            <head><style>
                body { display: flex; align-items: center; justify-content: center; height: 100vh; margin: 0; }
                .loading-spinner { width: 50px; height: 50px; border: 5px solid #f3f3f3; border-top: 5px solid #007bff; border-radius: 50%; animation: spin 1s linear infinite; }
                @keyframes spin { 0% { transform: rotate(0deg); } 100% { transform: rotate(360deg); } }
            </style></head>
            <body><div class="loading-spinner"></div></body>
            </html>
        `;
    }

    function showIframeError(message) {
        const iframe = document.getElementById('trainingIframe');
        iframe.srcdoc = `
            <!DOCTYPE html>
            <html>
            <head><style>
                body { display: flex; align-items: center; justify-content: center; height: 100vh; margin: 0; font-family: Arial; }
                .error { text-align: center; color: #dc3545; }
            </style></head>
            <body>
                <div class="error">
                    <i class="fas fa-exclamation-triangle" style="font-size: 3rem; margin-bottom: 1rem;"></i>
                    <h3>Error</h3>
                    <p>${message}</p>
                </div>
            </body>
            </html>
        `;
    }

    // Afficher l'état de chargement
    function showLoading() {
        container.innerHTML = '<div class="loading"><i class="fas fa-spinner fa-spin"></i> Loading works...</div>';
    }

    // Afficher un message d'erreur
    function showError(message) {
        container.innerHTML = `<div class="error-message"><i class="fas fa-exclamation-circle"></i> ${message}</div>`;
    }

    // Gestionnaire d'événement pour le bouton View More/Less
    toggleBtn.addEventListener("click", () => {
        if (!expanded) {
            if (allWorks.length > 0) {
                renderWorks(allWorks);
            } else {
                loadWorks(0, 100);
            }
            toggleBtn.textContent = "View Less";
        } else {
            loadWorks(0, getLimit());
            toggleBtn.textContent = "View More";
        }
        expanded = !expanded;
    });

    // Gestionnaire pour les boutons "Learn more" - DÉPLACÉ ICI
    document.addEventListener('click', (e) => {
        const learnMoreBtn = e.target.closest('.learn__more__card');
        if (learnMoreBtn) {
            e.preventDefault();
            const title = learnMoreBtn.dataset.title;
            openProjectOverlay(title);
        }
    });

    // Recharger lors du redimensionnement
    let resizeTimer;
    window.addEventListener('resize', () => {
        clearTimeout(resizeTimer);
        resizeTimer = setTimeout(() => {
            if (!expanded) {
                loadWorks(0, getLimit());
            }
        }, 250);
    });

    // Fermer l'iframe
    document.getElementById("closeIframe").addEventListener("click", () => {
        const overlay = document.getElementById("iframeOverlay");
        const iframe = document.getElementById("trainingIframe");
        iframe.src = "";
        overlay.style.display = "none";
    });

    // Chargement initial
    loadWorks(0, getLimit());
});