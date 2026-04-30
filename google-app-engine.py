import webapp2

# In-memory storage (resets on restart)
names = []

class AddHandler(webapp2.RequestHandler):
    def get(self):
        name = self.request.get('name')

        if name:
            names.append(name)
            self.redirect('/list')
        else:
            self.response.write("""
                <h2>Add Name</h2>
                <form action="/add" method="get">
                    <input type="text" name="name" placeholder="Enter name" required>
                    <input type="submit" value="Submit">
                </form>
            """)

class ListHandler(webapp2.RequestHandler):
    def get(self):
        self.response.write("<h2>Stored Names</h2><ul>")
        for n in names:
            self.response.write("<li>{}</li>".format(n))
        self.response.write("</ul><a href='/add'>Add more</a>")

class MainHandler(webapp2.RequestHandler):
    def get(self):
        self.redirect('/add')

app = webapp2.WSGIApplication([
    ('/', MainHandler),
    ('/add', AddHandler),
    ('/list', ListHandler)
], debug=True)