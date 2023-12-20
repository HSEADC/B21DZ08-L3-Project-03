  document.addEventListener("turbo:load", () => {
    document.querySelector('.A_NavProfileMenuToggler').addEventListener('click', function() {
      console.log('test')
      document.querySelector(".W_navProfileMenu").classList.toggle('activated');
    });
  });
