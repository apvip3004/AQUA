#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QString>
#include "QSettings"

class SettingsApp : public QObject
{
    Q_OBJECT
public:
    explicit SettingsApp(QObject *parent = nullptr);

    enum Devices {
        Fault = -1,
        Light = 0,
        Fan,
        Temperature,
        WaterPump,
        Pump
    };
    Q_ENUM(Devices)

    QString getValue(Devices, int, QString);
    void setValue(Devices, int, QString, QString);

signals:

public slots:

private:
    QSettings *_settings_app;

    void reset();
    void readIni();
};

#endif // SETTINGS_H
