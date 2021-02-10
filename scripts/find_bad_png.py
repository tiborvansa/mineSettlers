#!/usr/bin/env python3

# Strip color profiles of size 3144 from PNGs
# Needs GraphicsMagick

top = "/home/tibor/.minetest/games/mineSettlers/"

import os, subprocess
from os.path import join

for root, dirs, files in os.walk(top):
	for n in files:
		if ".png" in n:
			f = join(root, n)
			cmd = ['gm', 'identify', '-verbose', f]
			r = subprocess.check_output(cmd).decode("utf-8")
			for x in r.splitlines():
				if 'Profile-color: 3144 bytes' in x:
					print(f)
					print(x)
