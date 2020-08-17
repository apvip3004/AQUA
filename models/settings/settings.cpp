
#include <QDebug>
#include <QDir>
#include <QMetaEnum>
#include <QVariant>

#include "settings.h"


SettingsApp::SettingsApp(QObject *parent) : QObject(parent)
{

    _settings_app = new QSettings(QDir::currentPath()+"/../AQUA2019/config.ini", QSettings::IniFormat);

    reset();
}

QString SettingsApp::getValue(Devices dev, int number, QString name)
{
//    if(name == "automation") {
//        qDebug() << "Automation from file is: " << _settings_app->value("Light"+QString::number(number)+"_"+name).toString();
//    }
    QString ret_val;
    switch (dev) {
    case Devices::Light:
        return _settings_app->value("Light"+QString::number(number)+"_"+name).toString();
    case Devices::Pump:
        return _settings_app->value("Pump"+QString::number(number)+"_"+name).toString();
    case Devices::WaterPump:
        return _settings_app->value("WaterPump"+QString::number(number)+"_"+name).toString();
//    case Devices::Temperature:
//        return _settings_app->value("Temperature"+QString::number(number)+"_"+name).toString();
    }
}

void SettingsApp::setValue(Devices dev, int id, QString name, QString value)
{
    if (id <= 0) {
        return;
    }

    switch (dev) {
        case Devices::Light:
            _settings_app->setValue(QVariant::fromValue(dev).toString()+QString::number(id)+"_"+name,value);
        break;
        case Devices::Pump:
            _settings_app->setValue(QVariant::fromValue(dev).toString()+QString::number(id)+"_"+name,value);
        break;
        case Devices::WaterPump:
                qDebug() << "setValue WaterPump " << QVariant::fromValue(dev).toString()+QString::number(id)+"_"+name,value;
            _settings_app->setValue(QVariant::fromValue(dev).toString()+QString::number(id)+"_"+name,value);
        break;
        case Devices::Fault:
        break;

//    case Devices::Fan:
//        if(name == "start")
//            _settings->setValue("Fan"+QString::number(number)+"_"+name,value);
//        else if(name == "stop")
//            _settings->setValue("Fan"+QString::number(number)+"_"+name,value);
//        break;
//    case Devices::Temperature:
//        if(name == "start")
//            _settings->setValue("Temperature"+QString::number(number)+"_"+name,value);
//        else if(name == "stop")
//            _settings->setValue("Temperature"+QString::number(number)+"_"+name,value);
//        break;
    }

    QStringList keys = _settings_app->allKeys();
}


void SettingsApp::reset()
{


}

void SettingsApp::readIni()
{

}
