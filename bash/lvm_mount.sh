#!/bin/bash

lvcreate -n swap -L 8G vg-ubuntu18.04
lvcreate -n root -L 10G vg-ubuntu18.04
lvcreate -n usr -L 12G vg-ubuntu18.04
lvcreate -n home -L 70G vg-ubuntu18.04
lvcreate -n home -L +100%FREE vg-ubuntu18.04
lvcreate -n home -l +100%FREE vg-ubuntu18.04
