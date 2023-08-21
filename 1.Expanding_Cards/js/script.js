const panels = document.querySelectorAll('.panel');
var selectedPanel = panels[0];
selectedPanel.classList.add('active');

panels.forEach(panel => {
    panel.addEventListener('mouseover', () => {
        selectedPanel.classList.remove('active');
        selectedPanel = panel;
        selectedPanel.classList.add('active');
    });
});