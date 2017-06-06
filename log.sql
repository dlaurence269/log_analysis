# make sure to answer the three questions, with only one SQL query each:
	
	# popular_articles
		# 1. What are the most popular three articles of all time?
			# article name and number of views of the cooresponding articles
	
	# popular_authors
		# 2. Who are the most popular article authors of all time?
			# author name and number of views of all their articles
	
	# high_errors
		# 3. On which days did more than 1% of requests lead to errors?
			# date and percent errors

# popular_articles
	# articles.author = authors.id
	# articles.slug = log.path OR rather articles./articles/slug = log.path
	# articles.title, and number_of_views needs to be the final information shown in order from greatest to least limit 3
	# 

	select title from articles order by id desc limit 3; # to show the article name in order, need to substitute id for number_of_views
	select concat ('/articles/', slug) from articles limit 3; # concatenate articles.slug so it can join with log.path
	select path, count(path) from log group by path order by count(path) desc limit 3; # number_of_views
	select  # final join product

	select articles.title from articles join log on articles.concat('/articles/', slug) = log.path order by id desc limit 3;



	SELECT articles*, authors*, log*
	FROM articles
    JOIN authors.id = articles.author
    JOIN log
        ON log.path = articles.concat('/articles/',slug)
	WHERE DATE(TableC.date)=date(now())
	order by count(path) desc limit 3;

	OR

	SELECT 
    a.nameA, /* TableA.nameA */
    d.nameD /* TableD.nameD */
	FROM TableA a 
    INNER JOIN TableB b on b.aID = a.aID 
    INNER JOIN TableC c on c.cID = b.cID 
    INNER JOIN TableD d on d.dID = a.dID 
	WHERE DATE(c.`date`) = CURDATE()

# popular_authors
	# articles.author = authors.id
	# articles.slug = log.path OR rather articles./articles/slug = log.path


	join # final join product

# high_errors
	# date
	select
	# percent errors
	select
	# join
	join