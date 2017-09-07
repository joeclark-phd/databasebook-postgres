# Chapter 3: Querying the data

## A declarative query language

You have already seen some of the **Structured Query Language (SQL)** which is used to express queries in Postgres (and every other relational database that I know of) and you're going to see a lot more in this book's chapters.  You have "programmed" several queries but here's one thing you may not know: SQL is not a programming language.  A computer program written in a language like Python, Java, or C++ is *imperative*---it gives a computer a sequence of instructions to carry out until it finished.  SQL, by contrast, is a **declarative language**.  In SQL queries, you describe the result that you want, not *how* the computer should obtain it.  That turned out to be a genius move by the creators of the first relational databases.

Inside a DBMS like Postgres is a special function called the **query optimizer** which processes a SQL query and generates an **execution plan** for how best to obtain the desired result.  In a complex query that incorporates multiple tables, there may be several steps in the plan, some slow and some quicker.  These operations may include **full table scans** (reading an entire table from disk; slow), **index scans** (much quicker), and different types of join operations (see Table 3-1).  Doing them in a certain order may be faster than doing them in another order, and this can make a big difference in a database with millions or billions of rows.  Because SQL is *declarative*, the query optimizer has the freedom to choose the most efficient sequence.

{title="Table 3-1: Sample of primitive operations in query execution"}
| Operation | Meaning |
|--------------------|
| Full table scan |  Read every row in the table and find the one(s) specified by the query.  |
|--------------------|
| Index scan (aka "seek") |  Search an index to quickly find locations of the rows specified by the query.  A database index is conceptually like the index in the back of a book; it makes finding the right "page" much quicker, more so when the book is longer. |
|--------------------|
| Table access |  Go directly to the location of the specified row(s) and read the data. |
|--------------------|
| Hash join | A two-phase algorithm to quickly join two tables based on an equality condition.  |
|--------------------|
| Nested loop join | A slower join algorithm that accommodates inequality conditions and other unusual joins.  |


Here is a key point that I'll come back to repeatedly: you should take advantage of the work that the database developers have already done.  Yes, you *could* write your own execution plan, or your own program for processing the data, but it would take a lot of time and you might not get it right.  Database engines are designed by some of the smartest computer scientists in the world and honed by practical experience for years, and they have very likely anticipated queries like yours.  Give the database the freedom to optimize, and it will generally do an excellent job.

A> My philosophy is at odds with received wisdom.  When I was first learning databases, I was often told that you should keep your business logic (i.e., your program) out of the database.  The SQL dialects of popular databases (Oracle, SQL Server, etc.) were very similar in their DML (**data manipulation language**) commands like `SELECT` and `INSERT`, but had very different implementations of views, triggers, stored procedures, and other programming features (all of which will be further discussed in Chapter 7).  The theory therefore was that if you used the latter, you'd be "locked in" to one database platform, so in order to keep your options open you should only use the database for the simplest DML operations.  These are known as the **CRUD operations**: create, read, update, and delete.
A> 
A> I disagree.  First off, I don't think lock-in is a very worrisome problem, especially when your chosen database has a long track record of success and is not too expensive.  Second, the rewards of committing to PostgreSQL or any quality database platform are well worth the small risk that it might be more expensive to switch to another platform at some hypothetical point in the future.  These days, databases typically support not just one application, but several---perhaps a web page, two mobile apps, and a public API.  In that case, do you really want to write the code for simple tasks (such as authenticating a user's login) over and over again in each of the programming languages used?  Implementing parts of your program's logic in the database reduces redundancy, may improve security, and allows you to take advantage of features like the query optimizer to make your program more efficient. 

## Relational operations

Relations (remember, this is the mathematical term for what we're calling "tables") are sets of tuples, as discussed in Chapter 2.  There are a number of mathematical operations that can be performed on them, with the interesting property of **closure**: the result of each **relational operation** is itself a relation.  The clauses of a SQL query can be interpreted as a specification of relational operations to be performed on the specified tables.  Interestingly, just as you might simplify a complicated equation in high school algebra before solving it, the query optimizer might use **relational algebra** to build its execution plan---choosing which operations to perform first in order to reduce the amount of computation it will have to do to finish the job.

The key relational operations identified by E. F. Codd and derived from set theory are the **projection**, **selection**, and **Cartesian product** operations, but to this database developers have added several more very useful operations, particularly **extended projection**, aggregation, grouping, and sorting.  See Table 3-2.

{title="Table 3-2: Important relational operations in SQL queries", width="wide"}
| Operation | SQL clause | Symbol | Meaning |
|===========|============|========|=========|
| Projection | `SELECT` | {$$}\sigma{/$$} | Return only the specified columns |
|-----|
| Selection | `WHERE` | {$$}\Pi{/$$} | Return only the rows that match specified criteria |
|-----|
| Cartesian product | `CROSS JOIN` | {$$}\times{/$$} | Return every combination of a row from table 1 with a row from table 2 |
|-----|
| Natural join | `NATURAL JOIN` | {$$}\Join{/$$} | Return all combinations of rows in specified tables that are equal on their common column |
|-----|
| Extended projection | `SELECT` | {$$}\sigma{/$$} | Create new columns, such as calculations, and include those in the result |
|-----|
| Aggregation | `SUM`, `COUNT`, `AVERAGE` etc. | {$$}G_{f(x)}{/$$} | Replace original rows with a single row containing the computed result |
|-----|
| Grouping | `GROUP BY` | {$$}_xG{/$$} | In combination with aggregation, split the original data into subsets to yield subtotals, subaverages, or whatever |
|-----|
| Sorting | `ORDER BY` | n/a | Re-arrange the rows in a specific order | 

**Projection** is the operation of reducing a table to a subset of its columns, and in SQL it is expressed as a list of columns following the `SELECT` keyword, for example:

    SELECT name, age
    FROM players;

**Selection** is the operation of reducing a table to a subset of its rows, and in SQL it is expressed as a logical test (for equality or inequality) follwing the `WHERE` keyword.  Multiple conditions may be combined into one with the `AND` and `OR` keywords if needed.  For example:

    SELECT *
    FROM players
    WHERE team='Patriots' AND position='QB';

These are certainly the most common operations, and most queries will employ both.  Consider the query

    SELECT name, age
    FROM players
    WHERE team='Patriots' AND position='QB';

This query may be expressed in relational algebra as {$$}\Pi_{name,age}(\sigma_{team=Patriots,position=QB}(players)){/$$}.  This formulation implies that the selection operation should be computed first, and then the projection operation.  But because it is an algebra, and because the outcome of every operation is another relation, we could just as easily flip it around, i.e.: {$$}\sigma_{team=Patriots,position=QB}(\Pi_{name,age}(players)){/$$}.  This kind of flexibility give the query opimizer room to make choices that speed up the query.  

Project, select.

Cartesian product, natural join.

Extended projection. Aliasing.

Aggregations, group bys.

Window functions.

Inequality joins.

## Queries within queries

Subqueries, correlated and not.

nested sub-subqueries.

## Lab

This time psql directly to the lab3 database.

re-introduce term DML. you have already seen INSERT and SELECT.

Sports database of matches and wins.  

Find average number of points scored per team per game.
Find highest-scoring player on every team.
Do an inequality join to identify coach based on start date (arbitrary).
Show teams' ranks with window function.
Join with generated calendar to show wins/losses per month.

Show how to explain a query, impose your own dumb query plan, and to time a query.



