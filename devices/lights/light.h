#ifndef LIGHT_H
#define LIGHT_H

#include <QObject>
#include <QDebug>
#include <QDebug>
#include <QTime>

#include "models/settings/settings.h"
#include "deviceoutput.h"

class Light : public DeviceOutput
{
    Q_OBJECT

    Q_PROPERTY(QString startTime READ get_startTime WRITE set_startTime NOTIFY startTimeChanged)
    Q_PROPERTY(QString stopTime READ get_stopTime WRITE set_stopTime NOTIFY stopTimeChanged)
    Q_PROPERTY(bool modeTime READ get_modeTime WRITE set_modeTime NOTIFY modeTimeChanged)

    Q_PROPERTY(int automation READ get_automation WRITE set_automation NOTIFY automationChanged)
    Q_PROPERTY(int pwm READ get_pwm WRITE set_pwm NOTIFY pwmChanged)
    Q_PROPERTY(int softStart READ get_softStart WRITE set_softStart NOTIFY softStartChanged)

    Q_PROPERTY(QString startTime_init READ get_startTime_init CONSTANT)
    Q_PROPERTY(QString stopTime_init READ get_stopTime_init CONSTANT)

public:
    explicit Light(QObject *parent = nullptr);

    Q_INVOKABLE QString get_startTime() { return _startTime; }
    void set_startTime(QString);
    QString get_startTime_init() { return _startTime_init; }
    Q_INVOKABLE void inc_startTime(int);
    Q_INVOKABLE void dec_startTime(int);

    Q_INVOKABLE QString get_stopTime() { return _stopTime; }
    void set_stopTime(QString);
    QString get_stopTime_init() { return _stopTime_init; }
    Q_INVOKABLE void inc_stopTime(int);
    Q_INVOKABLE void dec_stopTime(int);

    Q_INVOKABLE bool get_modeTime() {  return _modeTime; }
    void set_modeTime(bool);


    Q_INVOKABLE int get_automation() {  return _automation; }
    void set_automation(int);

    Q_INVOKABLE int get_pwm() {  return _pwm; }
    void set_pwm(int);

    Q_INVOKABLE int get_softStart() { return _softStart; }
    void set_softStart(int);

    Q_INVOKABLE int get_next_sec(QTime);
    Q_INVOKABLE void reset();

    Q_INVOKABLE bool check_init_settings();
    Q_INVOKABLE void save_init_settings();
    Q_INVOKABLE void update_init_values();

    QString _startTime;
    QString _stopTime;
    bool _modeTime;
    int _automation;
    int _pwm;
    int _softStart;

    QString _startTime_init;
    QString _stopTime_init;

signals:
    void startTimeChanged(QString);
    void stopTimeChanged(QString);
    void modeTimeChanged(bool);
    void automationChanged(int);
    void pwmChanged(int);
    void softStartChanged(int);
};

#endif // LIGHT_H
