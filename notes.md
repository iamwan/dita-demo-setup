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
docker run --rm -it -v `pwd`:/src ghcr.io/dita-ot/dita-ot:3.6.1  -p /src/resources/html.yaml -o /src/out -f html5 -v
```

## Build PDF

```
docker run --rm -v `pwd`:/src minidocks/weasyprint /src/out/document.html /src/out/success.pdf
```
