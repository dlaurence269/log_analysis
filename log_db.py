#forumdb equivalent from previous project
import psycopg2, bleach

DBNAME = "news"

def get_popular_articles():
  """ Return 'What are the most popular three articles of all time?' """
  db = psycopg2.connect(database=DBNAME)
  c = db.cursor()
  c.execute("""
    select title, count(title)
    from log 
      join articles on concat('/article/', slug) = path 
    group by title
    order by count(title) desc
    limit 3;
    """)
  popular_articles = c.fetchall()
  db.close()
  return popular_articles

def get_popular_authors():
  """ Return 'Who are the most popular article authors of all time?' """
  db = psycopg2.connect(database=DBNAME)
  c = db.cursor()
  c.execute("""
    select name, count(name)
    from(select *
      from log 
        join articles on concat('/article/', slug) = path) popular_articles
      join authors on popular_articles.author = authors.id
    group by name
    order by count(name) desc
    limit 3;
      """)
  popular_authors = c.fetchall()
  db.close()
  return popular_authors

def get_high_errors():
  """ Return 'On which days did more than 1% of requests lead to errors?' """
  db = psycopg2.connect(database=DBNAME)
  c = db.cursor()
  c.execute("""
    select
    error_statuses.date, cast(error_statuses.count as decimal(18,1))/cast(total_statuses.count as decimal(18,1)) as final_count
    from(select time::date as date, count(status)
      from log
      where status='404 NOT FOUND'
      group by date) as error_statuses
    join(select time::date as date, count(status)
      from log
      group by date) as total_statuses on error_statuses.date = total_statuses.date
    where cast(error_statuses.count as decimal(18,1))/cast(total_statuses.count as decimal(18,1)) > .01
    order by final_count desc;
      """)
  high_errors = c.fetchall()
  db.close()
  return high_errors