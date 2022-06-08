#!/bin/bash
home=`pwd`
cd /home/kof/irozhlas-scraper-geneea-output/xml/
types=(organization person location general);
  for ii in ${types[*]};
  do
    for i in `find -iname "*.xml" -newermt $(date +%Y-%m-%d -d '1 week ago') -type f -print`;
    do cat $i | grep Entity | grep $ii | awk -F'[<>]' '{print $3}' ;
    done | sort | uniq -c | sort -nr > /tmp/$ii.txt;
  done

cd $home
pp
