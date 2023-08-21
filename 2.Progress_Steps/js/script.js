const progress = document.getElementById('progress');
const prev = document.getElementById('prev');
const next = document.getElementById('next');
const circles = document.querySelectorAll('.circle');

let currentActive = 1;

next.addEventListener('click', () => {
    update(++currentActive);
});

prev.addEventListener('click', () => {
    update(--currentActive);
});

function update(position) {
    if (position > circles.length) {
        position = circles.length;
    }
    else if (position < 1) {
        position = 1;
    }

    circles.forEach((circle, index) => {
        if (index < position) {
            circle.classList.add('active');
        }
        else {
            circle.classList.remove('active');
        }
    });

    const actives = document.querySelectorAll('.active');

    progress.style.width = (actives.length - 1) / (circles.length - 1) * 100 + '%';

    if (position === 1) {
        prev.disabled = true;
    }
    else if (position === circles.length) {
        next.disabled = true;
    }
    else {
        prev.disabled = false;
        next.disabled = false;
    }
}