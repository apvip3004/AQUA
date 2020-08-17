#ifndef WATERPUMP_H
#define WATERPUMP_H

#include <QObject>
#include <QDebug>
#include <QTime>

#include "models/settings/settings.h"
#include "deviceoutput.h"

class WaterPump : public DeviceOutput
{
    Q_OBJECT

    Q_PROPERTY(int timeSec READ get_timeSec WRITE set_timeSec NOTIFY timeSecChanged)
    Q_PROPERTY(QTime cycle READ get_cycle WRITE set_cycle NOTIFY cycleChanged)

public:
    explicit WaterPump(QObject *parent = nullptr);

    Q_INVOKABLE int get_timeSec() {  return _timeSec; }
    void set_timeSec(int);


    Q_INVOKABLE QTime get_cycle() {  return _cycle; }
    void set_cycle(QTime);

    Q_INVOKABLE bool check_init_settings();
    Q_INVOKABLE void save_init_settings();
    Q_INVOKABLE void update_init_values();

signals:

    void timeSecChanged(int);
    void cycleChanged(QTime);

private:

    int _timeSec;
    QTime _cycle;

};


#endif // WATERPUMP_H
