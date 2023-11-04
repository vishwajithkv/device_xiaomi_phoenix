#!/bin/bash
#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=phoenix
VENDOR=xiaomi

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}"/../../..

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
. "$HELPER"

SECTION=
KANG=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi
function blob_fixup() {
    case "${1}" in
    product/etc/permissions/vendor.qti.hardware.data.connection-V1.0-java.xml | product/etc/permissions/vendor.qti.hardware.data.connection-V1.1-java.xml )
        sed -i 's/xml version="2.0"/xml version="1.0"/' "${2}"
    ;;
    vendor/lib64/libgoodixhwfingerprint.so )
    "${PATCHELF}" --remove-needed "android.hidl.base@1.0.so" "${2}"
    ;;
    vendor/lib64/camera/components/com.qti.node.watermark.so)
    "${PATCHELF}" --add-needed "libpiex_shim.so" "${2}"
    ;;
    vendor/lib64/camera/components/com.qti.node.watermark.so)
    "${PATCHELF}" --add-needed "libwatermark_shim.so" "${2}"
    ;;
    vendor/bin/sensors.qti | vendor/bin/hw/android.hardware.drm@1.4-service.clearkey | vendor/lib/mediadrm/libwvdrmengine.so | vendor/lib64/libwvhidl.so | vendor/lib64/mediadrm/libwvdrmengine.so | vendor/lib64/libssc.so | vendor/lib64/libsnsdiaglog.so | vendor/lib64/libsnsapi.so | vendor/lib64/sensors.ssc.so | vendor/lib64/libgoodixhwfingerprint.so | vendor/lib64/mediacas/libwvdrmengine.so | vendor/lib64/libclearkeycasplugin.so | vendor/lib64/libsensorcal.so | vendor/lib/libgnss.so | vendor/lib64/libgnss.so)
    "${PATCHELF}" --replace-needed "libprotobuf-cpp-lite-3.9.1.so" "libprotobuf-cpp-full-3.9.1.so" "${2}"
    ;;
    esac
}

# Initialize the helper
setup_vendor "$DEVICE" "$VENDOR" "$ANDROID_ROOT" true "$CLEAN_VENDOR"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" \
        "${KANG}" --section "${SECTION}"

"${MY_DIR}/setup-makefiles.sh"
