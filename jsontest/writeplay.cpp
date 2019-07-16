#include "writeplay.h"
#include "mainwindow.h"
#include <QThread>

WritePlay::WritePlay()
{

}

void WritePlay::run()
{
    while(time < MainWindow::getInstance()->getMaxTime()){
        MainWindow::getInstance()->writePlaytojson();
        qDebug()<<"WritePlay...."<<time;
        QThread::msleep(400);

        time++;
    }
    emit sigfinish();
}

void WritePlay::stop()
{
    need_stop = true;
}
