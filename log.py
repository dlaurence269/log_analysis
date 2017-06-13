from flask import render_template
from flask import Flask, request, redirect, url_for
from log_db import get_popular_articles, get_popular_authors, get_high_errors

app = Flask(__name__)

@app.route('/', methods=['GET'])
def main():
  html = render_template('log.html', popular_articles=get_popular_articles(), 
  									 popular_authors=get_popular_authors(), 
  									 high_errors=get_high_errors())
  return html

if __name__ == '__main__':
  app.run(host='0.0.0.0', port=8080, debug=True)