#!/bin/sh

[ -e /dev/rfkill ] &&
  rfkill -rno device,soft | grep phy0 | cut -d' ' -f2 | grep -vq unblocked

