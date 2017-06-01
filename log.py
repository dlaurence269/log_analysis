import log.html # connect the HTML page display with this python page
import log.sql # connect the SQL queries with this python page
import cgi # import the library that allows for escaping

def espcape_html(s): # escaping should not be necessary becasue there should be no imputs, simply the display of the results, but just in case
    return cgi.escape(s, quote = True)