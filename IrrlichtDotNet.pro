TEMPLATE = lib
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt
TARGET = irrlichtDotNet
SOURCES += main.cpp \
           irrlicht_wrap.cxx \
    vector2du32_proxy.cpp


unix:!macx: LIBS += -L/usr/lib/ -lIrrlicht

INCLUDEPATH += /usr/include/irrlicht
DEPENDPATH += /usr/include/irrlicht

QMAKE_CXXFLAGS += -fPIC

OTHER_FILES += \
    irrlicht.i \
    rect.i \
    vector2d.i.unused

HEADERS += \
    vector2du32_proxy.h \
    vector3du32_proxy.h
