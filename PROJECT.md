# PROJECT.md — structure of the website

Personal academic website of Marco Leitão, served by **GitHub Pages** from the
`main` branch of `marcoacl00.github.io`. It is a plain static site: hand-written
HTML + one CSS file + one small JS file. There is no build step, framework or package manager.

## File layout

```
.
├── index.html        Home / "About me": hero (photo, name, affiliations, quick links), bio, News timeline
├── research.html     Research interests: 4 topics (SVG figure + text + tags) and a publications card
├── cv.html           Full CV rendered from main(3).tex (education, research, publications, talks,
│                     posters, honors, visits/schools, teaching, mentoring)
├── contact.html      Email, affiliations and profile links (cards)
├── css/styles.css    The single stylesheet for all pages (see "Styling" below)
├── js/main.js        Shared behaviour: mobile burger menu, active-nav highlight,
│                     header shadow on scroll, fade-in of `.reveal` elements
├── assets/           Photo (1691430333522.jpg); put the CV PDF here as assets/cv.pdf
├── images/           Leftover images from an older template (currently unused)
├── main(3).tex       LaTeX source of the CV: the source of truth for cv.html content
│                     (kept untracked: it contains a phone number)
├── preview.sh        Local preview of any branch (default "a"): ./preview.sh [branch] [port]
├── AGENTS.md         Rules for AI agents working on this repo
├── CLAUDE.md         Points Claude Code to AGENTS.md
├── PROJECT.md        This file
├── UPDATES.md        Changelog in the format required by AGENTS.md
└── README.md
```

## Page anatomy

Every page repeats the same skeleton (there is no templating, so **shared parts
must be edited in all four HTML files**):

1. `<head>`: inline `js` class script (enables reveal animations only when JS runs),
   IBM Plex Mono from Google Fonts, Font Awesome 5.15.4 (CDN), `css/styles.css`, `js/main.js` (deferred).
2. `<header><nav>`: logo link, `.burger` button (mobile), `.nav-links` list.
   The active link is set automatically by `main.js` by matching the file name.
3. `<main>`: page content, inside `.container` (`.narrow` for text pages).
4. `<footer class="site-footer">`: email, INSPIRE and ORCID links. LinkedIn and
   CiênciaVitae entries are commented out until real URLs are available.

## Styling (`css/styles.css`)

- Theme variables live in `:root`: `--brand` (dark teal `#193b49`, header/footer),
  `--accent-color` (light blue), `--links-color` (green-teal `#056353`), fonts
  (`--font-title` monospace for headings/nav, `--font-body` Arial for text).
- The file is split into numbered sections: variables, base, header/nav, shared
  components (`.section-title`, `.btn`, `.badge`, `.card`), home, research, CV,
  contact, footer/animations/responsive.
- Breakpoints: `820px` (hero and research topics stack), `700px` (burger menu,
  CV dates above entries).
- Add `class="reveal"` to any block to fade it in on scroll.

## Content conventions

- **CV**: each item is a `.cv-entry` with `.cv-entry-date` and `.cv-entry-body`
  (`.cv-entry-title`, optional `.cv-entry-sub`, `.cv-entry-detail`, `.cv-sublist`).
  Invited talks use `<span class="badge">invited</span>`; awards `badge gold`.
  Keep cv.html in sync with `main(3).tex`; commented-out/private parts of the
  .tex (e.g. papers in preparation) and the phone number are intentionally not published.
- **Research**: each topic is a `<section class="research-topic">`; figures
  alternate sides automatically. Figures are inline SVG schematics; replace with
  `<img src="images/...">` for real plots.
- **News** (index.html): newest first; date in `.news-date`.
- The "Download PDF" button in cv.html is commented out until `assets/cv.pdf` exists.

## Workflow

AI agents work on branch `a` and follow `AGENTS.md`; changes are logged in
`UPDATES.md`. Preview branch `a` locally with `./preview.sh`. `main` is what
GitHub Pages publishes after a push.
