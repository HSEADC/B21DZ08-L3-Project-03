  document.addEventListener("turbo:load", () => {
    if (document.querySelector('.A_Dropdown') != null) {
      document.querySelector('.A_Dropdown').addEventListener('click', function() {
        document.querySelector(".W_navProfileMenu").classList.toggle('activated');
      });      
    }
    if (document.querySelector('.A_BurgerMenuButton') != null) {
      document.querySelector('.A_BurgerMenuButton').addEventListener('click', function() {
        document.querySelector(".A_BurgerMenuButton").classList.toggle('openDropdown');
        document.querySelector("nav").classList.toggle('open');
      });      
    }
    if (document.querySelectorAll('.U_RealRadioButton') != null) {
      document.querySelectorAll('.A_RadioButton').forEach(element => {
        element.addEventListener('click', function() {
          let test = element.parentElement.childNodes
          let clearedTest = []
          test.forEach(e => {
            if (e.classList != undefined) {              
              if (e.classList.contains('A_RadioButton')) {
                clearedTest.push(e)
              }
            }
          }) 
          clearedTest.forEach(e => {
            e.classList.remove('active')
          })
          element.classList.add('active')
        })
      });
  }
});
