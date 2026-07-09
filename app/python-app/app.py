from http.server import HTTPServer, BaseHTTPRequestHandler
import os

MESSAGE = os.getenv("APP_MESSAGE", "Default Message")

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(MESSAGE.encode())

HTTPServer(("0.0.0.0", 5000), Handler).serve_forever()
