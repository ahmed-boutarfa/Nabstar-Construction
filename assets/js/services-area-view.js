document.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById("servicesAreaContainer");
  const toggleBtn = document.getElementById("toggleAreaBtn");

  let offset = 0;
  let limit = getLimit();
  let total = 0;
  let expanded = false;

  function getLimit(defaultLimit = 12) {
    if (window.innerWidth < 500) return 6;
    if (window.innerWidth < 756) return 8;
    if (window.innerWidth < 1024) return 9;
    return defaultLimit;
  }

  async function loadAreas(offset = 0, limit = 12, append = false) {
    try {
      showLoading(container,"Services Area");
      const response = await fetch(`api/services-area-api.php?offset=${offset}&limit=${limit}`);
      if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
      const data = await response.json();
      if (!data.success) throw new Error(data.error || 'API returned unsuccessful response');
      total = data.pagination.total;
      if (!append) {
          container.innerHTML = ""
      }
      renderAreas(data.data);
      offset += data.data.length;

    } catch (error) {
      console.error("Erreur:", error);
      showError(container,"Failed to load Services Area. Please try again later.");
    }
  }

  function renderAreas(areas) {
    areas.forEach((item, index) => {
      const div = document.createElement("div");
      div.classList.add("services-area__item");
      div.style.opacity = '0';
      div.style.transform = 'translateY(20px)';
      div.innerHTML = `
        <i class="fa-solid fa-location-dot"></i>
        <h3>${item.name}</h3>
        ${item.description ? `<p>${item.description}</p>` : ''}
      `;
      container.appendChild(div);

      setTimeout(() => {
        div.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
        div.style.opacity = '1';
        div.style.transform = 'translateY(0)';
      }, 100 * index);
    });
  }
  function toggleServicesAreaView() {
    if (!expanded) {
        loadAreas(0,total || 100); // charge tout
        toggleBtn.textContent = "View Less";
        toggleBtn.setAttribute('aria-expanded', 'true');
    } else {
        loadAreas(0, getLimit());
        toggleBtn.textContent = "View More";
        toggleBtn.setAttribute('aria-expanded', 'false');
    }
    expanded = !expanded;
  }

  toggleBtn.addEventListener("click",toggleServicesAreaView);

  window.addEventListener('resize', () => {
    loadAreas(0, getLimit());
  });

  loadAreas(0,getLimit());
});
