(function() {
  window.I18N_DICT = {
    en: {
      "about-us": "About Us",
      "contact": "Contact",
      "login": "Login",
      "logout": "Logout",
      "search": "Search",
      "newer-posts": "Newer Posts",
      "older-posts": "Older Posts"
    },
    fr: {
      "about-us": "À propos",
      "contact": "Contact",
      "login": "Connexion",
      "logout": "Déconnexion",
      "search": "Recherche",
      "newer-posts": "Articles récents",
      "older-posts": "Articles plus anciens"
    }
  };

  window.applyTranslations = function(lang) {
    var dict = I18N_DICT[lang] || I18N_DICT.en;
    document.querySelectorAll('[data-i18n]').forEach(function(el) {
      var key = el.getAttribute('data-i18n');
      var text = dict[key];
      if (text) {
        if ('placeholder' in el) {
          el.placeholder = text;
        }
        if (el.textContent !== undefined && !el.children.length) {
          el.textContent = text;
        }
      }
    });
    document.documentElement.lang = lang;
  };
})();
