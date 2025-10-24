# Independent Impact Website

This repository contains the Hugo project for the Independent Impact website. It uses Tailwind CSS to generate the final stylesheets before running the Hugo build.

## Prerequisites

Ensure the following tools are installed locally:

- [Node.js](https://nodejs.org/) (version 18 or later recommended)
- [npm](https://www.npmjs.com/) (bundled with Node.js)
- [Hugo Extended](https://gohugo.io/getting-started/installing/) (v0.111 or later)

## Scripted setup

Two helper scripts live in the repo root:

- `setup-scripts/ubuntu_setup.sh` – bootstraps Node.js 18 LTS and Hugo Extended on a fresh Ubuntu machine (run with sudo).
- `update-independentimpact-local.sh` – keeps a local checkout on macOS/Linux in sync, rebuilds assets, and serves the site.

### update-independentimpact-local.sh

Run the script from the repository root:

```bash
./update-independentimpact-local.sh
```

The script will:

1. Fetch the latest Git changes (default branch `main`).
2. Install/refresh npm dependencies (`npm install --no-audit --no-fund`).
3. Rebuild Tailwind CSS into `static/css/style.css`.
4. Run `hugo` to regenerate the site into `public/`.
5. Start `hugo server` on `http://127.0.0.1:1313` with live reload disabled.

Environment variables you can override:

- `ALLOW_DIRTY=true` – skip the clean working-tree check.
- `RUN_SERVER=false` – skip launching `hugo server` after the build.
- `RUN_MINIFY=true` – pass `--minify` to Tailwind and Hugo.
- `BRANCH=feature/my-branch` – have the script ensure it is on a different branch.
- `SERVER_PORT` / `HTTP_SERVER_BIND` – control the dev-server bind address.

Stop the dev server with `Ctrl+C`.

## Install dependencies manually

If you prefer not to use the helper script, install packages yourself:

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
