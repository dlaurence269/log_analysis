# make sure to answer the three questions, with only one SQL query each:
# 1. What are the most popular three articles of all time? -article name and number of views of the cooresponding articles
# 2. Who are the most popular article authors of all time? -author name and number of views of all their articles
# 3. On which days did more than 1% of requests lead to errors? -date and percent errors

# result1
	# article name
	SELECT name FROM authors limit 5;
	# number of views
	SELECT max(path) FROM log group by path order by count(path) desc;
	# join