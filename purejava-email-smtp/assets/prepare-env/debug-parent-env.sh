# hack to show parent environment in chrome developer console (only works with "courseData" field)
ssh root@host01 <<EOF
sleep 10
set -x
id
pwd
ls -Al /home/scrapbook/*
ls -Al /home/katacoda/*
hostname
ifconfig
EOF
