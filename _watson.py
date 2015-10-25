from __future__ import print_function

import watson


watson = watson.Watson()

print(watson.current['project'].strip())
print('|'.join(watson.current['tags']))
print(watson.current['start'].humanize())
