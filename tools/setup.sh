#!/bin/bash
set -e

# Make the virtualenv only if the folder doesn't exist
DIR=.env
if [ ! -d "${DIR}" ]; then
  echo "Installing root virtualenv (.env)"
  pip install virtualenv --upgrade
  # The first syntax is for CI (travis) and the OR is for MacOS catalina
  python -m virtualenv -p python3 .env || virtualenv -p python3 .env
fi

# Use root env
. .env/bin/activate
echo "Installing/updating requirements..."
pip install -e .
pip install -r requirements.txt