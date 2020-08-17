#ifndef Pump_H
#define Pump_H

#include <QObject>
#include <QDebug>
#include <QTime>
#include <QTimer>
#include <QMap>
#include <QVariantHash>
#include <QList>

#include "models/settings/settings.h"
#include "deviceoutput.h"

//typedef QMap<int, QVariantHash> MapIntHash;
//Q_DECLARE_METATYPE(MapIntHash)

class Pump : public DeviceOutput
{
    Q_OBJECT

    Q_PROPERTY(QString workingTime READ get_workingTime WRITE set_workingTime NOTIFY workingTimeChanged)
    Q_PROPERTY(int timeSec READ get_timeSec WRITE set_timeSec NOTIFY timeSecChanged)
    Q_PROPERTY(int levelValue READ get_levelValue WRITE set_levelValue NOTIFY levelValueChanged)

    Q_PROPERTY(bool modeTime READ get_modeTime WRITE set_modeTime NOTIFY modeTimeChanged)

public:
    explicit Pump(QObject *parent = nullptr);

    Q_INVOKABLE QString get_workingTime() {  return _workingTime; }
    void set_workingTime(QString);

    Q_INVOKABLE int get_timeSec() {  return _timeSec; }
    void set_timeSec(int);

    Q_INVOKABLE int get_levelValue() {  return _levelValue; }
    void set_levelValue(int);


    Q_INVOKABLE bool get_modeTime() {  return _modeTime; }
    void set_modeTime(bool);

    Q_INVOKABLE int get_next_sec(QTime);
    Q_INVOKABLE void reset();

    Q_INVOKABLE bool check_init_settings();
    Q_INVOKABLE void save_init_settings();
    Q_INVOKABLE void update_init_values();

    // Working days
    QHash<QString, bool> week;
    Q_INVOKABLE bool getActiveDay(QString);
    Q_INVOKABLE bool getActiveDay(int);
    Q_INVOKABLE void set_active_day(QString, bool);

signals:

    void workingTimeChanged(QString);
    void timeSecChanged(int);
    void levelValueChanged(int);

    void modeTimeChanged(bool);

private slots:

    void working_finished();

private:

    void set_init_week();
    void update_init_week();
    void start_working();

    QString _workingTime;
    int _timeSec;
    int _levelValue;

    bool _modeTime;

    QTime _time_back;
    QTime _time_to;

    QTimer *_working_timer;
};


#endif // Pump_H
