#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "commandrunner.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/shell/Main.qml"_qs);
    CommandRunner commandRunner;
    engine.rootContext()->setContextProperty("commandRunner", &commandRunner);
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
