timew export :year | jq -r '["id", "start", "end", "duration", "description", "project", "tag"], 
      (.[] | 
          # make sure .end is set (may be empty for currently active tracked time)
          .end = (.end // (now | strftime("%Y%m%dT%H%M%SZ"))) |
          .duration = ( (.end | strptime("%Y%m%dT%H%M%SZ") | mktime) - (.start | strptime("%Y%m%dT%H%M%SZ") | mktime) ) |
          # round duration to quarter hours
          [
              .id,
              # urks, localtimes are a mess in jq, ymmv - as long as it is consistent off I do not care tho
              (.start | strptime("%Y%m%dT%H%M%SZ") | mktime | todateiso8601), 
              (.end | strptime("%Y%m%dT%H%M%SZ") | mktime | todateiso8601), 
              (.duration | strftime("%T")),
              (.tags[0]),
              (.tags[1]),
              (.tags[2])
          ]
      ) |
      @csv' 

