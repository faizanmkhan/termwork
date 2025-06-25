#!/bin/bash

(sed -i '/export PATH=/d' ~/.zshrc; \
sed -i '/alias ls=/d' ~/.zshrc; \
sed -i '/alias cd=/d' ~/.zshrc; \
sed -i '/alias cat=/d' ~/.zshrc; \
sed -i '/alias vim=/d' ~/.zshrc; \
sed -i '/alias nano=/d' ~/.zshrc; \
sed -i '/alias python=/d' ~/.zshrc; \
echo 'export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"' >> ~/.zshrc)




















