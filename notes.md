---
title: notes
date: 2022-08-16
author: Owen Rowe
---

## Goals

### Build DITA -> PDF

-   [x] DITA -> HTML
-   [x] HTML -> PDF
-   [ ] Plugin install
-   [ ] Project organisation scalable/maintainable
-   [ ] Multiple repos running the same build script

## Build HTML

```
docker run -it -v /Users/owenrowe/git/dita-demo-setup:/src ghcr.io/dita-ot/dita-ot:3.6.1  -p html.yaml -o out -f html5 -v
```

## Build PDF

```
docker run --rm -v /Users/owenrowe/git/dita-demo-setup/out:/src minidocks/weasyprint /src/document.html /src/success.pdf
```
