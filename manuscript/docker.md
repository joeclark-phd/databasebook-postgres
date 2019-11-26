# Using Docker to install and run PostgreSQL

Most business databases are meant to run on *servers* maintained by system administrators, which means that installing and setting them up can be complicated and can require a fair amount of tweaking.  (Desktop databases like Microsoft Access and SQLite are exceptions.) After experimenting with several ways of installing Postgres on Windows, Mac, and Linux machines, and getting frustrated with issues like version updates, I've come to the conclusion that it's better to let someone else do the work for you.  That suggests two options: spin up a database "in the cloud", or run it in a "container".  If your professor takes the first approach, he'll have databases set up before the class begins, and he'll give you the code to connect to your database.  The second approach requires **Docker**, a neat tool that lets developers "containerize" applications with all the configuration they need, and your computer to download and run those containers without any fuss.

Using Docker to spin up a database on your computer is easy.  Go to https://docker.com and download Docker Desktop for Mac or Windows. Once it's up and running, open up a command line (i.e. "Powershell" in Windows or "Terminal" on the Mac), and type the following:

    docker container run -d postgres:latest

As you watch, Docker downloads the image or pattern for a Postgres container and then launches it.  You can list running containers by entering `docker ps` at the prompt.  You will see that Docker has given the container a randomly generated Container ID and Name.  In my case the container ID is "1c9a696e4023" and the name is "lucid_yalow".  You can log in to your running container by using the name, the ID, or a portion of the ID.  Here's the command you need to get to the `psql` prompt:

    docker exec -it lucid_yalow psql -U postgres

Obviously, substitute your container name where I have "lucid_yalow". (I also could have used part of my container ID, such as "1c9".)  Now you're ready to execute Postgres commands or enter SQL.  When you're done, enter `\q` to exit `psql`.

A> You can also use `docker exec` to run the `createdb` and `dropdb` commands to create a new database, for example:  `docker exec -it lucid_yalow createdb -U postgres lab1`. Or if you'd like to get to the Unix shell in the container, try `docker exec -it lucid_yalow bash`, and then you can use `psql`, `createdb`, or `dropdb` from the bash prompt. If this doesn't make sense to you, don't worry, just write down the commands you need to remember on a cheat sheet.  Every professional programmer has a few of these on sticky notes or index cards around his desk.

You can leave the container running in the background, and it will persist even after the system restarts, but if you find it slows down your computer you can stop it like so:

    docker stop lucid_yalow

And you can re-start it later with:

    docker start lucid_yalow

The container should keep the tables, data, etc., even after it is stopped and started, but if you ever want a clean, new database with nothing in it, just repeat the command beginning with `docker container run` above to start a new container from the same image.  There's a lot more that you can do with Docker containers and databases, but this should be enough to get you started and avoid having to struggle with configuration.

If you don't want to use Docker but would prefer to install the PostgreSQL server using a more conventional installer, see the appendix "Installation" at the end of this e-book for instructions for Mac, Windows, and Linux, or if my instructions are out of date, search for help online.

