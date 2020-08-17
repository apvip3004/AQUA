#ifndef DATETIMEWATCHER_H
#define DATETIMEWATCHER_H

#include <QObject>
#include <QDateTime>
#include <QTimer>

class DateTimeWatcher : public QObject
{
    Q_OBJECT
    // Zmienić w QString daty i czasu
    Q_PROPERTY(QDateTime dateTime READ get_dateTime WRITE set_dateTime NOTIFY dateTime_changed)

public:
    explicit DateTimeWatcher(QObject* parent = nullptr);

    QDateTime get_dateTime() { return _dateTime; }
    void set_dateTime(QDateTime);

    QDateTime _dateTime;

public slots:
private slots:
    void timer_check(void);

signals:

    void dateTime_changed(QDateTime);
//    void nextSecond(QDateTime datetime);

protected:

private:

    QTimer *_timer;
};

#endif // DATETIMEWATCHER_H
