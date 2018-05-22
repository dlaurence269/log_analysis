# Purpose
* log_analysis is the first project that can be characterized as "Full Stack" from Udacity, an online programming educator.
* Udacity provided the "news" database for this log_analysis project.
* This project uses SQL, Python, and HTML (with templating) in order to create a simple page that acts as a "log".
* This page is supposed as if it were being read via email rather than a webpage.
* This log will display three results queried from a database called "news":
    1. What are the most popular three articles of all time?
    2. Who are the most popular article authors of all time?
    3. On which days did more than 1% of requests lead to errors?

# Running the Code
* It is assumed that this project is being checked by someone at Udacity who already has the "news" database, and therefore it is not to be included as part of the code submission.
* Therefore one must simply download the following files which are bundled together in the log_analysis folder:
    1. log.py
    2. log_db.py
    3. templates/log.html
* Unzip the log_analysis download.
* From the command window / bash, navigate to the log_analysis folder and enter in "python log.py".
* You will now be hosting this page over port 8080.
* Finally you can open your broswer of choice and navigate to localhost:8080 and you'll see the log page with the three questions and the respective answers displayed.

# Troubleshooting
* This project uses Python 3 as well as the psycopg2 library, which you will need to download if you don't have.
* That can easily be done with $ pip install psycopg2.
* Page still not displaying? Don't forget to have the "news" database on your device, whether it be in a virtual machine, or on your local computer.

# Example Output
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
