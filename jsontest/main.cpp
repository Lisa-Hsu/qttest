#include <QCoreApplication>

#include <QTimer>
#include <QThread>
#include "writeplay.h"
#include "writestop.h"
#include "mainwindow.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    WritePlay *play = new WritePlay();
    play->start();
    WriteStop *stop = new WriteStop();
    stop->start();

    MainWindow *gmain = MainWindow::getInstance();
    QObject::connect(play,SIGNAL(sigfinish()),MainWindow::getInstance(),SLOT(slotquit()),Qt::DirectConnection);
    QObject::connect(stop,SIGNAL(sigfinish()),MainWindow::getInstance(),SLOT(slotquit()),Qt::DirectConnection);
    QObject::connect(gmain,SIGNAL(sigquit()),&a,SLOT(quit()));


    return a.exec();
}
