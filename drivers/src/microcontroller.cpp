#include "drivers/inc/microcontroller.h"
#include <QDebug>

Microcontroller::Microcontroller(QObject* parent) :
    QObject(parent)
{

}

bool Microcontroller::sendCommandToDevice(QString command)
{
    qDebug() << "Set into device: " << command;
}

