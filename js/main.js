// main.js — shared behaviour for every page
document.addEventListener('DOMContentLoaded', () => {
    const header = document.querySelector('header');
    const burger = document.querySelector('.burger');
    const nav = document.querySelector('.nav-links');

    // Mobile navigation toggle
    if (burger && nav) {
        burger.addEventListener('click', () => {
            const open = nav.classList.toggle('nav-active');
            burger.classList.toggle('toggle', open);
            burger.setAttribute('aria-expanded', String(open));
        });
    }

    // Highlight the link of the current page
    const page = window.location.pathname.split('/').pop() || 'index.html';
    document.querySelectorAll('.nav-links a').forEach(link => {
        if (link.getAttribute('href') === page) {
            link.classList.add('active');
            link.setAttribute('aria-current', 'page');
        }
    });

    // Header shadow once the page is scrolled
    if (header) {
        const onScroll = () => header.classList.toggle('scrolled', window.scrollY > 8);
        onScroll();
        window.addEventListener('scroll', onScroll, { passive: true });
    }

    // Fade elements with class "reveal" in as they enter the viewport
    const revealItems = document.querySelectorAll('.reveal');
    if ('IntersectionObserver' in window) {
        const observer = new IntersectionObserver(entries => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('visible');
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.12 });
        revealItems.forEach(item => observer.observe(item));
    } else {
        revealItems.forEach(item => item.classList.add('visible'));
    }
});
