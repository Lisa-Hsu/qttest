#include "writestop.h"
#include "mainwindow.h"
#include <QThread>

WriteStop::WriteStop()
{

}

void WriteStop::run()
{
    while(time < MainWindow::getInstance()->getMaxTime()){
        MainWindow::getInstance()->writeStoptojson();
        qDebug()<<"WriteStop...."<<time;

        QThread::msleep(300);
        time++;
    }
    emit sigfinish();
}

void WriteStop::stop()
{
    need_stop = true;
}
