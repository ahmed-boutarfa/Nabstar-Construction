document.addEventListener('DOMContentLoaded', function() {
    const textCircle = document.querySelector('.circle-text-circle');
    const text = "GET IN TOUCH • GET IN TOUCH";
    const characters = text.split('');
    const totalChars = characters.length;

    textCircle.innerHTML = '';

    characters.forEach((char, index) => {
        const span = document.createElement('span');
        span.textContent = char;
        // Set custom properties for each span
        span.style.setProperty('--i', index + 1);
        span.style.setProperty('--total-chars', totalChars);
        textCircle.appendChild(span);
    });
});