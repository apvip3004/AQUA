#include "light.h"

Light::Light(QObject *parent) :
    DeviceOutput ()
{

}

void Light::reset()
{
//    set_sign(SettingsApp::Light);
//    set_idDev(_idDev);
//    set_name(_name);
//    set_status(Unrecognized);

//    set_startTime("00:00");
//    set_stopTime("00:00");
}

int Light::get_next_sec(QTime time)
{
    if(_automation) {

        if(QTime::fromString(_startTime) == QTime::fromString(_stopTime)) {
            return -1;
        }

        if(QTime::fromString(_startTime) < QTime::fromString(_stopTime)) {
            if ((time >= QTime::fromString(_startTime)) && (time <= QTime::fromString(_stopTime))) {
                qDebug() << "Set On";
                if (_status != On)
                    set_on(true);
            } else {
                if (_status != Off)
                    set_off(true);
            }
        }
        else if (QTime::fromString(_startTime) > QTime::fromString(_stopTime)) {
            if (((time > QTime::fromString(_startTime)) && (time < QTime::fromString("23:59:59")))
            || ((time > QTime::fromString("00:00")) && (time < QTime::fromString(_stopTime)))) {
                qDebug() << "Set On";
                if (_status != On)
                    set_on(true);
            } else {
                if (_status != Off)
                    set_off(true);
            }
        }

    }
    return 0;
}

void Light::set_startTime(QString time)
{
//     qDebug() << "Set set_startTime: " << time << " to id: " << _idDev;
    _startTime = time;
    emit startTimeChanged(time);
    _settings->setValue(_sign, _idDev, "startTime", time);
}

void Light::inc_startTime(int val)
{
    QTime time = QTime::fromString(_startTime).addSecs(60*val);
    set_startTime(time.toString("hh:mm"));
}

void Light::dec_startTime(int val)
{
    QTime time = QTime::fromString(_startTime).addSecs(-60*val);
    set_startTime(time.toString("hh:mm"));
}

void Light::set_stopTime(QString time)
{

    _stopTime = time;
    emit stopTimeChanged(time);
    _settings->setValue(_sign, _idDev, "stopTime", time);
}

void Light::set_pwm(int pwm)
{
//    qDebug() << "Set pwm: " << pwm << " to id: " << _idDev;
    _pwm = pwm;
//    qDebug() << "_pwm: " << _pwm;
    emit pwmChanged(pwm);
    _settings->setValue(_sign, _idDev, "pwm", QString::number(pwm));
}

void Light::set_softStart(int soft)
{
    _softStart = soft;
    emit softStartChanged(soft);
    _settings->setValue(_sign, _idDev, "softStart", QString::number(soft));

}

void Light::inc_stopTime(int val)
{
    QTime time = QTime::fromString(_stopTime).addSecs(60*val);
    set_stopTime(time.toString("hh:mm"));
}

void Light::dec_stopTime(int val)
{

    QTime time = QTime::fromString(_stopTime).addSecs(-60*val);
    set_stopTime(time.toString("hh:mm"));
}

void Light::set_modeTime(bool mode)
{
    _modeTime = mode;
//    qDebug() << "_automation: " << _automation;
    emit modeTimeChanged(mode);
    _settings->setValue(_sign, _idDev, "modeTime", QString::number(mode));
}

void Light::set_automation(int automation)
{
    _automation = automation;
//    qDebug() << "_automation: " << _automation;
    emit automationChanged(automation);
    _settings->setValue(_sign, _idDev, "automation", QString::number(automation));
}



bool Light::check_init_settings()
{
    if(_settings->getValue(SettingsApp::Light, _idDev, "id").toInt() > 0){
        return true;
    } else {
        return false;
    }

}

void Light::save_init_settings(void)
{
    set_sign(SettingsApp::Light);
    set_idDev(_idDev);
    set_name("Light");
    set_status(Light::Off);

    set_startTime("00:00");
    set_stopTime("00:00");
    set_pwm(0);
    set_automation(0);
    set_softStart(0);
    set_modeTime(0);
}

void Light::update_init_values()
{
    set_sign(SettingsApp::Light);
    set_idDev(_settings->getValue(SettingsApp::Light, _idDev, "id").toInt());
    set_name(_settings->getValue(SettingsApp::Light, _idDev, "name"));

    QString start = _settings->getValue(SettingsApp::Light, _idDev, "startTime");
    _startTime_init = start;
    set_startTime(start);
    QString stop = _settings->getValue(SettingsApp::Light, _idDev, "stopTime");
    _stopTime_init = stop;
    set_stopTime(stop);

    set_pwm(_settings->getValue(SettingsApp::Light, _idDev, "pwm").toInt());
    set_automation(_settings->getValue(SettingsApp::Light, _idDev, "automation").toInt());
    set_softStart(_settings->getValue(SettingsApp::Light, _idDev, "softStart").toInt());
    set_modeTime(_settings->getValue(SettingsApp::Light, _idDev, "modeTime").toInt());

}
