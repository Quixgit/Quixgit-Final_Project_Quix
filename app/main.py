from http.server import BaseHTTPRequestHandler, HTTPServer
import socket

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == '/':
            hostname = socket.gethostname()
            ip = socket.gethostbyname(hostname)
            message = f"""
                <html>
                    <head><title>It works!</title></head>
                    <body>
                        <h1>I'am Quix 🎉</h1>
                        <p>IP pod: {ip}</p>
                    </body>
                </html>
            """.encode('utf-8')

            self.send_response(200)
            self.send_header('Content-type', 'text/html; charset=utf-8')
            self.end_headers()
            self.wfile.write(message)
        else:
            self.send_response(404)
            self.end_headers()

if __name__ == '__main__':
    server = HTTPServer(('', 8080), Handler)
    print("Server running on port 8080...")
    server.serve_forever()
