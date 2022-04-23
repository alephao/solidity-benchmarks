#!/usr/bin/env bash
cd templates
find . -name '*.gyb' |                                                               \
    while read file; do                                                              \
        ../scripts/gyb.py --line-directive '' -o "../src/test/${file%.gyb}" "$file"; \
    done
cd --