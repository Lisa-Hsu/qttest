#ifndef TEST_H
#define TEST_H
#include <QQuickView>


class Test : public QObject{
    Q_OBJECT

    Q_PROPERTY(int index READ getindex NOTIFY indexChanged)


public:
    Test();
    ~Test();

    int getindex() const
    {
        return m_index;
    }

    Q_INVOKABLE void setfunction(int i);

signals:
    void indexChanged();

private:
    int  m_index;


};

#endif // TEST_H
