# What is the purpose of this code / project?
* This is a project from Udacity's Full Stack Nanodegree.
* This is our first project that can be characterized as "Full Stack".
* Everything we did we created from scratch with the exception of the database itself.
* We were instructed to use SQL, Python, and HTML (with templating) in order to create a simple page that acts as a "log".
* This page is supposed to be a clear as possible while remaining simple, as if it were being read via email rather than a webpage.
* This log will display three results queried from a database called "news":
    1. What are the most popular three articles of all time?
    2. Who are the most popular article authors of all time?
    3. On which days did more than 1% of requests lead to errors?

# How to run the code:
* The assumption for running this code is that it is being done by someone at Udacity who already has the "news" database, and therefore we are not to include it as part of our code submission.
* Therefore one must simply download the following files which are bundled together in the log_analysis folder:
    1. log.py
    2. log_db.py
    3. templates/log.html
* Unzip the log_analysis download.
* From the command window / bash, navigate to the log_analysis folder and enter in "python log.py".
* You will now be hosting this page over port 8080.
* Finally you can open your broswer of choice and navigate to localhost:8080 and you'll see the log page with the three questions and the respective answers displayed.

# Having problems running the code?
* I used Python 3 for this project as well as the psycopg2 library, which will need to be downloaded if you don't have it.
* That can easily be done with $ pip install psycopg2.
* Page still not displaying? Don't forget to have the "news" database on your device, whether it be in a virtual machine, or on your local computer.

# Example Output:
#### 1. What are the most popular three articles of all time?


* "Candidate Is Jerk, Alleges Rival" - 338,647 views
* "Bears Love Berries, Alleges Bear" - 253,801 views
* "Bad Things Gone, Say Good People" - 170,098 views

#### 2. Who are the most popular article authors of all time?


* Ursula La Multa - 507,594 views
* Rudolf von Treppenwitz - 423,457 views
* Anonymous Contributor - 170,098 views

#### 3. On which days did more than 1% of requests lead to errors?


* July 17, 2016 - 2.26% errors
