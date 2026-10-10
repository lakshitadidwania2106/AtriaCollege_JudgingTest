# Hackathon Judge

A single-page scoring app for hackathon judges.

- Add teams and assign a judge to each
- Score 7 criteria (total out of 100): UI + Responsive (10), Working (25), Code Base Explanation (15), Teamwork (10), Unique Features (20), GitHub + Deployment (10), Presentation (10)
- Live leaderboard with tie-breaks (Working, then Unique Features), per-judge filter and category leaders
- Top by judge: each judge's top 3 teams at a glance (tap a judge to see all of their teams)
- 6-minute presentation timer with warning beeps and an alarm at 0:00
- Export CSV, backup and restore

Scores are shared through Supabase, so every judge sees the same teams and leaderboard, updating live.
Each device also keeps a local copy. If the internet drops, marks are saved on the device and upload automatically once it reconnects. The badge in the header shows the status (Live / Saving… / Offline).

## Database setup (one time)

1. Open the Supabase project → **SQL Editor** → **New query**
2. Paste the contents of [`supabase/schema.sql`](supabase/schema.sql) and click **Run**

Note: the site uses the public anon key, so anyone with the site link can view and edit scores. Only share the link with judges.

## Deploy

It's one static file, `index.html`, with no build step. Works on GitHub Pages, Netlify or Vercel as is.
