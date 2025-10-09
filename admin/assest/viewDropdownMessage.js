document.addEventListener("DOMContentLoaded", () => {
  const container = document.getElementById("dropdownMenuMessage");
  const badge = document.getElementById("messageCount");

  async function renderDropdownMessage() {
    try {
      container.innerHTML = `<div class="text-center text-muted small">Loading...</div>`;
      const res = await fetch("../admin/navbar.php");

      if (!res.ok) throw new Error(`HTTP error! status: ${res.status}`);
      const data = await res.json();

      // Mettre à jour le badge
      badge.textContent = data.NumberMessage || 0;
      console.log(badge);  
      // Si aucun message
      if (!data.data || data.data.length === 0) {
        container.innerHTML = `
          <div class="text-center text-muted small py-3">No messages yet</div>
        `;
        return;
      }

      // Construire la liste
      container.innerHTML = data.data
        .map(contact => `
          <a href="#" class="dropdown-item border-bottom small">
            <div class="d-flex">
            <div class="fw-bold">${contact.name}</div>
            <div class="text-truncate">${contact.message}</div>
            <div class="text-muted small">${new Date(contact.created_at).toLocaleString()}</div>
            </div>
          </a>
        `)
        .join("");

      // Bouton voir plus
      container.innerHTML += `
        <div class="dropdown-divider"></div>
        <a href="messages.php" class="dropdown-item dropdown-footer text-center fw-bold">View all messages</a>
      `;
    } catch (err) {
      console.error(err);
      container.innerHTML = `
        <div class="text-danger small text-center py-3">Error loading messages</div>
      `;
    }
  }

  // Charger au démarrage
  renderDropdownMessage();

  // Actualiser toutes les 30 secondes
  setInterval(renderDropdownMessage, 30000);
});
