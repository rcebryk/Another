#ifndef WORKERCLASS_H
#define WORKERCLASS_H

#include <QObject>

class WorkerClass : public QObject
{
    Q_OBJECT

    Q_PROPERTY(QString name READ getName CONSTANT)
public:
    explicit WorkerClass(QString name, QObject *parent = 0);

    QString getName();

signals:

public slots:

private:
    QString name;
};

#endif // WORKERCLASS_H
