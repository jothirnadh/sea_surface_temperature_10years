import struct

cmin = 15

cmax = 255

colors = '#fff7ec,#fee8c8,#fdd49e,#fdbb84,#fc8d59,#ef6548,#d7301f,#b30000,#7f0000,#ffffff'

ccodes = [c.replace('#', '') for c in colors.split(',')]

rgbs = [struct.unpack('BBB',c.decode('hex')) for c in ccodes]

for i, rgb in enumerate(rgbs):
    r, g, b = rgb
    print cmin + (cmax - cmin) / float(len(ccodes)) * i, r, g, b
