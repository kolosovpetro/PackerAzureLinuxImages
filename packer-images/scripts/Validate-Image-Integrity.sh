#!/bin/bash

# Function to check disk space
check_disk_space() {
  echo "Checking disk space..."
  THRESHOLD=90
  DISK_USAGE=$(df / | tail -1 | awk '{print $5}' | sed 's/%//')
  if [ "$DISK_USAGE" -gt "$THRESHOLD" ]; then
    echo "Warning: Disk space is over $THRESHOLD% usage ($DISK_USAGE%). Please clean up unnecessary files."
    return 1
  else
    echo "Disk space is under control ($DISK_USAGE%)."
    return 0
  fi
}

# Function to check for broken packages
check_broken_packages() {
  echo "Checking for broken packages..."
  BROKEN_PACKAGES=$(dpkg --audit)
  if [ -n "$BROKEN_PACKAGES" ]; then
    echo "Found broken packages. Attempting to fix..."
    sudo apt-get install -f -y
    if [ $? -eq 0 ]; then
      echo "Broken packages fixed successfully."
    else
      echo "Failed to fix broken packages."
      return 1
    fi
  else
    echo "No broken packages found."
  fi
}

# Function to check and fix filesystem
check_filesystem() {
  echo "Checking filesystem..."
  sudo fsck -Af -M
  if [ $? -eq 0 ]; then
    echo "Filesystem check passed."
  else
    echo "Filesystem check failed. Please investigate the issue."
    return 1
  fi
}

# Run all checks
echo "Running integrity checks..."

check_disk_space
if [ $? -ne 0 ]; then
  echo "Disk space issue detected. Please resolve before proceeding."
  exit 1
fi

check_broken_packages
if [ $? -ne 0 ]; then
  echo "Broken packages issue detected. Please resolve before proceeding."
  exit 1
fi

check_filesystem
if [ $? -ne 0 ]; then
  echo "Filesystem issue detected. Please resolve before proceeding."
  exit 1
fi

echo "Integrity checks completed successfully. Ready to run Sysprep."
