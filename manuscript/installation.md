# Appendix A: Installing PostgreSQL and accessing it from the command line

In this chapter, I'll walk you through installing the latest version of PostgreSQL on Windows 10, Mac OS X, and select Linux distributions.  As stated in Chapter 1, the goal is to get to the point that you can enter the command `psql -V` at your system's command line, and the system responds by telling you the version of PostgreSQL installed.

Why type commands the command line?  Although there are point-and-click graphical interfaces available for PostgreSQL, it is difficult for me to give clear instructions about how to point and where to click.  These interfaces may also be different for users on different platforms.  The command line interface (CLI) to PostgreSQL is the same for all platforms and allows me to give precise instructions.  It will also ensure that you get lots of practice writing SQL.  As a bonus feature, non-technical people who see you doing this will think you're a super-hacker.

## Setting up PostgreSQL in Windows 10

### Obtain and install PostgreSQL

First, visit [www.postgresql.org](https://www.postgresql.org/) for the latest information about PostgreSQL.  Take note of the latest *stable* version number, which at the time of this writing appears under the heading "LATEST RELEASES".  There will probably also be an announcement about an unfinished future version, in alpha or beta test stage, but I recommend you avoid that one.  From the homepage, follow the "Download" link(s) until you find a Windows installer for the latest version.  At the time of this writing these links take you to the website of EnterpriseDB, a company that promotes PostgreSQL.

Unless your computer is very old, it should be a 64-bit system, so you'll click the link for the "Win x86-64" installer.  Again, make sure you're not downloading the unstable alpha or beta, but are getting the newest mature release.  The download may take some time if you have a slow connection.  When you have downloaded the installer, run it.

![Figure A-1: The PostgreSQL installer](/images/A-1installer.png)

The installer has several screens that ask you how to configure PostgreSQL, but for the most part you can accept the defaults. On about the fourth screen, you'll be asked to create a password for the database superuser (known as "postgres").  This is the user account that can create and delete databases, and other users.  Since you're just practicing on (presumably) your personal computer, it's best to pick something easy to remember and that you don't mind other people seeing.  By all means, though, don't forget what password you entered.

![Figure A-2: Setting a superuser password](/images/A-2password.png)

You should be able to click "next" through all of the remaining screens, and watch the installer do its job.  After installing the software, the Setup Wizard will give you the option to launch something called "Stack Builder", to augment PostgreSQL with some optional add-ons.  You can uncheck the box and skip that step.  If you do find yourself in Stack Builder, you can get out of it by clicking "Cancel" if you wish.

![Figure A-3: Installation finished! You can skip Stack Builder.](/images/A-3stackbuilder.png)

### Access `psql` from the Windows command prompt

(to do... you'll probably need to set your Path to make this work...)

## Setting up PostgreSQL on a Mac

(to do)

## Setting up PostgreSQL in Linux

(to do)