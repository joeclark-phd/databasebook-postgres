# Chapter 1: How databases fit in

## Introduction

Imagine that you work in a small direct-response mail order company that takes orders from customers by phone.  Each agent in the call center downstairs has a stack of paper order forms on his desk, and when he receives an order he writes down the product name(s), quantity ordered, and the customer's address and payment information.  He uses a calculator or computer to sum up the order total, and tells the customer how much they'll be charged.  

Periodically, a data entry worker visits the call center and picks up stacks of filled-in order forms.  She enters each order's details into a file on her desktop computer, perhaps a big Excel spreadsheet that she's designed herself for this task.  At the end of the day, when all the orders are entered, she sends the complete file to two other departments: fulfillment, which processes the customer's credit card and packs and ships the orders, and accounting, which calculates each salesperson's commission.

This is the kind of process that a small business might develop when it's first getting started, and in fact, it's exactly the process that I encountered when I was first learning about databases at a small company in Maine.  Unfortunately, simple processes like this tend to get complicated as the company gets bigger, and can become impossible to maintain.  Just a few of the challenges this company might face are:

- When the business grows to the point that multiple data entry workers are needed, they must coordinate their work somehow.  Perhaps each worker creates her own file, and they must combine them at the end of the day.  There are many opportunities for errors to enter the system.

- If a payment is declined, or if a customer returns an order, one of the old spreadsheets must be updated, but which one?  The data is kept in the order it was entered, not alphabetized by customer, and if there are now multiple spreadsheets for each day of business, searching for the old order is a big challenge.

- As a result of the update made by fulfillment or customer service, multiple versions of the data exist.  Accounting still has the old data, and they need to be notified of the change so they can correct the salesperson's commission.  Even if they're sent the modified file, how do they know which row(s) are changed?  And as more changes are made over time, who is responsible for keeping the official record?

- As the business grows, the order entry data may change.  For example, product numbers or names may change, discounts or coupon codes may be introduced, or some kind of membership number may be offered to frequent customers.  As the paper order forms change, the spreadsheets must also be modified.  Consequently, today's data files look different from last month's and even more different from last year's.  As people change jobs and leave the company, can their replacements even read the older data?

As this small business becomes a medium-sized enterprise, the seeming convenience of using a spreadsheet can become a nightmare of data management.  Before long, the data entry workers, accountants, and other departments may find they spend more time managing spreadsheets than doing their main jobs.  And sooner or later, management may wish to use the historical order data for a new purpose, such as customer relationship management (CRM) or business intelligence (BI).  What they'll find is that the data is spread out over a huge number of files, with multiple versions of each file existing in different places, and older files having a different structure and meaning from newer files.  What a mess!

A> There are lots of other problems we could imagine in this scenario, but I wanted to keep it brief.  One that ought to be mentioned is the security disaster posed by this system.  The spreadsheet in my story contains customers' credit card numbers as well as personally identifying information, and it's being passed around willy-nilly between departments.  Moreover, any employee with a grievance could walk out the door with all of the data on a thumb drive, and who would know?

## A database

Imagine instead if there was a **black box** in the office into which all those order forms were fed.  At any time, a person could ask the black box to retrieve any order record (or list of records) by time and date, by customer name, by product, or another attribute.  Fulfillment could ask for the payments waiting to be processed, and it would get a printout of exactly that.  Shipping could request invoices and mailing labels for orders ready to ship.  Accounting could ask for the sum of order totals taken by each salesperson for a given time period.  Moreover, changes could be filed in the black box and all subsequent requests would include the up-to-date, corrected information.  The black box serves as the manager of, and the official system of record for, all the company's order data.

That's the big idea of a **database**.  Instead of having every person or department or program keep its own copy of the data, a database serves as a system of record, a "single source of truth" that can always be accessed by everyone who needs it for their different purposes.  A database stores some knowledge about the data's structure and meaning, or **metadata**, so diverse users can know what they're looking at.  And most importantly, a database offers flexible but easy-to-use **query** methods so that users can request just the data they want, whether it's a single record, a collection of data, or an aggregation into averages, counts, or sums.

## A variety of databases

Databases come in many shapes and sizes and they serve a lot of different purposes.  Most often, a database acts as a **server**, that is, a software program that is always on, waiting for requests and responding to them.  It's necessary for databases to always be on and available if people and other software systems are going to depend on them to store data.  (Otherwise, those people and programs will have to store their own data locally, which defeats the purpose of a database -- independent and shared data management.)  

A **database administrator** (DBA) is therefore responsible for a key component of a business's IT infrastructure.  If the database goes down, a lot of other programs go down, so the DBA ought to learn best practices for managing security, keeping backups and recovering from disasters.  Maintaining and upgrading a database has been compared to maintaining a sailing ship when it is out to sea.  The DBA can't just take the database out of service to work on it however he wants; the business must stay afloat.

Server-based databases vary widely in scale and scope.  Some databases support a single application, such as a dynamic website, and these may run on the same physical computer as the application's code.  A larger database might run on a dedicated machine that multiple users access over the network; for example, a company may keep a database of customer relationship information which can be accessed by sales, marketing, and customer service systems.  

A> The term "server" means a software or hardware system that is constantly listening for requests or commands and reacting to them.  When a software server runs on a computer dedicated to that purpose, the computer itself is also called a "server".

Larger still are **enterprise-scale** databases that integrate a wide variety of subject areas.  This category includes enterprise resource planning (ERP) systems that integrate several areas of business operations, and enterprise data warehouses (EDW) used for analysis and reporting of business performance.  Enterprise-scale databases may run on mainframes or may be distributed over large clusters of dozens or hundreds of computers.

A> It is worth noting that there are also what we may call "personal" or "desktop" databases that run on personal computers and do not remain active when not in use.  These databases are created with programs such as SQLite and Microsoft Access (the two you're most likely to encounter) and are saved as files.  They have many of the features for structuring and querying data that you'll learn from this book, such as the SQL query language, but for business use they would still pose most of the same problems as the spreadsheets in my opening vignette.  You would still end up with lots of different versions of the same (database) files with inconsistent data kept by different people and departments.  

A> If your goal is simply to learn SQL or relational data modeling, though, SQLite and Access are both fine choices.

## What you'll learn from this book

This book will introduce you to relational databases, with data modeling and SQL first and foremost.  It covers the scope of a typical first database course in an information systems or analytics program at the university level.  It can be used as a textbook for an instructor-led course---instructors, please contact the author for an instructor's guide, slides and materials--or used for self-guided study with or without the video lectures produced by the author (coming soon via Leanpub).

My main goal in creating this book is to make data modeling and SQL understandable to the reader, so it may serve as a good low-cost supplement for students who are struggling with a theory-heavy textbook and having a hard time getting the point.  Instead of starting with loads of theory up-front, I'll take a more pragmatic approach based on relational data modeling "patterns" and examples.  

This book will also provide a lot of practice using SQL, the structured query language common to all relational databases, because the most frequent feedback I've heard from my students at Arizona State (and from companies that hire them) is that they need more practice with SQL.

The database of choice for this book is PostgreSQL (often nicknamed "Postgres"), an open-source database that has become quite popular with developers in recent years.  Compared to some other popular databases like SQL Server and MySQL, there aren't many good books about Postgres, so I hope this book will be valuable if only for its examples.  Postgres makes a good choice for teaching because it is free software (both "free as in free speech" and "free as in free beer"), and because it runs on all the major platforms---Windows, Mac OS, and Linux---so you can follow this book no matter what kind of computer you have handy.

Rest assured that the lessons of this book are transferable to other relational databases.  Each of the major brands has its own quirks and special features, but this book mainly covers the fundamentals that apply everywhere.  As currently planned, one chapter will exhibit some of PostgreSQL's special features.

A> If this book finds any significant success with readers, I fully intend to create additional versions of the text that highlight SQLite, MySQL, Access, or whatever other platforms people are interested in.  Give me feedback!

## Example 1: your first PostgreSQL database

Coming soon!
