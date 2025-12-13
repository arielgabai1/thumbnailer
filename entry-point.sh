#!/bin/sh
CP="/app/thumbnailer.jar:/app/lib/*"

if [ $# -eq 0 ]; then
    set -- *
fi

java -cp "${CP}" -Dthumbnail.size="${TN_SIZE}" com.develeap.thumbnailer.Main "$@"