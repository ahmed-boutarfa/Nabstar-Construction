const container = document.getElementById("servicesContainer");
const toggleBtn = document.getElementById("toggleBtn");

let expanded = false;

function loadServices(offset = 0, limit = 6, append = false) {
    fetch(`includes/services-api.php?offset=${offset}&limit=${limit}`)
        .then(res => res.json())
        .then(data => {
            if (!append) container.innerHTML = "";
            data.forEach(service => {
                const card = document.createElement("div");
                card.className = "service__card";
                card.innerHTML = `
                    <div><i class="${service.icon}"></i></div>
                    <h3>${service.name}</h3>
                    <p>${service.description}</p>
                `;
                container.appendChild(card);
            });
        });
}

loadServices();

toggleBtn.addEventListener("click", () => {
    if (!expanded) {
        loadServices(0, 100);
        toggleBtn.textContent = "View Less";
    } else {
        loadServices(0, 6);
        toggleBtn.textContent = "View More";
    }
    expanded = !expanded;
});
