# UPDATES.md — changelog

Format and rules: see `AGENTS.md` §2.3–2.4. Newest entry on top.
Entries above the first `(merged into main)` marker are pending on branch `a`.

## [2026-11-01 21:42]
1. Committed the pre-existing uncommitted work (research.html, cv.html, css/, js/, assets/, images/, edited index.html) as a baseline on new branch `a` — Impact: the starting point is saved, so every later change can be diffed or reverted individually.
2. Rewrote `css/styles.css` keeping the theme (dark-teal header/footer, monospace headings, green-teal links), removing wedding-template leftovers (RSVP, countdown, details, timeline styles) and moving page-specific inline styles into it — Impact: consistent look on every page; one place to tune colours and fonts.
3. Headings and navigation now use IBM Plex Mono (Google Fonts), falling back to the previous monospace stack; removed unused Playfair Display / Montserrat fonts — Impact: monospace style looks the same on every OS; faster page load.
4. Navigation: animated underline on hover, current page highlighted, header gains a shadow when scrolling, working burger menu on mobile (dark-teal dropdown) — Impact: easier to see where you are; the menu is usable on phones (before, mobile links were white on white).
5. Rewrote `js/main.js` (removed the wedding countdown that threw errors on every page; added menu, active-link, scroll shadow and fade-in logic) — Impact: no JavaScript errors; subtle fade-in of sections while scrolling (disabled for users who prefer reduced motion).
6. Home page redesign: round profile photo beside name, role, affiliations and quick-link buttons (CV, Research, INSPIRE, Email); bio text kept unchanged but split into paragraphs at a more readable size — Impact: more professional first impression; key information visible without scrolling.
7. Added a "News" timeline on the home page (upcoming CERN workshop talk, CPHT seminar, EMMI/BNL/Hard Probes talks, new PRL paper, LHCP Best Poster Award) — Impact: visitors see recent activity at a glance. Needs manual updates over time.
8. Research page completed from the CV's research areas: 4 topics (In-medium QCD splittings, Parton showers, Jet quenching phenomenology, Computational methods) with text, keyword tags and inline SVG schematic figures replacing the placeholders, plus a Publications card linking to arXiv and INSPIRE — Impact: no more placeholder text; page is visually complete.
9. CV page fully filled from `main(3).tex`: Education, Research Experience, Publications, Talks and Posters, Honors, Short Visits and Doctoral Schools, Teaching, Mentoring; "invited" / "best poster" badges; hover highlight on entries — Impact: the web CV matches the PDF CV. Phone number and private "in preparation" papers intentionally left out.
10. "Download PDF" button on the CV page commented out until `assets/cv.pdf` exists — Impact: no broken link on the live site.
11. New `contact.html` (email, current affiliation, home institutions, INSPIRE/ORCID) — Impact: the "Contact" menu link no longer leads to a 404.
12. Footer on every page filled with real email (mleitao@lip.pt), INSPIRE and ORCID links; LinkedIn and CiênciaVitae commented out until URLs are provided; added copyright line — Impact: no placeholder text like "[your-email]" on the site.
13. Added `PROJECT.md` (structure), `UPDATES.md` (this log), `AGENTS.md` (rules for AI agents) and `CLAUDE.md` (makes Claude Code load AGENTS.md) — Impact: any AI agent gets the project context and follows the branch/merge/logging rules.
14. Added `preview.sh` to serve any branch locally (default `a`) without touching the current checkout — Impact: run `./preview.sh` to see branch `a` in the browser before merging.
