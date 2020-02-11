# About this book

This book is intended as a first introduction to relational databases or for those who have a little experience to review the fundamentals of data modeling and SQL.  It may be suitable as a textbook for a university course.  In particular, it may be a good supplement for one of those overpriced, theory-heavy textbooks that universities like to assign.  Due to its low price and its focus on practical data modeling patterns, students may use this book for additional practice and self-study.

Also, as far as I know, it's the only such textbook to use PostgreSQL as the database of choice for examples.  PostgreSQL or "Postgres" is an increasingly popular, free and open source database that runs on all the major platforms (Windows, Mac OS, Linux), making it a great choice for the classroom or independent learner.

## An open-source book

As of February 2020, I am re-starting this book project as a kind-of, sort-of, open source project.  The manuscript, along with its graphics and sample code, can be viewed in its [Github repository](https://github.com/joeclark-phd/databasebook-postgres).  Although I retain my copyright to the work, I welcome contributions, typo corrections, and improvements to the sample code.  I'll add more details about how you can contribute to the book as the project develops.

## Structure of chapters

Ten chapters are currently planned (however, as the book is unfinished, the plan may change).  Here is the plan:

1. **Introducing databases and PostgreSQL**.  We start by putting databases into their proper context as one of the fundamental business information technologies, and by getting you oriented to PostgreSQL. Examples will have you creating and querying single-table databases (which, frankly, may be all you need for some simple business applications!).

2. **The relational model**.  We'll explain the theory behind the design of *relational* databases and discuss their advantages, then introduce the building blocks of multi-table databases.  You'll learn how tables are connected by keys, work through several examples of entity-relationship diagrams, and then query these databases with all kinds of SQL JOINs.

3. **Querying the data**.  This chapter introduces the basic operations of relational algebra, and how they can be assembled together to create SQL queries ranging from simple to complex.  New skills will include subqueries, grouping, and functions for working with text and dates.

4. **Normalizing a data model**.  Now that you've got the fundamentals down, we'll take a look at the kinds of errors and inefficiences that can creep into production databases, and learn a set of tricks data modelers call "normalization" that can prevent them.

5. **More relational patterns**.  Here we'll consider some common situations that real-world databases must model, and reveal some frequently-used database design patterns that fit each situation.  This chapter may be seen as a cookbook of best practices from the field.

6. **Logic in the database**.  Beyond one-off queries, we can enhance our databases with re-usable programs such as views, triggers, and stored procedures.  Chapter 6 will discuss several reasons why that might be a good idea, and will teach you how to do it.

7. **Advanced PostgreSQL tricks**.  Every database has some special features that distinguish it from others in the same category.  In this chapter we'll take Postgres through its paces, examining signature features such as array variables, JSON data types, and recursive queries.

8. **Just enough physical design**.  To get the best performance out of your database, it helps to know something about the physical plan of how the data is written to disk.  We'll learn how to profile database performance and improve it with the right data types and indexes.  Database security and some other administrative issues will also be discussed.

9. **Dimensional modeling for analytics**.  Analyzing large amounts of data is a very different problem from efficiently carrying out transactions, and has motivated the design of a different way to model data--the star schema.  We'll see why this is a valid case for breaking all the rules of normalization that we learned earlier, and implement a basic star schema with an ETL routine in Postgres. 

10. **Database-driven web applications with Python**.  Databases don't exist in a vacuum; they're usually part of an application.  This chapter shows you the whole picture of how a web application might be programmed in Python to link to a Postgres backend and make its data available dynamically to end users. Then we'll upload it to the cloud.  At the end of it all, you'll have a plan that you can re-use to go out and make your own apps.

11. **Appendix A: Installation**.  Setting up PostgreSQL is the first hurdle to jump, unless you have a computer lab administrator who has done it all for you.  In this appendix I've collected a few sets of instructions for installing PostgreSQL and setting it up for this course.

## Case studies

Along the way, I'll take the reader through a number of case studies.  These will be relatively complete databases for realistic businesses--an e-commerce app, a social network, a manufacturing (MRP) system, and a learning management system--that we'll build up in chunks, a little bit each chapter.  How you'll experience each case study will vary.

Two cases, an auction e-commerce app called AUCTagon and a social networking app called WebuLATER, will be built up by the author within the book's chapters.  These are demonstration cases that will allow us to give concrete examples of each chapter's concepts, and the code to reproduce them will be available on the book's Github repo.

Two other cases will be described and offered as homework.  

LESSONbinder will be a learning management system (LMS) of the type that most colleges use today.  It will be up to you, the reader, to implement its database.  My "answers" to this homework case study will be available only in the instructor manual for faculty using this course to teach. Instructors, go ahead and e-mail me to request a copy.

PalletTABLE will be a more challenging exercise, a database to support a manufacturing planning system (a type of system commonly called manufacturing resource planning or MRP).  My implementation of a solution to this exercise will be available in a separate online resource that solo learners can request, separate so you'll be encouraged to work through the problem yourself before looking "in the back of the book".

## How to use the book

Chapters 1 through 4 cover the core knowledge areas that anyone working with databases should know, and they give lots of examples of SQL queries.  A typical college course on databases will thoroughly drill these concepts, so if you're a student in one of those classes, be sure you know them well.  At the end of each chapter you'll find a glossary of new terms and a review of new SQL syntax that was covered, as well as problems and challenges for review.  Answers to some of the questions will be available in a separate online resource.

Chapter 5 and 6 build on the fundamentals to provide you with a repertoire of smart solutions to common problems.  Turn to these if you think you know all about database design and SQL but are still struggling to figure out how to use a database in the real world.  Chapter 7 adds to this some of the special things that Postgres can do differently than other relational databases such as MySQL and SQL Server.

Chapter 8 and 9 are probably not covered by your college course (unless they're using *Relating To The Database* as the text!) but both are intended to enhance your understanding of databases by considering certain special and different perspectives.  It might be safe to skip over them or come back to them later when you're ready to broaden your mind.

Chapter 10 is meant to put it all together into a working dynamic website.  If you think you've got enough database skill but are stumped as to how to assemble a complete tech stack for your big idea, chapter 10's examples using Python (one of the easiest and most popular languages for new developers) will give you a starting point.  Feel free to jump to this chapter at any point, once you've got down the basics covered in the first few chapters.

## Instructors

Instructors, I will be developing resources for you including instructional videos, slide decks, test banks, and answer keys.  When these are available, you'll be able to contact me to request them.  My goal is to make it easy for you to put together a basic course in databases with PostgreSQL with a minimum of difficulty for you.  You can use as much or as little of the material as you like.


