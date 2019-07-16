#ifndef WRITEPLAY_H
#define WRITEPLAY_H
#include <QThread>

class WritePlay :public QThread
{
    Q_OBJECT
public:
    WritePlay();
    ~WritePlay() { need_stop = true;}

    void run();
    void stop();

signals:
    void sigfinish();

private:
    bool need_stop = false;
    int time = 0;

};

#endif // WRITEPLAY_H
