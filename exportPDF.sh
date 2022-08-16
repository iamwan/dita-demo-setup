#!/bin/sh

echo "Cleanup old files...\n\n"
docker stop dita_container > /dev/null 2>&1
docker rm dita_container -f > /dev/null 2>&1
docker rmi dita -f > /dev/null 2>&1

echo "\n\nBuildind the dita image...\n\n"

docker build --no-cache -t dita . 

echo "\n\nExporting HTML ...\n\n"
docker run --name dita_container -it -v /Users/owenrowe/git/dita-demo-setup:/src dita -p /src/html.yaml -o /src/out -f html5 -v && \
wait && \
docker exec -ti dita_container /bin/bash -c "cd /src/out && zip -r /src/out.zip ."

echo "\n\nExporting PDF ...\n\n"
docker run --rm -v /Users/owenrowe/git/dita-demo-setup/out:/src minidocks/weasyprint /src/out/document.html /src/out/success.pdf