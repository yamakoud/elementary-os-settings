
# Fix xkeysnail compatibility with Python 3.12+ (evdev .fn attribute removed)
path = '/usr/local/lib/python3.12/dist-packages/xkeysnail/input.py'
with open(path, 'r') as f:
    content = f.read()

# Replace .fn with .path
content = content.replace('.fn', '.path')
# Replace format string usage
content = content.replace('{1.fn', '{1.path')

with open(path, 'w') as f:
    f.write(content)

print('Applied fix to xkeysnail/input.py')

