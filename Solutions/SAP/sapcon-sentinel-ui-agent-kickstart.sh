#!/bin/bash
for folder in */ ; do
  if [ -f "$folder/systemconfig.ini" ]; then
    sysnr=$(grep 'sysnr' "$folder/systemconfig.ini" | cut -d '=' -f 2 | tr -d ' ')
    ashost=$(grep 'ashost' "$folder/systemconfig.ini" | cut -d '=' -f 2 | tr -d ' ')
    sysid=$(grep 'sysid' "$folder/systemconfig.ini" | cut -d '=' -f 2 | tr -d ' ')    
    mshost=$(grep 'mshost' "$folder/systemconfig.ini" | cut -d '=' -f 2 | tr -d ' ')
    echo "mshost = $mshost"
    echo "sysnr = $sysnr"
    echo "ashost = $ashost"
    echo "sysid = $sysid"
    echo "****"
  fi
done
