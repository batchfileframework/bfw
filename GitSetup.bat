@echo off

:GitSetup
git config --global http.proxy http://127.0.0.1:9000
git config --global user.name "mygithubusername"
git config --global user.email mygithub@emailaddress.com
GoTo :EOF
