#ifndef DEVICEOUTPUT_H
#define DEVICEOUTPUT_H

#include <QObject>
#include <QTime>
#include <QString>

#include "models/settings/settings.h"

class DeviceOutput : public QObject
{
    Q_OBJECT

    Q_PROPERTY(SettingsApp::Devices sign READ get_sign WRITE set_sign NOTIFY signChanged)
    Q_PROPERTY(QString name READ get_name WRITE set_name NOTIFY nameChanged)
    Q_PROPERTY(int idDev READ get_idDev WRITE set_idDev NOTIFY idDevChanged)

    Q_PROPERTY(Status status READ get_status WRITE set_status NOTIFY statusChanged)

public:
    enum Status {
        Unrecognized = -1,
        Off = 0,
        On = 1
    };
    Q_ENUM(Status)

    explicit DeviceOutput(QObject *parent = nullptr);
    ~DeviceOutput();

    SettingsApp::Devices get_sign() { return _sign; }
    void set_sign(SettingsApp::Devices);
    QString get_name() { return _name; }
    Q_INVOKABLE void set_name(QString);
    int get_idDev() { return _idDev; }
    void set_idDev(int);

    Status get_status() { return _status; }
    void set_status(Status);

    Q_INVOKABLE void set_on(bool);
    Q_INVOKABLE void set_off(bool);

signals:

    void nameChanged(QString);
    void idDevChanged(int);
    void signChanged(SettingsApp::Devices);
    void statusChanged(Status);

protected:
    SettingsApp *_settings;

    SettingsApp::Devices _sign;
    QString _name;
    int _idDev;

    Status _status;

private:

};

#endif // DEVICEOUTPUT_H
