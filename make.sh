#!/bin/sh
echo "---Generating SWIG Wrappers---"
echo
swig -c++ -csharp -namespace Irrlicht -outdir generated -I/usr/include/irrlicht irrlicht.i

echo
echo "---Running qmake---"
echo

qmake IrrlichtDotNet.pro

echo
echo "---Running make---"
echo

make

echo
echo "---Deleting backup files---"
echo

rm generated/*.cs~

echo
echo "---Refreshing IrrlichtDotNet.csproj---"
echo

python build/update_csproj.py IrrlichtDotNet.csproj

echo
echo "---Done---"
echo
