# Use the latest DITA-OT image ↓ as parent:
FROM ghcr.io/dita-ot/dita-ot:3.7.2

RUN dita --install \
        https://github.com/jason-fox/fox.jason.extend.css/archive/master.zip
        
# Install a custom plug-in from a remote location:
RUN dita --install \
        https://github.com/infotexture/dita-bootstrap/archive/master.zip

# Install from the registry at dita-ot.org/plugins:
# RUN dita --install org.dita-community.pdf-page-break