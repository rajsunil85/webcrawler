#!/bin/bash
# Script to crawl a website and list the site map of the website
# Author: Sunil Nagaraja
# Date: 25/September/2016

# Prompt the user to enter the URL
read -p "Please enter the URL you wish to crawl in the format http://www.example.com : " URL

# Display message to user crawling the URL can take few minutes
echo "Crawling $URL can take a few minutes depending on the size of the site"

rm -rf temp/

# Create a temporary directory to create and collect all files
mkdir temp

cd temp/

# Mirror the site and process output to print only the sitemap to a text file
wget -m $URL 2>&1 | grep '^--' | awk '{ print $3 }'  > sitemap.txt

# Print the collected sitemap to screen
cat -n sitemap.txt
