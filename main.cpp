#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDateTime>
#include "workerclass.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    WorkerClass myWorker("ThreadWorker");
    engine.rootContext()->setContextProperty("currentDatetime", QDateTime::currentDateTime());
    engine.rootContext()->setContextProperty("worker",&myWorker);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}

