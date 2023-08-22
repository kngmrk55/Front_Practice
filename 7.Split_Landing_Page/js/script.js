const left_hover = document.querySelector('.left');
const right_hover = document.querySelector('.right');
const container = document.querySelector('.container');

left_hover.addEventListener('mouseover',()=>{
    container.classList.add('hover-left');
});

right_hover.addEventListener('mouseover',()=>{
    container.classList.add('hover-right');
});

left_hover.addEventListener('mouseleave',()=>{
    container.classList.remove('hover-left');
});

right_hover.addEventListener('mouseleave',()=>{
    container.classList.remove('hover-right');
});