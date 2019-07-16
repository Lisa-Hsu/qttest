
#include <QObject>
#include <QTimer>
#include <QMutex>
#include <QDateTime>
#include <QJsonObject>
#include <QDebug>
#include <QThread>


class MainWindow : public QObject
{
    Q_OBJECT

public:
    static MainWindow* _instance;
    static MainWindow* getInstance();
    ~MainWindow();
    void saveIpodPlaybackasjson(const QString& state);
    void testWriteStop();
    void testWritePlay();
    int getMaxTime();

    void writeStoptojson();
    void writePlaytojson();

public slots:
    void slotquit();

signals:
    void sigquit();


protected:
    /*explicit*/ MainWindow(QObject *_parent = 0);
    bool load_ipodstatus_from_json(QJsonObject& ipodobj);
    void save_ipodstatus_to_json(QJsonObject& ipodobj);

private:
    QMutex json_mutex;
    QJsonObject json;
    QJsonObject ipodobj;
    QThread* thread;
    int threadcount = 0;
    int MAX_TIME = 10;

};
