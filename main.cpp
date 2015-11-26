#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDateTime>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("currentDatetime", QDateTime::currentDateTime());
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

