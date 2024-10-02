#!/bin/zsh

PATH=$1
TOKEN=$2

/bin/mkdir -p "$PWD/results"

/usr/local/bin/docker run -v $PATH:/path zricethezav/gitleaks:latest detect --source="/path" --verbose --report-format json >> results/gitleaks.txt

/usr/local/bin/docker run -v $PATH:/src -v $PWD/results:/report owasp/dependency-check:latest --scan /src --format "ALL" --out /report

/usr/local/bin/docker run -e SEMGREP_APP_TOKEN=$TOKEN --rm -v $PATH:/src -v $PWD/results:/report semgrep/semgrep semgrep scan --text --text-output=/report/semgrep.txt
