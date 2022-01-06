# System Crafters Guix Live Image

This repository runs _automated CI builds_ to produce a
[GNU Guix](https://guix.gnu.org) live image based on the official
live VM configuration.

You may take a look at the [image configuration](./config.scm) and the
[build workflow](./.github/workflows/build.yaml) to be sure that we aren't adding
anything malicious to these builds!

**A new `.qcow2` image is produced at least once a week, sometimes more often if
we're making improvements to the configuration.**

## Table of Contents
- [System Crafters Guix Installer](#system-crafters-guix-live-image)
  - [Instructions](#instructions)
  - [Learn More About Guix](#learn-more-about-guix)
  - [License](#license)

## Instructions

1. Download a recently built `.qcow2.gz` from this repo's
   [release page](https://github.com/SystemCrafters/guix-live-image/releases)
2. Decompress the `.gz` file you downloaded (update `guix-image-*` path if needed):

```
gzip -d guix-image-*.qcow2.gz > guix-live.qcow2
```

3. Launch the image in QEMU (update the image path in the last line!):

```
qemu-system-x86_64 \
  -nic user,model=virtio-net-pci \
  -enable-kvm -m 2048 \
  -device virtio-blk,drive=guix-live \
  -drive if=none,file=$HOME/Downloads/guix-live.qcow2,id=guix-demo
```

## Learn More About Guix!

If you'd like to learn more about using GNU Guix, check out the series I
produced on YouTube called [Craft Your System with GNU
Guix](https://www.youtube.com/watch?v=iBaqOK75cho&list=PLEoMzSkcN8oNxnj7jm5V2ZcGc52002pQU)!

You can find the same content in written form on the [System Crafters website](https://systemcrafters.net/craft-your-system-with-guix/).

You should also consult the [GNU Guix Reference
Manual](https://guix.gnu.org/manual/en/guix.html) for a more complete reference
to all the features of Guix.

## License

The code in this repository is licensed under the
[GNU General Public License v3](./LICENSE.txt).
