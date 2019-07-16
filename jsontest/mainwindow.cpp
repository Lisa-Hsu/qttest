#include "mainwindow.h"
#include "readjson.h"

//#define STATE_FILE_IPOD_AUDIO "/var/run/media/ipod.json"
#define STATE_FILE_IPOD_AUDIO "/tmp/ipod.json"


MainWindow* MainWindow::_instance = NULL;
MainWindow* MainWindow::getInstance()
{
    if (_instance == NULL) {
        _instance = new MainWindow();
    }
    return _instance;
}

MainWindow::MainWindow(QObject *_parent) :
    QObject(_parent)
{
    load_ipodstatus_from_json(ipodobj);
}

MainWindow::~MainWindow()
{

}

bool MainWindow::load_ipodstatus_from_json(QJsonObject &obj)
{
    bool ret = ReadJson::loadFile(STATE_FILE_IPOD_AUDIO, json);

    if (ret) {
        obj = json;
    } else {
        qWarning() << "read json status failed:" << STATE_FILE_IPOD_AUDIO;
    }
    return ret;
}

void MainWindow::save_ipodstatus_to_json(QJsonObject &obj)
{
    json_mutex.lock();
    qint64 t = QDateTime::currentMSecsSinceEpoch();
    obj["msecsSinceEpoch"] = t;
    json = obj;

    ReadJson::saveFile(STATE_FILE_IPOD_AUDIO, json);
    json_mutex.unlock();
}

void MainWindow::saveIpodPlaybackasjson(const QString &state)
{
    ipodobj["state"]=state;

    save_ipodstatus_to_json(ipodobj);
}

void MainWindow::writePlaytojson()
{
    qDebug()<<"write play to json";
    saveIpodPlaybackasjson("play");
}

void MainWindow::writeStoptojson()
{
    qDebug()<<"write stop to json";
    saveIpodPlaybackasjson("stop");
}

int MainWindow::getMaxTime()
{
    return MAX_TIME;
}

void MainWindow::slotquit()
{
    threadcount++;
    if(threadcount == 2)
        emit sigquit();
}

