#include "waterpump.h"

WaterPump::WaterPump(QObject *parent)
{

}

void WaterPump::set_timeSec(int time)
{
    _timeSec = time;
    emit timeSecChanged(time);
    _settings->setValue(_sign, _idDev, "timeSec", QString::number(time));
}

void WaterPump::set_cycle(QTime cycle)
{
    _cycle = cycle;
    emit cycleChanged(cycle);
    _settings->setValue(_sign, _idDev, "cycle", cycle.toString("hh:mm"));
}

bool WaterPump::check_init_settings()
{
    if(_settings->getValue(SettingsApp::WaterPump, _idDev, "id").toInt() > 0){
        return true;
    } else {
        return false;
    }
}

void WaterPump::save_init_settings(void)
{
    set_sign(SettingsApp::WaterPump);
    set_idDev(_idDev);
    set_name("WaterPump");
    set_status(WaterPump::Off);

    set_timeSec(0);
//    set_cycle(QTime::fromString("00:00","hh:mm"));
}

void WaterPump::update_init_values()
{
    set_sign(SettingsApp::WaterPump);
    set_idDev(_settings->getValue(SettingsApp::WaterPump, _idDev, "id").toInt());
    set_name(_settings->getValue(SettingsApp::WaterPump, _idDev, "name"));

    set_timeSec(_settings->getValue(SettingsApp::WaterPump, _idDev, "timeSec").toInt());
    set_cycle(QTime::fromString(_settings->getValue(SettingsApp::WaterPump, _idDev, "cycle"), "hh:mm"));
}

