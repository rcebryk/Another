#include "workerclass.h"
#include <QDebug>

WorkerClass::WorkerClass(QString name, QObject *parent)
    : QObject(parent)
    , name(name)
{
    qDebug() << "Worker created: " << name;
}

QString WorkerClass::getName()
{
    return name;
}

