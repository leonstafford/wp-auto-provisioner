# WP Auto Provisioner

Aids in development and testing of multiple WordPress plugins/themes.

Launch multiple, isolated WordPress installs on different OS/library environments.

# Motivation

*TL;DR - I prefer painless development!*

I've gotten back into WordPress development work, both for open source projects and some paid, closed work. A big blocker to productivity for me is when I can't get up, running and coding on a project in less than a few commands. So, I created some auto-provisioning tools in each of the projects I was working in, some using Docker and shell scripts, others using Vagrant/Ansible, some with Ruby/Selenium tests. Some projects have their own build scripts in Node or shell. It is now at the point that I would be pained to not have these auto-provisioning scripts, but I'm tired or recreating the wheel in each project. I also don't want the provisioning scripts to live within the target project, as I want to send PR's to open source projects without dirtying it up with my own utility scripts.

So, here will live my toolbox for auto-provisioning WordPress (and probably useful for other PHP) projects. 

# Design goals

KIPP - Keep It Painless, Protagonist

 - host system requirements minimal (ideally, Docker and a shell)
 - 4-steps to development on a brand new box
   - clone this project
     - install dependencies
   - clone development project
   - auto-provision

# Provisioning options

 - Docker + shell
 - Docker + Ansible

*removing Vagrant / VirtualBox to reduce complexity*

# Custom templates per project

These are my current required environments, which I'll build support for first:

 - Any Debian-based OS, Latest WordPress, PHP7, Apache for developing [WP Static HTML Output Plugin](https://github.com/leonstafford/wordpress-static-html-plugin)
- Latest WordPress, PHP5.3, Apache, Ruby for testing [WP Static HTML Output Plugin](https://github.com/leonstafford/wordpress-static-html-plugin)
- Latest WordPress, PHP7, Apache for developing [WP Flexible CSV Importer](https://github.com/leonstafford/wp-flexible-csv-importer)
- Specific WordPress, PHP7, Apache, Node for developing paid project
- Specific PHP, Apache, MySQL for developing CodeIgniter project for non-profit
- Specific WordPress, Specfic PHP, other configs for ad-hoc testing of projects

If you stumble upon this project and want some help tweaking it for your own needs, just shoot me an email: [lionhive@gmail.com](mailto:lionhive@gmail.com)

As you can see from above, it's far from receptive of a "one-size fits all" environment. Even using Docker was not enough when it came to getting a WordPress environment with PHP 5.3, as this PHP release was no longer officially supported and not easily available on official Docker images. When I encountered that project, it was more practical to modify some existing Vagrant/Vbox/Ansible scripts to work with an Ubuntu 12 / PHP 5.3 box. 

# Usage

*BDD style here, this is what I expect, not what exists:*

 - clone this project
   clone your WordPress theme or plugin to another location (outside of this project's root)
 - `cp -r sample-templates/wp-latest-plugin-development templates/yourtemplatename`
  - run `./provisioner.sh TEMPLATE PATH_TO_YOUR_PLUGIN`
 - project is now up and running at the address output in previous command

Optionally, create alias `wpap`, allowing you to run `wpap PATH_TO_YOUR_PLUGIN` from wherever you are. 

`alias wpap="/path/to/wp-auto-provisioner/provisioner.sh"`
