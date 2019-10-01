# Scheduling tool for Gaspard de Coligny school

This is a tool used for a school's parental board organising some events during the year, and trying to get volunteers to help during that event. The tool was orginally written by Yvan Cottyn, and later maintained by Vincent Mouton.

The current version of the tool is a caveman-migration from the original tool: just rewriting some code untill the entire thing worked again.

There's still a lot of work left to get this properly rewritten.


## How it works
* Define basic event settings (its name, the date, ...) using the `/settings` route (that route is currently behind a username/password combo which is hard-coded)
* Define `postjes` which is the actual job (the bar, the kitchen, cleaning, ...)
* 


## Need to fix
* Get the entire application working again (some things like config and destroy don't work)
* Remove the hard coded authentication
* Give the back-end some _bootstrap love_
* Rename some models to English (from dutch)
* Add (unit) tests
* Remove redundant pieces of code, including all old assets (css, js, ...)
* Get it to work with SASS and a build flow
* Move the entire concept from one setting defining the event (and having to destroy everything for any subsequent new event), to being able to schedule multiple events
* HTML e-mail
* Some UX changes are needed too
* Check this entire thing against multiple devices (now it's more of bootstrap-gives-me-responsiveness-by-default-so-i-wont-test)
* Work on accessibility
* Complete on the docs (as if I'll ever get so far...)
* Get things like AirBrake configurable or something