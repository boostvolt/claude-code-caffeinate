#!/bin/bash
# Reset 5-min caffeinate timer on each trigger
pkill -x caffeinate 2>/dev/null
caffeinate -d -i -s -t 300 &
exit 0
