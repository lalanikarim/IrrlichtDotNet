import sys
import re
import os

MARK = '~~~MARK~~~'

with open(sys.argv[1]) as fp:
	csproj = fp.read()

assert csproj

csproj = re.sub(r'\s+<ItemGroup>\s*<Compile(.|\s)*</ItemGroup>', '\n  <ItemGroup>\n%(MARK)s\n  </ItemGroup>' % locals(), csproj, re.MULTILINE)
generated_includes = []

for file in os.listdir('generated'):
	if file not in ['.', '..','README']:
		generated_includes.append('    <Compile Include="generated\%(file)s" />' % locals())

csproj = csproj.replace(MARK, '\n'.join(generated_includes))
with open(sys.argv[1], 'w+') as fp:
	fp.write(csproj)
