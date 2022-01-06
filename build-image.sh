#!/bin/sh

# -----------------------------------------------------------------------------
# Utilities
# -----------------------------------------------------------------------------

die() {
    # **
    # Prints a message to stderr & exits script with non-successful code "1"
    # *

    printf '%s\n' "$@" >&2
    exit 1
}

# -----------------------------------------------------------------------------
# Main
# -----------------------------------------------------------------------------

# Build the image
printf 'Attempting to build the image...\n\n'
image=$(guix system image -t qcow2 --volatile 'config.scm') \
    || die 'Could not create image.'

release_tag=$(date +"%Y%m%d%H%M")
target_file=./guix-live-${release_tag}.qcow2

cp "${image}" "${target_file}"  ||
    die 'An error occurred while copying.'

# Make sure the image is writable for local testing
chmod +w $target_file

printf 'Image was succesfully built: %s\n' "${image}"

# cleanup
unset -f die
unset -v image release_tag
