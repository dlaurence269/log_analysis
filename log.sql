"""
 make sure to answer the three questions, with only one SQL query each:
	
	 popular_articles
		 1. What are the most popular three articles of all time?
			 article name and number of views of the corresponding articles
	
	 popular_authors
		 2. Who are the most popular article authors of all time?
			 author name and number of views of all their articles
	
	 high_errors
		 3. On which days did more than 1% of requests lead to errors?
			 date and percent errors
"""





"""
 popular_articles
	 articles.author = authors.id
	 articles.slug = log.path OR rather articles./articles/slug = log.path
	 articles.title, and number_of_views needs to be the result in order from greatest to least limit 3

	 to show the article name in order, need to substitute id for number_of_views
		 select title 
		 from articles 
		 order by id desc 
		 limit 3;
	
	 concatenate articles.slug so it can join with log.path
		 select concat ('/article/', slug) 
		 from articles 
		 limit 3;

	 number_of_views
		 select path, count(path) 
		 from log 
		 group by path 
		 order by count(path) desc 
		 limit 3;
"""
	select title, count(title)
	from log 
		join articles on concat('/article/', slug) = path 
	group by title
	order by count(title) desc
	limit 3;





"""
 popular_authors
	 articles.author = authors.id
	 articles.slug = log.path OR rather articles./articles/slug = log.path
	 author.name, and number_of_total_views to be in the result in order from greatest to least limit 3
	 similar concept to popular_articles
"""
	select name, count(name)
	from(select *
		from log 
			join articles on concat('/article/', slug) = path) popular_articles
		join authors on popular_articles.author = authors.id
	group by name
	order by count(name) desc
	limit 3;





"""
 high_errors
	 To Do: cast log.time in to date, and percent errors is count(errors)/total_statuses
	
	 casts log.time in to date
	 separates statuses by day, 31 rows for the 31 days this was active, 
	 and lists the number of ERROR messages
		 select time::date as date, count(status)
		 from log
		 where status='404 NOT FOUND'
		 group by date
		 order by count(status) desc;
 
	 same as above but lists the number of TOTAL messages (not error messages)
		 select time::date as date, count(status)
		 from log
		 group by date
		 order by count(status) desc;

	 same as above but nested
	 shows date, count of error messages, and count or total messages, only thing lef to do is divide the two counts
		select error_statuses.date, error_statuses.count, total_statuses.count
		from(select time::date as date, count(status)
			from log
			where status='404 NOT FOUND'
			group by date) as error_statuses
			join(select time::date as date, count(status)
				from log
				group by date) as total_statuses on error_statuses.date = total_statuses.date
		order by error_statuses.count desc;
"""
	select error_statuses.date, cast(error_statuses.count as decimal(18,1))/cast(total_statuses.count as decimal(18,1)) as final_count
		from(select time::date as date, count(status)
			from log
			where status='404 NOT FOUND'
			group by date) as error_statuses
			join(select time::date as date, count(status)
				from log
				group by date) as total_statuses on error_statuses.date = total_statuses.date
		order by final_count desc;











