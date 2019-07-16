QT += core
QT -= gui

CONFIG += c++11

TARGET = jsontest
CONFIG += console core
CONFIG -= app_bundle

TEMPLATE = app

SOURCES += main.cpp \
    mainwindow.cpp \
    writeplay.cpp \
    writestop.cpp \
    fileutil.cpp \
    readjson.cpp

HEADERS += mainwindow.h \
    writeplay.h \
    writestop.h \
    readjson.h  \
    fileutil.h


