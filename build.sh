#!/bin/sh

echo "Cleanup old files...\n\n"
docker stop dita_container > /dev/null 2>&1
docker rm dita_container -f > /dev/null 2>&1
docker rmi dita -f > /dev/null 2>&1

echo "\n\nBuilding the dita image...\n\n"

docker build --no-cache -t dita . 

echo "\n\nExporting HTML ...\n\n"
docker run --rm -it -v `pwd`:/src ghcr.io/dita-ot/dita-ot:3.6.1 --store-type=memory -p /src/resources/html.yaml -o /src/out -f html5 -v

wait 

echo "\n\nExporting PDF ...\n\n"
docker run --rm -v `pwd`:/src minidocks/weasyprint /src/out/document.html /src/out/success.pdf

#wait
# echo "\n\nOpening PDF..."
# ./out/success.pdf