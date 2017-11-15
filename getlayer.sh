#!/bin/sh
ABSPATH=$(readlink -f "$0")
PRJPATH=$(dirname "$ABSPATH")

OPENBMC_PRJNAME="openbmc"
VERTIV_PLATFORM_LAYER="meta-obmc-vertiv-platform"
OBMC_SOURCE_URI="https://github.com/openbmc/openbmc.git"
VERTIV_PLATFORM_URI="https://github.com/dollar349/meta-oBMC_example.git"

if [ -z "$MY_FILESERVER" ]; then
    MY_FILESERVER="http://sun-aess.int.vertivco.com"
fi

# ===== openbmc LAYER =======================================================
echo "Getting private ETA openbmc layer"
# Get openbmc layer from our private fork, not upstream
if [ -d "${PRJPATH}/${OPENBMC_PRJNAME}" ]; then
    echo "fatal: destination path 'openbmc' already exists and is not an empty directory."
else
    git clone ${OBMC_SOURCE_URI} ${PRJPATH}/${OPENBMC_PRJNAME}
fi

# ===== Vertiv Platform LAYER =======================================================
echo "Getting private ETA meta-obmc-vertiv-platform layer"
# Get meta-obmc-vertiv-platform layer from our private fork, not upstream
if [ -d "${PRJPATH}/${OPENBMC_PRJNAME}/meta-openbmc-machines/${VERTIV_PLATFORM_LAYER}" ]; then
    echo "fatal: destination path '${VERTIV_PLATFORM_LAYER}' already exists and is not an empty directory."
else
    git clone ${VERTIV_PLATFORM_URI} ${PRJPATH}/${OPENBMC_PRJNAME}/meta-openbmc-machines/${VERTIV_PLATFORM_LAYER}
fi

