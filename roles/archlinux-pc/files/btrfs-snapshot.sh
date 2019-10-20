#!/usr/bin/env bash
set -euo pipefail

# These should be extracted to an EnvironmentFile, but there is no pressing need
device=/dev/mapper/cryptroot
remount_dir=/mnt/snapshots
subvolumes=(root home)
keep_last=5

mkdir -p "$remount_dir"
mount "$device" "$remount_dir"

cleanup() {
  umount "$remount_dir"
}

trap cleanup EXIT

for subvolume in "${subvolumes[@]}"; do
  snapshots_dir="${remount_dir}/snapshots/${subvolume}"
  mkdir -p "$snapshots_dir"
  btrfs subvolume snapshot -r "${remount_dir}/${subvolume}" \
    "${snapshots_dir}/$(date --iso-8601=seconds --utc)"

  (
  cd "$snapshots_dir"
  # shellcheck disable=SC2012
  ls | head -n "-${keep_last}" | xargs -r -n1 btrfs subvolume delete
  )
done
