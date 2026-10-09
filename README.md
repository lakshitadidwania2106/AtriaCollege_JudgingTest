# Hackathon Judge

A single-page scoring app for hackathon judges.

- Add teams and assign a judge to each
- Score 7 criteria (total out of 100): UI + Responsive (10), Working (25), Code Base Explanation (15), Teamwork (10), Unique Features (20), GitHub + Deployment (10), Presentation (10)
- Live leaderboard with tie-breaks (Working, then Unique Features), per-judge filter and category leaders
- 6-minute presentation timer with warning beeps and an alarm at 0:00
- Export CSV, backup and restore

Data is stored in the browser (localStorage) on the device you use.

## Deploy

It's one static file, `index.html`, with no build step. Works on GitHub Pages, Netlify or Vercel as is.
