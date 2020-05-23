#!/bin/sh

echo running vnc
vncserver &

echo running libreoffice
DISPLAY=127.0.0.1:1 libreoffice --headless "--accept=socket,host=127.0.0.1,port=2002;urp;"  &

echo sleeping 20s
sleep 20

echo running rpc server
/rpc_server/ooffice_xmlrpc_server.py --bind 0.0.0.0 --port 1210
