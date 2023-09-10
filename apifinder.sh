#!/bin/bash

#color
Red="\033[91m"
White="\033[37m"

echo -e -n $Red;figlet "APIKEYFINDER"
echo -e "Made by @imancybersecurity"

# Define the regex patterns for API keys
echo -e $White ""
patterns=(
'(?:\s|=|:|"|^)AKC[a-zA-Z0-9]{10,}'
'(?:\s|=|:|"|^)AP[\dABCDEF][a-zA-Z0-9]{8,}'
'basic [a-zA-Z0-9_\\-:\\.=]+'
'bearer [a-zA-Z0-9_\\-\\.=]+'
'(A3T[A-Z0-9]|AKIA|AGPA|AIDA|AROA|AIPA|ANPA|ANVA|ASIA)[A-Z0-9]{16}'
'amzn\.mws\.[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}'
"(?i)aws(.{0,20})?(?-i)['\"][0-9a-zA-Z\/+]{40}['\"]"
"(?:[A-Z2-7]{8})*(?:[A-Z2-7]{2}={6}|[A-Z2-7]{4}={4}|[A-Z2-7]{5}={3}|[A-Z2-7]{7}=)?"
"(eyJ|YTo|Tzo|PD[89]|aHR0cHM6L|aHR0cDo|rO0)[a-zA-Z0-9+/]+={0,2}"
"(?<=:\/\/)[a-zA-Z0-9]+:[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
"cloudinary:\/\/[0-9]{15}:[0-9A-Za-z]+@[a-z]+"
"EAACEdEose0cBA[0-9A-Za-z]+"
"(?i)(facebook|fb)(.{0,20})?['\"][0-9]{13,17}"
"[f|F][a|A][c|C][e|E][b|B][o|O][o|O][k|K].*['|\"][0-9a-f]{32}['|\"]"
"(?i)(facebook|fb)(.{0,20})?(?-i)['\"][0-9a-f]{32}"
"(?i)github(.{0,20})?(?-i)['\"][0-9a-zA-Z]{35,40}"
"AIza[0-9A-Za-z\\-_]{35}"
"(?i)(google|gcp|youtube|drive|yt)(.{0,20})?['\"][AIza[0-9a-z\\-_]{35}]['\"]"
"[0-9]+-[0-9A-Za-z_]{32}\.apps\.googleusercontent\.com"
"[h|H][e|E][r|R][o|O][k|K][u|U].{0,30}[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12}"
"(?i)linkedin(.{0,20})?['\"][0-9a-z]{16}['\"]"
"[0-9a-f]{32}-us[0-9]{1,2}"
"key-[0-9a-zA-Z]{32}"
"sk_live_[0-9a-z]{32}"
"xox[baprs]-([0-9a-zA-Z]{10,48})?"
"https://hooks.slack.com/services/T[a-zA-Z0-9_]{8}/B[a-zA-Z0-9_]{8}/[a-zA-Z0-9_]{24}"
"(?:r|s)k_live_[0-9a-zA-Z]{24}"
"sqOatp-[0-9A-Za-z\\-_]{22}"
"sq0csp-[ 0-9A-Za-z\\-_]{43}"
"SK[0-9a-fA-F]{32}"
"[t|T][w|W][i|I][t|T][t|T][e|E][r|R].{0,30}['\"\\s][0-9a-zA-Z]{35,44}['\"\\s]"
"(?i)twitter(.{0,20})?['\"][0-9a-z]{35,44}"
)

# Loop through the patterns and search them in all JS files
for pattern in "${patterns[@]}"; do
    echo "Searching for pattern: $pattern"
    grep -r -E -o "$pattern" ./*.js 2>/dev/null
done

echo "Search complete."

