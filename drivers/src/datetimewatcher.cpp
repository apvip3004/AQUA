#include <QtDebug>

#include "drivers/inc/datetimewatcher.h"

DateTimeWatcher::DateTimeWatcher(QObject* parent) :
    QObject(parent),
    _dateTime()
{

    _timer = new QTimer(this);

    QObject::connect(_timer, &QTimer::timeout, this, &DateTimeWatcher::timer_check);

    _timer->setInterval(500);
    _timer->start();

}

void DateTimeWatcher::set_dateTime(QDateTime dt)
{
    if (dt != _dateTime) {
        _dateTime = dt;
        emit dateTime_changed(dt);
    }
}

void DateTimeWatcher::timer_check(void) {

    static unsigned int seconds;

    if(seconds != static_cast<unsigned int>(_dateTime.currentDateTime().toString("ss").toInt()))
    {
//        qDebug() << "Jest sekunda: " << QString::number(seconds) ;
//        qDebug() << "Data: " <<  _dateTime.currentDateTime().toString("dd.MM.yyyy hh:mm:ss");
        // Wyślij sygnał z obiektu, data została zmieniona. Sygnał można odebrać w qml w System,
        // tam gdzie stworzono jego obiekt
        QDateTime dt = QDateTime::currentDateTime();
//        emit nextSecond(dt);
        set_dateTime(dt);
    }
    seconds = static_cast<unsigned int>(QDateTime::currentDateTime().toString("ss").toInt());
}

