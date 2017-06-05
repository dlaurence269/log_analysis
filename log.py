from flask import render_template
from flask import Flask, request, redirect, url_for

app = Flask(__name__)

@app.route('/', methods=['GET'])
def main():
  '''Main page of the results.'''
  # results = "".join(POST % (date, text) for text, date in get_results())
  html = render_template('log.html', popular_articles='substitution_string_here', 
  									 popular_authors='substitution_string_here', 
  									 high_errors='substitution_string_here' ) #% results
  return html

if __name__ == '__main__':
  app.run(host='0.0.0.0', port=8080, debug=True)