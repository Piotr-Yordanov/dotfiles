#!/bin/bash
age=$(task rc.verbose: rc.report.active.columns:start.age rc.report.active.labels:1 limit:1 active)
description=$(task rc.verbose: rc.report.active.columns:description rc.report.active.labels:1 limit:1 active)
# echo "$age" -- "$description"
if [ -n "$age" ]; then
    echo "$age" \| "$description"
else
    echo ""
fi
