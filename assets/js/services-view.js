document.addEventListener("DOMContentLoaded", () => {
    const container = document.getElementById("servicesContainer");
    const toggleBtn = document.getElementById("toggleBtn");

    function getLimit(defaultLimit = 6) {
        if (window.innerWidth < 480) return 4;
        if (window.innerWidth < 756) return 4;
        if (window.innerWidth < 1024) return 6;
        return defaultLimit;
    }

    let expanded = false;
    let allServices = [];
    let totalServices = 0;

    async function loadServices(offset = 0, limit = getLimit(), append = false) {
    try {
        showLoading(container, "Services");

        const res = await fetch(`api/services-api.php?offset=${offset}&limit=${limit}`);
        if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);

        const data = await res.json();
        const servicesData = data.data || data;

        if (!Array.isArray(servicesData)) {
          throw new Error('Invalid data format received from API');
        }

        if (!append) {
          container.innerHTML = ""
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

        // pagination button
        if (data.pagination && typeof data.pagination.has_more !== "undefined") {
          toggleBtn.style.display = data.pagination.has_more || expanded ? 'block' : 'none';
        }

    }catch (error) {
        console.error("Erreur:", error);
        showError(container, "Failed to load Services. Please try again later.", () => loadServices(offset, limit, append));
  }
}


function toggleServicesView() {
    if (!expanded) {
        loadServices(0, totalServices); // charge tout
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


  window.addEventListener('resize', () => {
    loadServices(0, getLimit());
  });


// Initial load
loadServices(0, getLimit());



// Styles CSS dynamiques
    const styles = `  
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