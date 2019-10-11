# Scheduling tool for Gaspard de Coligny school

This is a tool used for a school's parental board organising some events during the year, and trying to get volunteers to help during that event. The tool was orginally written by Yvan Cottyn, and later maintained by Vincent Mouton.

The current version of the tool is a caveman-migration from the original tool: just rewriting some code untill the entire thing worked again.

There's still a lot of work left to get this properly rewritten.


## How it works
* Define basic event settings (its name, the date, ...) using the `/settings` route (that route is currently behind a username/password combo which is hard-coded)
* Define `postjes` which is the actual job (the bar, the kitchen, cleaning, ...)


## Need to fix
* ~Get the entire application working again (some things like config, destroy and purge everything don't work)~
* ~Maybe we need to add it to the overview for visual reference~
* ~Search & filter applications and volunteers~
* ~Allow editing Volunteers, they sometimes make mistakes~
* ~Remove the hard coded authentication on the back-end (yes, this repo contains a password, lol, but it's not mine)~
* ~Maybe check the SIGTERM issue, caused by [dyno sleeping](https://devcenter.heroku.com/articles/free-dyno-hours), maybe use the `at_exit` [see here](https://github.com/honeybadger-io/honeybadger-ruby/issues/267#issuecomment-373906051) and [here](https://devcenter.heroku.com/articles/what-happens-to-ruby-apps-when-they-are-restarted)~
* Get that [PROCFILE fixed and use puma](https://devcenter.heroku.com/articles/getting-started-with-rails4#procfile)?
* ~Give the back-end some _bootstrap love_~
* ~Rename some models to English (from dutch): postjes, for example; also some params like klas, leerling, ...~
* ~Remove redundant pieces of code, including all old assets (css, js, ...)~
* Some UX changes are needed too (the schedule is still bare bones and maybe not so easy to use)
* Sort volunteers/applications by last added, descending
* Also allow some mass editing of volunteers
* Add a honeypot
* Get it to work with SASS and a build flow
* Also Heroku requires pre-compiled assets? How can we add this to a deploy flow, with capistrano?
* Look at the current ruby and see if it needs rewriting to new more modern concepts
* Add (unit) tests
* Move the entire concept from one setting defining the event (and having to destroy everything for any subsequent new event), to being able to schedule multiple events
* HTML e-mail
* Check this entire thing against multiple devices (now it's more of bootstrap-gives-me-responsiveness-by-default-so-i-wont-test)
* Work on accessibility
* Complete the docs (as if I'll ever get so far...)
* Get things like AirBrake configurable or something
* The migrations are really a pita, when they run it always claims some columsn already exist, lets fix those, maybe delete them all from the codebase and test if we can setup  this thing from the onset?
* Also: add installation instructions