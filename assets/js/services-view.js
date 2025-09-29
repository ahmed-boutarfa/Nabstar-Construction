document.addEventListener("DOMContentLoaded", () => {
    const container = document.getElementById("servicesContainer");
    const toggleBtn = document.getElementById("toggleBtn");
    
    // Créer des éléments d'interface utilisateur
    const loadingIndicator = document.createElement('div');
    loadingIndicator.className = 'loading-indicator';
    loadingIndicator.innerHTML = `
        <div class="spinner"></div>
        <p>Loading services...</p>
    `;
    loadingIndicator.style.display = 'none';
    
    const errorMessage = document.createElement('div');
    errorMessage.className = 'error-message';
    errorMessage.style.display = 'none';
    
    container.parentNode.insertBefore(loadingIndicator, container);
    container.parentNode.insertBefore(errorMessage, container.nextSibling);

    function getLimit(defaultLimit = 6) {
        if (window.innerWidth < 480) return 4;
        if (window.innerWidth < 756) return 4;
        if (window.innerWidth < 1024) return 6;
        return defaultLimit;
    }

    let expanded = false;
    let isLoading = false;
    let allServices = [];
    let totalServices = 0;

    function showLoading() {
        isLoading = true;
        loadingIndicator.style.display = 'flex';
        errorMessage.style.display = 'none';
        container.style.opacity = '0.5';
        toggleBtn.disabled = true;
        toggleBtn.style.opacity = '0.7';
    }

    function hideLoading() {
        isLoading = false;
        loadingIndicator.style.display = 'none';
        container.style.opacity = '1';
        toggleBtn.disabled = false;
        toggleBtn.style.opacity = '1';
    }

    function showError(message) {
        hideLoading();
        errorMessage.textContent = message || 'Failed to load services. Please try again.';
        errorMessage.style.display = 'block';
        console.error("Error fetching services:", message);
    }

    function loadServices(offset = 0, limit = 9, append = false) {
        if (isLoading) return;
        showLoading();

        fetch(`api/services-api.php?offset=${offset}&limit=${limit}`)
            .then(res => {
                if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
                return res.json();
            })
            .then(data => {
                const servicesData = data.data || data;

                if (!Array.isArray(servicesData)) {
                    throw new Error('Invalid data format received from API');
                }

                if (!append) {
                    container.innerHTML = "";
                    allServices = servicesData;
                } else {
                    allServices = [...allServices, ...servicesData];
                }

                totalServices = data.pagination ? data.pagination.total : servicesData.length;

                if (servicesData.length === 0 && !append) {
                    container.innerHTML = `
                        <div class="no-services">
                            <i class="fas fa-concierge-bell"></i>
                            <p>No services available at the moment</p>
                        </div>
                    `;
                    toggleBtn.style.display = 'none';
                    hideLoading();
                    return;
                }

                servicesData.forEach((service, index) => {
                    const card = document.createElement("div");
                    card.className = "service__card";
                    card.style.opacity = '0';
                    card.style.transform = 'translateY(20px)';
                    card.innerHTML = `
                        <div><i class="${service.icon}"></i></div>
                        <h3>${service.name}</h3>
                        <p>${service.description}</p>
                    `;
                    container.appendChild(card);

                    setTimeout(() => {
                        card.style.transition = 'opacity 0.5s ease, transform 0.5s ease, box-shadow 0.3s ease';
                        card.style.opacity = '1';
                        card.style.transform = 'translateY(0)';
                    }, 100 * index);
                });

                // FIX: utiliser has_more de l’API
                if (data.pagination && typeof data.pagination.has_more !== "undefined") {
                    toggleBtn.style.display = data.pagination.has_more ? 'block' : 'none';
                } else {
                    toggleBtn.style.display = servicesData.length >= limit ? 'block' : 'none';
                }

                hideLoading();
            })
            .catch(error => {
                showError(error.message);
            });
    }

    function toggleServicesView() {
        if (isLoading) return;

        if (!expanded) {
            loadServices(0, totalServices || 100); // charge tout
            toggleBtn.textContent = "View Less";
            toggleBtn.setAttribute('aria-expanded', 'true');
        } else {
            loadServices(0, getLimit());
            toggleBtn.textContent = "View More";
            toggleBtn.setAttribute('aria-expanded', 'false');
        }
        expanded = !expanded;
    }

    toggleBtn.addEventListener("click", toggleServicesView);

    container.addEventListener('mouseover', (e) => {
        if (e.target.closest('.service__card')) {
            const card = e.target.closest('.service__card');
            card.style.boxShadow = '0 10px 30px rgba(0, 0, 0, 0.15)';
            card.style.transform = 'translateY(-5px)';
        }
    });

    container.addEventListener('mouseout', (e) => {
        if (e.target.closest('.service__card')) {
            const card = e.target.closest('.service__card');
            card.style.boxShadow = '';
            card.style.transform = '';
        }
    });

    // Initial load
    loadServices(0, getLimit());



    // Styles CSS dynamiques
    const styles = `
        .loading-indicator {
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            color: var(--primary-color);
        }
        
        .loading-indicator .spinner {
            width: 40px;
            height: 40px;
            border: 4px solid rgba(1, 22, 90, 0.1);
            border-top: 4px solid var(--accent-color);
            border-radius: 50%;
            animation: spin 1s linear infinite;
            margin-bottom: 1rem;
        }
        
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        .error-message {
            display: none;
            background-color: #ffebee;
            color: #c62828;
            padding: 1rem;
            border-radius: 8px;
            text-align: center;
            margin: 1rem 0;
            border-left: 4px solid #c62828;
        }
        
        .no-services {
            text-align: center;
            padding: 3rem;
            color: var(--text-color);
            grid-column: 1 / -1;
        }
        
        .no-services i {
            font-size: 3rem;
            color: var(--accent-color);
            margin-bottom: 1rem;
            display: block;
        }

        .service__card:hover div i {
            transform: scale(1.2);
        }
        
        .service__card {
            transition: opacity 0.5s ease, transform 0.5s ease, box-shadow 0.3s ease;
        }
        
        .service__card:hover {
            transform: translateY(-5px) scale(1.02);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }

        .service__card > div {
            transition: background-color 0.3s ease, transform 0.5s ease;
        }

        .service__card:hover>div {
            background-color: var(--accent-color);
            transform: scale(1.1);
        }
        
        .service__card:hover h3 {
            color: var(--accent-color);
        }
        
        .view-more:disabled {
            cursor: not-allowed;
        }
    `;

    // Injecter les styles
    const styleSheet = document.createElement('style');
    styleSheet.textContent = styles;
    document.head.appendChild(styleSheet);
});