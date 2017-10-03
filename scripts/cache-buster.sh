#!/usr/bin/env bash

## Generate list of site links..
#MYSITE='https://www.wnews.org.au';wget -nv -r --spider $MYSITE 2>&1 | egrep ' URL:' | awk '{print $3}' | sed "s@URL:${MYSITE}@@g"

LINKS='/index.html /robots.txt /wildlife.html /recipes.html /gardening.html /about.html /contact.html /trades-and-services.html /waranga-tourism.html /robots.txt /articles.html/0-6?p=1 /articles.html/6-12?p=2 /articles.html/12-18?p=3 /articles.html/18-24?p=4 /articles.html/24-30?p=5 /articles.html/30-36?p=6 /articles.html/36-42?p=7 /articles.html/42-48?p=8 /articles.html/48-54?p=9 /articles.html/54-60?p=10 /articles.html/60-66?p=11 /articles.html/66-72?p=12 /articles.html/72-78?p=13 /articles.html/78-81?p=14 /past-issues.html/12?p=1 /past-issues.html/0-12?p=1 /past-issues.html/12-24?p=2 /past-issues.html/24-36?p=3 /past-issues.html/36-48?p=4 /past-issues.html/48-60?p=5 /past-issues.html/60-72?p=6 /past-issues.html/72-84?p=7 /past-issues.html/84-87?p=8'

for LINK in $LINKS
do
    printf "Cache busting: $LINK\n"
    curl -LsS https://wnews.org.au$LINK --cookie "nocache=true" > /dev/null
done
