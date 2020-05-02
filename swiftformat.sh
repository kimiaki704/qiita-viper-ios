#!/bin/bash
git diff --diff-filter=d --name-only | grep -e '\(.*\).swift$' | while read line; do
  mint run nicklockwood/SwiftFormat swiftformat ${line} --self remove --commas always --trimwhitespace always --patternlet inline --disable strongOutlets,trailingClosures,unusedArguments;
done
