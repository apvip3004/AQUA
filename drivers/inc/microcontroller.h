#ifndef MICROCONTROLLER_H
#define MICROCONTROLLER_H

#include <QObject>

class Microcontroller : public QObject
{
    Q_OBJECT

public:
    explicit Microcontroller(QObject* parent = nullptr);

//    bool sendCommandToDevice(QString command);

public slots:

bool sendCommandToDevice(QString command);

private slots:


signals:


protected:


private:

};


#endif // MICROCONTROLLER_H
