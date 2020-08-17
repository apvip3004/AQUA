#include "pumps.h"

#include <QDate>

Pump::Pump(QObject *parent) :
    DeviceOutput ()
{

    week["Monday"] = false;
    week["Tuesday"] = false;
    week["Wednesday"] = false;
    week["Thursday"] = false;
    week["Friday"] = false;
    week["Saturday"] = false;
    week["Sunday"] = false;

    _working_timer = new QTimer(this);
    connect(_working_timer, &QTimer::timeout, this, &Pump::working_finished);
}

void Pump::reset()
{

}

int Pump::get_next_sec(QTime time)
{
    if(time >= _time_back && time <= _time_to) {
        if(getActiveDay(QDate::currentDate().dayOfWeek())) {
            start_working();
        }
    }
    return 0;
}


void Pump::set_workingTime(QString time)
{
    _workingTime = time;
    emit workingTimeChanged(time);
    _settings->setValue(_sign, _idDev, "workingTime", time);
    _time_back = QTime::fromString(_workingTime, "hh:mm").addSecs(-1);
    _time_to = QTime::fromString(_workingTime, "hh:mm").addSecs(1);
}

void Pump::set_timeSec(int time)
{
    _timeSec = time;
    emit timeSecChanged(time);
    _settings->setValue(_sign, _idDev, "timeSec", QString::number(time));
    _working_timer->setInterval(1000*_timeSec);
}

void Pump::set_levelValue(int value)
{
    _levelValue = value;
    emit levelValueChanged(value);
    _settings->setValue(_sign, _idDev, "levelValue", QString::number(value));
}

void Pump::set_modeTime(bool mode)
{
    _modeTime = mode;
    emit modeTimeChanged(mode);
    _settings->setValue(_sign, _idDev, "modeTime", QString::number(mode));
}

bool Pump::getActiveDay(QString day)
{
    if (day == "Monday") {
        return week["Monday"];
    } else if(day == "Tuesday") {
        return week["Tuesday"];
    } else if(day == "Wednesday") {
        return week["Wednesday"];
    } else if(day == "Thursday") {
        return week["Thursday"];
    } else if(day == "Friday") {
        return week["Friday"];
    } else if(day == "Saturday") {
        return week["Saturday"];
    } else if(day == "Sunday") {
        return week["Sunday"];
    }
    return 0;
}

bool Pump::getActiveDay(int day_nr)
{
    switch(day_nr) {
    case 1:
        return week["Monday"];
    case 2:
        return week["Tuesday"];
    case 3:
        return week["Wednesday"];
    case 4:
        return week["Thursday"];
    case 5:
        return week["Friday"];
    case 6:
        return week["Saturday"];
    case 7:
        return week["Sunday"];
    }
    return 0;
}

void Pump::set_active_day(QString day, bool status)
{
    if (day == "Monday") {
        week["Monday"] = status;
        _settings->setValue(_sign, _idDev, "WEEK_monday", QString::number(status));
    } else if(day == "Tuesday") {
        week["Tuesday"] = status;
        _settings->setValue(_sign, _idDev, "WEEK_tuesday", QString::number(status));
    } else if(day == "Wednesday") {
        week["Wednesday"] = status;
        _settings->setValue(_sign, _idDev, "WEEK_wednesday", QString::number(status));
    } else if(day == "Thursday") {
        week["Thursday"] = status;
        _settings->setValue(_sign, _idDev, "WEEK_thursday", QString::number(status));
    } else if(day == "Friday") {
        week["Friday"] = status;
        _settings->setValue(_sign, _idDev, "WEEK_friday", QString::number(status));
    } else if(day == "Saturday") {
        week["Saturday"] = status;
        _settings->setValue(_sign, _idDev, "WEEK_saturday", QString::number(status));
    } else if(day == "Sunday") {
        week["Sunday"] = status;
        _settings->setValue(_sign, _idDev, "WEEK_sunday", QString::number(status));
    }
}

void Pump::set_init_week()
{
    set_active_day("Monday",false);
    set_active_day("Tuesday",false);
    set_active_day("Wednesday",false);
    set_active_day("Thursday",false);
    set_active_day("Friday",false);
    set_active_day("Saturday",false);
    set_active_day("Sunday",false);

    _settings->setValue(_sign, _idDev, "WEEK_monday", QString::number(false));
    _settings->setValue(_sign, _idDev, "WEEK_tuesday", QString::number(false));
    _settings->setValue(_sign, _idDev, "WEEK_wednesday", QString::number(false));
    _settings->setValue(_sign, _idDev, "WEEK_thursday", QString::number(false));
    _settings->setValue(_sign, _idDev, "WEEK_friday", QString::number(false));
    _settings->setValue(_sign, _idDev, "WEEK_saturday", QString::number(false));
    _settings->setValue(_sign, _idDev, "WEEK_sunday", QString::number(false));

}

void Pump::update_init_week()
{
    set_active_day("Monday", _settings->getValue(SettingsApp::Pump, _idDev, "WEEK_monday").toInt());
    set_active_day("Tuesday", _settings->getValue(SettingsApp::Pump, _idDev, "WEEK_tuesday").toInt());
    set_active_day("Wednesday", _settings->getValue(SettingsApp::Pump, _idDev, "WEEK_wednesday").toInt());
    set_active_day("Thursday", _settings->getValue(SettingsApp::Pump, _idDev, "WEEK_thursday").toInt());
    set_active_day("Friday", _settings->getValue(SettingsApp::Pump, _idDev, "WEEK_friday").toInt());
    set_active_day("Saturday", _settings->getValue(SettingsApp::Pump, _idDev, "WEEK_saturday").toInt());
    set_active_day("Sunday", _settings->getValue(SettingsApp::Pump, _idDev, "WEEK_sunday").toInt());
}

void Pump::start_working()
{
    set_on(true);
    _working_timer->start();
}

void Pump::working_finished()
{
    set_off(true);
}

bool Pump::check_init_settings()
{
    if(_settings->getValue(SettingsApp::Pump, _idDev, "id").toInt() > 0){
        return true;
    } else {
        return false;
    }
}

void Pump::save_init_settings(void)
{
    set_sign(SettingsApp::Pump);
    set_idDev(_idDev);
    set_name("Pump");
    set_status(Pump::Off);

    set_modeTime(0);
    set_init_week();
    set_workingTime("00:00");
    set_timeSec(0);
    set_levelValue(0);

    _working_timer->setInterval(1000*_timeSec);
}

void Pump::update_init_values()
{
    set_sign(SettingsApp::Pump);
    set_idDev(_settings->getValue(SettingsApp::Pump, _idDev, "id").toInt());
    set_name(_settings->getValue(SettingsApp::Pump, _idDev, "name"));
    set_modeTime(_settings->getValue(SettingsApp::Pump, _idDev, "modeTime").toInt());

    update_init_week();
    QString wTime = _settings->getValue(SettingsApp::Pump, _idDev, "workingTime");
    set_workingTime(wTime);

    set_timeSec(_settings->getValue(SettingsApp::Pump, _idDev, "timeSec").toInt());
    set_levelValue(_settings->getValue(SettingsApp::Pump, _idDev, "levelValue").toInt());

    _time_back = QTime::fromString(_workingTime, "hh:mm").addSecs(-1);
    _time_to = QTime::fromString(_workingTime, "hh:mm").addSecs(1);
    _working_timer->setInterval(1000*_timeSec);

}


