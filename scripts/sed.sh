#!/usr/bin/env bash

set -e

for f in $(ls ./plugins)
do
  sed 's/{{//; s/}}//' "./plugins/${f}" > "./temp/plugins/${f}"
done
