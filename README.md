# Independent Impact Website

This repository contains the Hugo project for the Independent Impact website. It uses Tailwind CSS to generate the final stylesheets before running the Hugo build.

## Prerequisites

Ensure the following tools are installed locally:

- [Node.js](https://nodejs.org/) (version 18 or later recommended)
- [npm](https://www.npmjs.com/) (bundled with Node.js)
- [Hugo Extended](https://gohugo.io/getting-started/installing/) (v0.111 or later)

## Install dependencies

```bash
npm install
```

## Local development

Run the Tailwind compiler and Hugo development server together:

```bash
npm start
```

The site will be served with live reload at the address shown in the terminal (typically `http://localhost:1313`).

## Production build

Generate the optimised CSS bundle and static site output:

```bash
npm run build
```

The compiled site is written to the `public/` directory.

## Additional resources

- `content/` – Markdown content for each page.
- `assets/css/main.css` – Tailwind entrypoint that is compiled into `static/css/style.css`.
- `themes/` – Hugo theme files.

## Color system

The site palette is defined through CSS variables and Tailwind aliases in `assets/css/main.css` and `tailwind.config.js`, following the [Independent Impact colour specification](References/independent-impact-color-spec.md). Update those token files when adjusting colours so that components continue to consume the shared design system.
