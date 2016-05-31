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

To get to the Windows command line, search for the program called "cmd.exe".  In Windows 10 you can do this by clicking the "Windows" icon to launch the main menu, and then typing "cmd".  This should work for other recent versions of Windows, too.  I recommend pinning the icon to your taskbar, so you can access it quickly in the future.

![Figure A-4: The Windows command prompt, cmd.exe](/images/A-4cmd.png)

Upon opening this application, you'll be presented with a text-only window into which you can enter commands one at a time.  Type `help` and hit Enter for a list of basic commands you can use to navigate this interface.  Most likely you'll find `cd` (change directory) and `dir` (list the files in a directory) useful for navigating folders and getting to your work.

Test your PostgreSQL installation by typing `psql -V`.  If the output of this command is the PostgreSQL version number, you're done with installation, and may go back to Chapter 1 to begin the lab.  More likely, though, you'll get an error message saying that `psql` isn't recognied as command or program.  That means there's one more step to do: we need to set your PATH.

![Figure A-5: This error indicates that I need to correct my PATH.](/images/A-5notfound.png)

When you type the name of a program, like PostgreSQL's command line interface `psql`, the operating system looks in a number of directories to find a program of that name.  If it doesn't find one, you'll see an error message like that shown in Figure A-5.  The PATH is the environment variable that stores the list of directories to search in.  You'll need to find out where `psql` lives on your system, and add that directory to the PATH.

Finding `psql` is the easy part.  It's most likely in the directory `C:\Program Files\PostgreSQL\9.5\bin` (change "9.5" if necessary, depending on the version you installed).  If not, use your system's search tools or poke around until you find it.  By the way, the true name of this file is "psql.exe", with the ".exe" suffix signifying to Windows that it is an executable program.  Depending on your folder settings, you may or may not see the suffix.

To alter the PATH, navigate to the "System" control panel.  Windows 10 makes this a little more complicated than in earlier versions of Windows.  You can either do a search for "Control Panel" and then click to "System", *or* you can go to the Settings panel, click "System", then scroll down and click "About", then scroll down and click "System Info".  Either way you'll find yourself on a page that displays basic information about your computer, its processor, memory, and operating system version among other details.  On the left, click "Advanced system settings".  A new window will appear.  Near the bottom of that window, click the button for "Environment Variables...".

![Figure A-6: Windows environment variables settings](/images/A-6winenvvars.png)

Environment variables are data that are accessible to all programs running on your system, and they're usually used for things that multiple programs need to know about (such as the location of your database) but which may be different from one computer to the next.  By using an environment variable to store this information, you don't have to include it in code.  Therefore a program could be developed on one computer and deployed to another that has things set up differently, and the original code wouldn't need to be altered.  In the code, instead of saying "connect to the database located in directory C:/X/Y/Z", you'd say "connect to the database at environment variable DATABASE_LOCATION".

In the environment variable control panel (see Figure A-6), you'll see a list of variables specific to your user account, and a list of variables that apply to the whole system (all possible users).  You can alter the PATH (or "Path", "path", "pAtH", etc.) in either of these lists, or create it if it doesn't already exist.  If one already exists, select it and click "Edit...".  Add a new listing to the end of the PATH for the directory where `psql` lives.  Do not delete existing entries!  They are probably important for other programs you use.

![Figure A-7: Adding a new entry to the PATH; in previous versions of Windows this is a long, messy text box but it serves the same purpose.](/images/A-7winpath.png)

Once you have updated the PATH and clicked "OK" in the Environment Variables control panel, you must open a new command prompt window with `cmd`.  Now the command `psql -V` should give you the expected response, as seen in Figure A-8.  If not, you may have made a typographical error in setting the PATH or you may be using a `cmd` window that was opened before you made the change.  Close all windows and try again, or seek help from an expert.

Setting the system's PATH has been a stumbling block for many of my students, especially since it has to be done on day one, but I promise that it only needs to be done once!

![Figure A-8: PostgreSQL is now installed and accessible from the command line.](/images/A-8working.png)

## Setting up PostgreSQL on a Mac

(to do)

## Setting up PostgreSQL in Linux

(to do)