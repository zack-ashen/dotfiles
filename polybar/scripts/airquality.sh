#!/bin/sh

TOKEN="144018ea4d9eef0ad0b7fbe229959229305f8b11"
CITY="usa/newyork/ps-274"

API="https://api.waqi.info/feed"

if [ -n "$CITY" ]; then
    aqi=$(curl -sf "$API/$CITY/?token=$TOKEN")
else
    location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        aqi=$(curl -sf "$API/geo:$location_lat;$location_lon/?token=$TOKEN")
    fi
fi

if [ -n "$aqi" ]; then
    if [ "$(echo "$aqi" | jq -r '.status')" = "ok" ]; then
        aqi=$(echo "$aqi" | jq '.data.aqi')

        if [ "$aqi" -lt 50 ]; then
            echo "%{F#050fa7b}%{F-} $aqi"
        elif [ "$aqi" -lt 100 ]; then
            echo "%{F#0ffde33}%{F-} $aqi"
        elif [ "$aqi" -lt 150 ]; then
            echo "%{F#0ff9933}%{F-} $aqi"
        elif [ "$aqi" -lt 200 ]; then
            echo "%{F#0cc0033}%{F-} $aqi"
        elif [ "$aqi" -lt 300 ]; then
            echo "%{F#0660099}%{F-} $aqi"
        else
            echo "%{F#07e0023}%{F-} $aqi"
        fi
    else
        echo "$aqi" | jq -r '.data'
    fi
fi
