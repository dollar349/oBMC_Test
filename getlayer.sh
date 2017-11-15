#!/bin/sh
BSPATH=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$ABSPATH")

# ===== openbmc LAYER =======================================================
echo "Getting private ETA openbmc layer"
# Get openbmc layer from our private fork, not upstream
if [ -d "meta-phosphor" ]; then
    echo "fatal: destination path 'openbmc' already exists and is not an empty directory."
else
    git clone https://github.com/openbmc/openbmc.git ${SCRIPTPATH}
fi

if [ -d "opebmc"]
