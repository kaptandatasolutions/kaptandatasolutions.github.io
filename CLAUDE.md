# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Ce dépôt est un site web Jekyll statique pour **Kaptan Data Solutions (KDS)**, une entreprise spécialisée dans les solutions data pour la physique médicale. Le site utilise le thème Beautiful Jekyll et sert de blog/portfolio publiant des articles techniques sur la radiothérapie, l'IA, l'automatisation et la data science.

**URL de production**: https://kaptandatasolutions.github.io
**Portfolio démo**: https://kaptan-data-solutions.app/

## Commands de développement

### Développement local

**Windows**:
```bash
serve-site.bat
```

**Unix/Linux/Mac**:
```bash
make serve
```

Ces commandes :
1. Installent automatiquement les dépendances Ruby (`bundle install`)
2. Lancent Jekyll avec livereload sur http://localhost:4000
3. Rechargent automatiquement le navigateur lors des modifications

### Autres commandes utiles

```bash
# Installation/mise à jour des dépendances uniquement
bundle install

# Build du site (génère _site/)
bundle exec jekyll build

# Clean des fichiers générés
make clean  # Unix
# ou supprimer manuellement _site/ et .jekyll-cache/
```

## Architecture du site

### Structure Jekyll

- **`_config.yml`**: Configuration principale (thème, navigation, réseaux sociaux, analytics, multilingue)
- **`_posts/`**: Articles de blog au format `YYYY-MM-DD-titre.md`
- **`_layouts/`**: Templates HTML (base, default, home, page, post, minimal)
- **`_includes/`**: Composants réutilisables (header, footer, comments, analytics, cookie-consent)
- **`_data/`**: Données structurées (traductions UI dans `ui-text.yml`)
- **`assets/`**: Fichiers statiques (CSS, JS, images)
- **`_site/`**: Site généré (ignoré par Git, généré par Jekyll)

### Configuration clés

**Timezone**: `Europe/Paris`
**Pagination**: 5 articles par page
**Multilangue**: Plugin `jekyll-polyglot` activé (créer `page.fr.md` pour traductions)
**Analytics**: Google Tag Manager configuré (`gtag: "G-MX5ZJFPTBX"`)
**Comments**: CommentBox activé (`commentbox: "5721091683123200-proj"`)

### Navigation et pages

Navigation définie dans `_config.yml` sous `navbar-links`:
- About Us → `about_us.md`
- Contact → `contact.md`
- Submit Project → `submit-project.md`
- Streamlit Demo → lien externe vers le portfolio

Pages racine importantes:
- `index.html`: Page d'accueil avec liste des articles paginée
- `tags.html`: Page d'index des tags
- `404.html`: Page d'erreur personnalisée

### Système de posts

Format des fichiers posts: `YYYY-MM-DD-HH-MM-titre.md`

Front matter typique:
```yaml
---
layout: post
title: Titre de l'article
subtitle: Sous-titre optionnel
cover-img: /assets/img/cover.png
thumbnail-img: /assets/img/thumb.png
share-img: /assets/img/share.png
tags: [Tag1, Tag2, Tag3]
author: Kayhan Kaptan - Medical Physics, Quality Control, Data Science and Automation
---
```

**Catégories de posts principales**:
- `KAP-TEN-LAST-TECH-NEWS`: Actualités tech hebdomadaires
- Articles techniques sur la radiothérapie (MLC, Winston-Lutz, CBCT, etc.)
- Tutoriels IA/automatisation (n8n, agents AI, RAG, etc.)
- Articles sur la physique médicale

### Thème et styling

- Thème base: Beautiful Jekyll
- Couleurs personnalisées dans `_config.yml` (palette violet/rose: `#966dd5`, `#cd23dc`, `#f549f4`)
- CSS custom: `assets/css/custom.css` (référencé via `extracss` dans config)
- Avatar: `/assets/img/avatar-icon1.png` (rond par défaut)

### Déploiement

Le site se déploie automatiquement sur GitHub Pages via `.github/workflows/ci.yml`:
- Trigger: push sur `main` ou workflow_dispatch
- Build: Ubuntu avec Ruby 3.3
- Commande: `bundle exec jekyll build --future --config _config_ci.yml,_config.yml`
- Le flag `--future` permet de publier les posts avec date future

## Bonnes pratiques pour les modifications

### Ajouter un nouvel article

1. Créer un fichier dans `_posts/` avec le format: `YYYY-MM-DD-HH-MM-titre-en-kebab-case.md`
2. Ajouter le front matter complet (layout, title, images, tags, author)
3. Placer les images dans `assets/img/`
4. Utiliser des tags pertinents pour la découvrabilité
5. Tester localement avant de commit

### Modifier la navigation

Éditer la section `navbar-links` dans `_config.yml`. Les liens peuvent être:
- Simples: `"Label": "page-slug"`
- Sous-menus: `"Label":\n  - Sub1: "url"\n  - Sub2: "url"`

### Ajouter une nouvelle page

1. Créer `nom-page.md` à la racine
2. Ajouter front matter minimal:
```yaml
---
layout: page
title: Titre
subtitle: Sous-titre optionnel
---
```
3. Ajouter le lien dans `navbar-links` si nécessaire

### Support multilingue

Pour traduire une page:
1. Créer `page-name.fr.md` à côté de `page-name.md`
2. Le plugin `jekyll-polyglot` gère automatiquement le routing
3. Les traductions UI sont dans `_data/ui-text.yml`

### Modifications CSS/JS

- CSS custom: ajouter dans `assets/css/custom.css`
- JS custom: créer dans `assets/js/` et référencer via `site-js` dans `_config.yml`

## Notes importantes

- **Ne jamais commiter `_site/` ou `.jekyll-cache/`**: exclus via `.gitignore`
- **Images**: privilégier des formats optimisés (WebP si possible) dans `assets/img/`
- **SEO**: les images `share-img` sont utilisées pour Open Graph (réseaux sociaux)
- **Commentaires**: système CommentBox intégré, nécessite la clé projet dans `_config.yml`
- **Analytics**: Google Tag Manager activé, éviter de modifier le tag ID sans coordination
- **Ruby version**: le workflow CI utilise Ruby 3.3, assurer la compatibilité locale

## Structure des articles techniques

Les articles KDS suivent généralement cette structure:
1. Image de couverture avec lien YouTube
2. Introduction contextuelle
3. Sections techniques avec sous-titres
4. Exemples pratiques ou démonstrations
5. Conclusion avec CTA vers solutions/portfolio
6. Tags précis pour classification (Medical Physics, AI, Automation, etc.)

## Ressources externes

- [Beautiful Jekyll Documentation](https://beautifuljekyll.com/)
- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [Jekyll Polyglot Plugin](https://github.com/untra/polyglot)
