-- Hackathon Judge: run once in Supabase → SQL Editor → New query → Run.
-- Safe to run again.

create table if not exists public.teams (
  id          text primary key,
  name        text not null,
  judge       text not null default '',
  scores      jsonb not null default '{}'::jsonb,
  notes       text not null default '',
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);

-- The site uses the public anon key, so anyone with the site link can read and edit scores.
alter table public.teams enable row level security;

drop policy if exists "teams read"   on public.teams;
drop policy if exists "teams insert" on public.teams;
drop policy if exists "teams update" on public.teams;
drop policy if exists "teams delete" on public.teams;
create policy "teams read"   on public.teams for select to anon, authenticated using (true);
create policy "teams insert" on public.teams for insert to anon, authenticated with check (true);
create policy "teams update" on public.teams for update to anon, authenticated using (true) with check (true);
create policy "teams delete" on public.teams for delete to anon, authenticated using (true);

-- Live updates: every judge's screen refreshes when anyone saves.
do $$
begin
  if not exists (
    select 1 from pg_publication_tables
    where pubname = 'supabase_realtime' and schemaname = 'public' and tablename = 'teams'
  ) then
    alter publication supabase_realtime add table public.teams;
  end if;
end $$;
