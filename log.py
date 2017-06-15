from flask import render_template
from flask import Flask, request, redirect, url_for
from log_db import get_popular_articles, get_popular_authors, get_high_errors
from datetime import datetime

app = Flask(__name__)

@app.route('/', methods=['GET'])
def main():
	# What are the most popular three articles of all time?
	popular_articles = get_popular_articles()

	first_article = ((popular_articles)[0])[0].title()
	second_article = ((popular_articles)[1])[0].title()
	third_article = ((popular_articles)[2])[0].title()

	first_article_count = ((popular_articles)[0])[1]
	second_article_count = ((popular_articles)[1])[1]
	third_article_count = ((popular_articles)[2])[1]
	
	# Who are the most popular article authors of all time?
	popular_authors = get_popular_authors()

	first_author = ((popular_authors)[0])[0]
	second_author = ((popular_authors)[1])[0]
	third_author = ((popular_authors)[2])[0]

	first_author_count = ((popular_authors)[0])[1]
	second_author_count = ((popular_authors)[1])[1]
	third_author_count = ((popular_authors)[2])[1]

	# On which days did more than 1% of requests lead to errors?
	high_errors = get_high_errors()

	first_high_error = ((high_errors)[0])[0]
	first_high_error_count = "{:.1%}".format(((high_errors)[0])[1])

	# Connect to the HTML page
	html = render_template('log.html', popular_articles = popular_articles,
  									 popular_authors = popular_authors, 
  									 high_errors = high_errors,
  									 first_article = first_article,
  									 second_article = second_article,
  									 third_article = third_article,
  									 first_article_count = first_article_count,
  									 second_article_count = second_article_count,
  									 third_article_count = third_article_count,
  									 first_author=first_author,
  									 second_author=second_author,
  									 third_author=third_author,
  									 first_author_count=first_author_count,
  									 second_author_count=second_author_count,
  									 third_author_count=third_author_count,
  									 first_high_error=first_high_error,
  									 first_high_error_count=first_high_error_count)
  	return html

if __name__ == '__main__':
  app.run(host='0.0.0.0', port=8080, debug=True)