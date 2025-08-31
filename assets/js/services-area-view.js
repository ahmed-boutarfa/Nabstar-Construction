document.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById("servicesAreaContainer");
  const toggleBtn = document.getElementById("toggleAreaBtn");

  let expanded = false;

    function getLimit(defaultLimit = 12) {
    if (window.innerWidth < 756) {
      return 10;
    }
    return defaultLimit;
  }

  function loadServicesArea(offset = 0, limit = 12) {
    fetch(`includes/services-area-api.php?offset=${offset}&limit=${limit}`)
      .then(res => res.json())
      .then(data => {
        console.log("Services Area data:", data); // Debug
        container.innerHTML = ""; // clear old items

        if (data.length > 0) {
          data.forEach(item => {
            const div = document.createElement("div");
            div.classList.add("services-area__item");
            div.innerHTML = `
              <i class="fa-solid fa-location-dot"></i>
              <h3>${item.name}</h3>
            `;
            container.appendChild(div);
          });
        }
      })
      .catch(err => console.error("Error fetching services-area:", err));
  }

  // first load (6 only)
  loadServicesArea(0, getLimit());

  // on button click
  toggleBtn.addEventListener("click", () => {
    if (!expanded) {
      loadServicesArea(0, 100); // show all
      toggleBtn.textContent = "View Less";
    } else {
      loadServicesArea(0, getLimit()); // show first 6
      toggleBtn.textContent = "View More";
    }
    expanded = !expanded;
  });
});
