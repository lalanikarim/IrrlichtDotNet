TEMPLATE = lib
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt
TARGET = IrrlichtDotNet
SOURCES += main.cpp \
           irrlicht_wrap.cxx


unix:!macx: LIBS += -L/usr/lib/ -lIrrlicht

INCLUDEPATH += /usr/include/irrlicht
DEPENDPATH += /usr/include/irrlicht

QMAKE_CXXFLAGS += -fPIC

OTHER_FILES += \
    irrlicht.i

HEADERS += \
    vector2du32_proxy.h \
    vector3du32_proxy.h \
    SWIGIEventReceiver.h \
    irrlicht_wrap.h
