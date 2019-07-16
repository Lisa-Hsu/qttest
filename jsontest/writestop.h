#ifndef WRITESTOP_H
#define WRITESTOP_H
#include <QThread>

class WriteStop :public QThread
{
    Q_OBJECT
public:
    WriteStop();
    ~WriteStop() { need_stop = true;}

    void run();
    void stop();

signals:
    void sigfinish();

private:
    bool need_stop = false;
    int time = 0;

};

#endif // WRITESTOP_H
