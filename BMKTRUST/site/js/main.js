document.addEventListener('DOMContentLoaded', () => {
    initLoader();
    initNavbar();
    initMobileMenu();
    initScrollAnimations();
    initHeroAnimations();
    initParticles();
    initScrollTop();
    initCounterAnimation();
    initSmoothScroll();
    initFaq();
    initGalleryLightbox();
});

function initLoader() {
    window.addEventListener('load', () => {
        setTimeout(() => {
            document.body.classList.add('loaded');
            triggerHeroAnimations();
        }, 800);
    });
}

function initNavbar() {
    const navbar = document.getElementById('navbar');
    const navLinks = document.querySelectorAll('.nav-link');

    window.addEventListener('scroll', () => {
        navbar.classList.toggle('scrolled', window.scrollY > 50);
    });

    const sections = document.querySelectorAll('section[id]');
    window.addEventListener('scroll', () => {
        const scrollPos = window.scrollY + 100;
        sections.forEach(section => {
            const top = section.offsetTop;
            const height = section.offsetHeight;
            const id = section.getAttribute('id');
            if (scrollPos >= top && scrollPos < top + height) {
                navLinks.forEach(link => {
                    link.classList.toggle('active', link.getAttribute('href') === `#${id}`);
                });
            }
        });
    });
}

function initMobileMenu() {
    const toggle = document.getElementById('navToggle');
    const menu = document.getElementById('navMenu');
    const links = menu.querySelectorAll('.nav-link');

    toggle.addEventListener('click', () => {
        toggle.classList.toggle('active');
        menu.classList.toggle('open');
        document.body.style.overflow = menu.classList.contains('open') ? 'hidden' : '';
    });

    links.forEach(link => {
        link.addEventListener('click', () => {
            toggle.classList.remove('active');
            menu.classList.remove('open');
            document.body.style.overflow = '';
        });
    });
}

function initScrollAnimations() {
    const elements = document.querySelectorAll('.animate-on-scroll');
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const delay = entry.target.dataset.delay || 0;
                setTimeout(() => {
                    entry.target.classList.add('visible');
                }, parseInt(delay));
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.15, rootMargin: '0px 0px -40px 0px' });

    elements.forEach(el => observer.observe(el));
}

function initHeroAnimations() {
    // Triggered after loader via triggerHeroAnimations()
}

function triggerHeroAnimations() {
    document.querySelectorAll('.animate-fade-up, .animate-scale-in').forEach(el => {
        const delay = parseInt(el.dataset.delay || 0);
        setTimeout(() => el.classList.add('visible'), delay);
    });
}

function initParticles() {
    const container = document.getElementById('particles');
    if (!container) return;

    for (let i = 0; i < 30; i++) {
        const particle = document.createElement('div');
        particle.classList.add('particle');
        particle.style.left = `${Math.random() * 100}%`;
        particle.style.animationDuration = `${8 + Math.random() * 12}s`;
        particle.style.animationDelay = `${Math.random() * 10}s`;
        particle.style.width = `${2 + Math.random() * 4}px`;
        particle.style.height = particle.style.width;
        container.appendChild(particle);
    }
}

function initScrollTop() {
    const btn = document.getElementById('scrollTop');
    window.addEventListener('scroll', () => {
        btn.classList.toggle('visible', window.scrollY > 500);
    });
    btn.addEventListener('click', () => {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
}

function initCounterAnimation() {
    const statNumbers = document.querySelectorAll('.stat-number');
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                animateCounter(entry.target);
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.5 });

    statNumbers.forEach(el => observer.observe(el));
}

function animateCounter(el) {
    const text = el.textContent.trim();
    const target = parseInt(el.dataset.target);
    if (!target || isNaN(target)) return;

    const suffix = text.replace(/[0-9,]/g, '');
    const duration = 2000;
    const start = performance.now();

    function update(now) {
        const elapsed = now - start;
        const progress = Math.min(elapsed / duration, 1);
        const eased = 1 - Math.pow(1 - progress, 3);
        const current = Math.floor(eased * target);
        el.textContent = current.toLocaleString('en-IN') + suffix;
        if (progress < 1) requestAnimationFrame(update);
    }

    requestAnimationFrame(update);
}

function initSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', (e) => {
            const target = document.querySelector(anchor.getAttribute('href'));
            if (!target) return;
            e.preventDefault();
            const offset = 80;
            const top = target.getBoundingClientRect().top + window.scrollY - offset;
            window.scrollTo({ top, behavior: 'smooth' });
        });
    });
}

function initFaq() {
    const list = document.getElementById('faqList');
    if (!list) return;

    list.querySelectorAll('.faq-question').forEach(btn => {
        btn.addEventListener('click', () => {
            const item = btn.closest('.faq-item');
            const isOpen = item.classList.contains('open');

            list.querySelectorAll('.faq-item.open').forEach(openItem => {
                openItem.classList.remove('open');
                openItem.querySelector('.faq-question').setAttribute('aria-expanded', 'false');
            });

            if (!isOpen) {
                item.classList.add('open');
                btn.setAttribute('aria-expanded', 'true');
            }
        });
    });
}

function initGalleryLightbox() {
    const lightbox = document.getElementById('galleryLightbox');
    if (!lightbox) return;

    const imgEl = document.getElementById('lightboxImage');
    const captionEl = document.getElementById('lightboxCaption');
    const closeBtn = document.getElementById('lightboxClose');
    const prevBtn = document.getElementById('lightboxPrev');
    const nextBtn = document.getElementById('lightboxNext');
    const cards = Array.from(document.querySelectorAll('.gallery-card'));

    if (!cards.length) return;

    const items = cards.map(card => ({
        src: card.dataset.src,
        title: card.dataset.title || '',
    }));

    let currentIndex = 0;

    function show(index) {
        currentIndex = (index + items.length) % items.length;
        const item = items[currentIndex];
        imgEl.src = item.src;
        imgEl.alt = item.title;
        captionEl.textContent = item.title;
        lightbox.classList.add('open');
        lightbox.setAttribute('aria-hidden', 'false');
        document.body.style.overflow = 'hidden';
    }

    function close() {
        lightbox.classList.remove('open');
        lightbox.setAttribute('aria-hidden', 'true');
        document.body.style.overflow = '';
        imgEl.src = '';
    }

    cards.forEach((card, index) => {
        card.addEventListener('click', () => show(index));
    });

    closeBtn?.addEventListener('click', close);
    lightbox.querySelector('[data-close-lightbox]')?.addEventListener('click', close);
    prevBtn?.addEventListener('click', () => show(currentIndex - 1));
    nextBtn?.addEventListener('click', () => show(currentIndex + 1));

    document.addEventListener('keydown', (e) => {
        if (!lightbox.classList.contains('open')) return;
        if (e.key === 'Escape') close();
        if (e.key === 'ArrowLeft') show(currentIndex - 1);
        if (e.key === 'ArrowRight') show(currentIndex + 1);
    });
}

// Parallax effect on hero showcase
window.addEventListener('scroll', () => {
    const showcase = document.querySelector('.showcase-frame-inner');
    const hero = document.querySelector('.hero');
    if (!showcase || !hero) return;

    const heroBottom = hero.offsetTop + hero.offsetHeight;
    if (window.scrollY < heroBottom) {
        const scrolled = window.scrollY * 0.12;
        showcase.style.transform = `translateY(${-14 + scrolled * 0.25}px)`;
    }
});

// Mission card tilt effect
document.querySelectorAll('.mission-card').forEach(card => {
    card.addEventListener('mousemove', (e) => {
        const rect = card.getBoundingClientRect();
        const x = (e.clientX - rect.left) / rect.width - 0.5;
        const y = (e.clientY - rect.top) / rect.height - 0.5;
        card.querySelector('.mission-card-inner').style.transform =
            `translateY(-8px) rotateX(${y * -5}deg) rotateY(${x * 5}deg)`;
    });

    card.addEventListener('mouseleave', () => {
        card.querySelector('.mission-card-inner').style.transform = '';
    });
});

// Program card ripple on click
document.querySelectorAll('.program-card').forEach(card => {
    card.addEventListener('click', (e) => {
        const ripple = document.createElement('span');
        const rect = card.getBoundingClientRect();
        const size = Math.max(rect.width, rect.height);
        ripple.style.cssText = `
            position: absolute;
            width: ${size}px;
            height: ${size}px;
            left: ${e.clientX - rect.left - size / 2}px;
            top: ${e.clientY - rect.top - size / 2}px;
            background: rgba(201, 162, 39, 0.15);
            border-radius: 50%;
            transform: scale(0);
            animation: ripple 0.6s ease-out;
            pointer-events: none;
        `;
        card.appendChild(ripple);
        setTimeout(() => ripple.remove(), 600);
    });
});

const rippleStyle = document.createElement('style');
rippleStyle.textContent = `
    @keyframes ripple {
        to { transform: scale(2); opacity: 0; }
    }
`;
document.head.appendChild(rippleStyle);
