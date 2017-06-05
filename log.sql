# make sure to answer the three questions, with only one SQL query each:
	# 1. What are the most popular three articles of all time?
		# article name and number of views of the cooresponding articles
	# 2. Who are the most popular article authors of all time?
		# author name and number of views of all their articles
	# 3. On which days did more than 1% of requests lead to errors?
		# date and percent errors

# popular_articles
	# article name
	##### SELECT name FROM authors limit 5;
	# number of views
	##### SELECT max(path) FROM log group by path order by count(path) desc;
	# join
	#####

# popular_authors
	# author name
	##### select name from authors
	# number of views of all their articles
	#####
	# join
	#####

# high_errors
	# date
	#####
	# percent errors
	#####
	# join
	#####

#forumdb equivalent from previous project

import psycopg2, bleach

DBNAME = "news"

def get_popular_articles():
  """ Return 'What are the most popular three articles of all time?' """
  db = psycopg2.connect(database=DBNAME)
  c = db.cursor()
  c.execute("SELECT name FROM authors limit 5;")
  popular_articles = c.fetchall()
  db.close()
  return popular_articles

  def get_popular_authors():
  """ Return 'Who are the most popular article authors of all time?' """
  db = psycopg2.connect(database=DBNAME)
  c = db.cursor()
  c.execute("SELECT name FROM authors limit 5;")
  popular_authors = c.fetchall()
  db.close()
  return popular_authors

  def get_high_errors():
  """ Return 'On which days did more than 1% of requests lead to errors?' """
  db = psycopg2.connect(database=DBNAME)
  c = db.cursor()
  c.execute("SELECT name FROM authors limit 5;")
  high_errors = c.fetchall()
  db.close()
  return high_errors