from http.server import BaseHTTPRequestHandler, HTTPServer

class SimpleHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.end_headers()
            self.wfile.write(b"OK")

server = HTTPServer(("", 8080), SimpleHandler)
print("Listening on port 8080...")
server.serve_forever()
