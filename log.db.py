#forumdb equivalent from previous project

import psycopg2, bleach

DBNAME = "news"

def get_popular_articles():
  """ Return 'What are the most popular three articles of all time?' """
  db = psycopg2.connect(database=DBNAME)
  c = db.cursor()
  c.execute("select name from authors limit 3;")
  popular_articles = c.fetchall()
  db.close()
  return popular_articles

  def get_popular_authors():
  """ Return 'Who are the most popular article authors of all time?' """
  db = psycopg2.connect(database=DBNAME)
  c = db.cursor()
  c.execute("select;")
  popular_authors = c.fetchall()
  db.close()
  return popular_authors

  def get_high_errors():
  """ Return 'On which days did more than 1% of requests lead to errors?' """
  db = psycopg2.connect(database=DBNAME)
  c = db.cursor()
  c.execute("select;")
  high_errors = c.fetchall()
  db.close()
  return high_errors