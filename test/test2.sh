#!/bin/bash

PORT=8080
DOCUMENT_ROOT="/path/to/your/html/files"

while true; do
  (echo -ne "HTTP/1.1 200 OK\r\n";
   echo -ne "Content-Length: $(wc -c < "$DOCUMENT_ROOT/index.html")\r\n";
   echo -ne "Content-Type: text/html\r\n\r\n";
   cat "$DOCUMENT_ROOT/index.html") | nc -l -p $PORT -q 1
done
