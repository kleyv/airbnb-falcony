const initUpdateNavbarOnScroll = () => {
  const navbar = document.querySelector('.navbar-lewagon');
  if (navbar) {
    window.addEventListener('scroll', () => {
      if (window.scrollY >= 80) {
        navbar.classList.add('navbar-lewagon-scroll');
      } else {
        navbar.classList.remove('navbar-lewagon-scroll');
      }
    });
  }
}

export { initUpdateNavbarOnScroll };
