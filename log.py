# I am using a virtual environment to run python 3 for this project,
# so I cannot include a shebang statement.
from flask import render_template
from flask import Flask, request, redirect, url_for
from log_db import get_popular_articles, get_popular_authors, get_high_errors

app = Flask(__name__)


@app.route('/', methods=['GET'])
def main():
    # Call the SQL queries
    popular_articles = get_popular_articles()
    popular_authors = get_popular_authors()
    high_errors = get_high_errors()
    # Connect to the HTML page
    html = render_template('log.html', popular_articles=popular_articles,
                           popular_authors=popular_authors,
                           high_errors=high_errors)
    return html

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
