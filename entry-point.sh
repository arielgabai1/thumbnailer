#!/bin/sh

# Set classpath to include application parts and dependencies
CP="/app/thumbnailer.jar:/app/lib/*"

if [ $# -eq 0 ]; then
    set -- *
fi

# Run the application
java -cp "${CP}" -Dthumbnail.size="${TN_SIZE}" com.develeap.thumbnailer.Main "$@"