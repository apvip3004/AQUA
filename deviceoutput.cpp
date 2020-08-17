#include "deviceoutput.h"
#include <QDebug>
DeviceOutput::DeviceOutput(QObject *parent) :
    QObject(parent),
    _sign(SettingsApp::Fault),
    _name(""),
    _idDev(0),
    _status(Unrecognized)
{
    _settings = new SettingsApp();
}

DeviceOutput::~DeviceOutput()
{
    delete _settings;
}

void DeviceOutput::set_sign(SettingsApp::Devices sign)
{
    _sign = sign;
    emit signChanged(sign);
    _settings->setValue(_sign, _idDev, "sign", QVariant::fromValue(sign).toString());
}

void DeviceOutput::set_idDev(int id)
{
    _idDev = id;
    emit idDevChanged(id);
    _settings->setValue(_sign, _idDev, "id", QString::number(_idDev));
}

void DeviceOutput::set_name(QString name)
{
    _name = name;
    emit nameChanged(name);
    _settings->setValue(_sign, _idDev, "name", name);
}


void DeviceOutput::set_status(Status status)
{
    _status = status;
    emit statusChanged(status);
}

void DeviceOutput::set_on(bool)
{
    set_status(On);
}

void DeviceOutput::set_off(bool)
{
    set_status(Off);
}

