# make sure to answer the three questions, with only one SQL query each:
	
	# popular_articles
		# 1. What are the most popular three articles of all time?
			# article name and number of views of the corresponding articles
	
	# popular_authors
		# 2. Who are the most popular article authors of all time?
			# author name and number of views of all their articles
	
	# high_errors
		# 3. On which days did more than 1% of requests lead to errors?
			# date and percent errors

# popular_articles
	# articles.author = authors.id
	# articles.slug = log.path OR rather articles./articles/slug = log.path
	# articles.title, and number_of_views needs to be the result in order from greatest to least limit 3

	select title from articles order by id desc limit 3; # to show the article name in order, need to substitute id for number_of_views
	select concat ('/article/', slug) from articles limit 3; # concatenate articles.slug so it can join with log.path
	select path, count(path) from log group by path order by count(path) desc limit 3; # number_of_views

	select title, count(title) as number_of_views
	from log 
		join articles on concat('/article/', slug) = path 
	group by title
	order by count(title) desc
	limit 3;

# popular_authors
	# articles.author = authors.id
	# articles.slug = log.path OR rather articles./articles/slug = log.path
	# author.name, and number_of_total_views to be in the result in order from greatest to least limit 3

	select name, count(name) as number_of_total_views
	from log 
		join articles on concat('/article/', slug) = path 
	from authors
		join articles on authors.name = articles.id
	group by name
	order by count(name) desc
	limit 3;

# high_errors
	# date
	select
	# percent errors
	select
	# join
	join