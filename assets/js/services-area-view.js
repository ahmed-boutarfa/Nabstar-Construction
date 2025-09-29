document.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById("servicesAreaContainer");
  const toggleBtn = document.getElementById("toggleAreaBtn");
  const loadingIndicator = document.getElementById("loadingIndicator");
  const errorMessage = document.getElementById("errorMessage");

  let offset = 0;
  let limit = getLimit();
  let total = 0;
  let isLoading = false;

  function getLimit(defaultLimit = 12) {
    if (window.innerWidth < 480) return 6;
    if (window.innerWidth < 756) return 8;
    if (window.innerWidth < 1024) return 10;
    return defaultLimit;
  }

  function showLoading() {
    isLoading = true;
    if (loadingIndicator) loadingIndicator.style.display = 'block';
    if (errorMessage) errorMessage.style.display = 'none';
    toggleBtn.disabled = true;
  }

  function hideLoading() {
    isLoading = false;
    if (loadingIndicator) loadingIndicator.style.display = 'none';
    toggleBtn.disabled = false;
  }

  function showError(message) {
    hideLoading();
    if (errorMessage) {
      errorMessage.textContent = message || 'Failed to load areas. Please try again.';
      errorMessage.style.display = 'block';
    }
    console.error("Error fetching services-area:", message);
  }

  async function fetchAreas(offset = 0, limit = 12) {
    try {
      const response = await fetch(`api/services-area-api.php?offset=${offset}&limit=${limit}`);
      if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
      const data = await response.json();
      if (!data.success) throw new Error(data.error || 'API returned unsuccessful response');
      total = data.pagination.total;
      return data.data || [];
    } catch (error) {
      showError(error.message);
      return [];
    }
  }

  async function loadAreas() {
    if (isLoading) return;
    showLoading();

    try {
      const areasData = await fetchAreas(offset, limit);
      renderAreas(areasData);
      offset += areasData.length;

      // Cacher le bouton si tout est chargé
      if (offset >= total) {
        toggleBtn.style.display = 'none';
      } else {
        toggleBtn.style.display = 'block';
      }

    } finally {
      hideLoading();
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

  toggleBtn.addEventListener("click", () => {
    loadAreas();
  });

  window.addEventListener('resize', () => {
    limit = getLimit();
  });

  loadAreas();
});
