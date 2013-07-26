IrrlichtDotNet
==============

Linux focused .Net bindings for Irrlicht Open Source 3d Graphics Engine.

Project dependencies
====================
1. Qt 5 - for qmake build environment and project management
2. SWIG 2.0
3. Mono 3.0
4. MonoDevelop v4.0.9

Instructons
===========
1. Load IrrlichtDotNet.pro project in QtCreator
2. Run qmake
3. Build
4. If no errors, you'll now have libirrlichtDotNet.so files as well as a bunch of C# files
5. Load IrrlichtDotNet.csproj project in MonoDevelop
6. Build
7. If no errors, you'll now have IrrlichtDotNet.dll which you can reference in your .Net projects

Notes
=====
Not all features of irrLicht will be available right out of the box.
Initially many generated C# classes for irrLicht types will not be usable.
Some generated C# files will also require manual modification before the IrrlichtDotNet project will compile.

I am hoping that will be resolved with community support.
