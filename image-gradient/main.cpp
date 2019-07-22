#include <QGuiApplication>
//#include <QQmlApplicationEngine>
#include <QResource>
#include <QQuickView>
#include <QQmlContext>

#include "test.h"

int main(int argc, char *argv[])
{
    Q_INIT_RESOURCE(qml);
    QResource::registerResource("qml.rcc");
    QGuiApplication app(argc, argv);
    QQuickView *view = new QQuickView;

//    Test test;
//    view->rootContext()->setContextProperty("test",&test);
    view->setSource(QUrl(QStringLiteral("qrc:/main.qml")));
    view->show();
    return app.exec();
}
