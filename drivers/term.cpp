//#include "term.h"

//Term::Term(QObject *parent):
//    QObject(parent)
//{
////    serial = new QSerialPort(this);
////    openSerialPort();
////    connect(serial, SIGNAL(readyRead()), this, SLOT(readData()));

//}
//void Term::readData()
//{
//    QByteArray data = serial->readAll();
//    serial->waitForReadyRead(50);
//    QString sdata = QString(data);
//    //qDebug() << sdata << endl;
//    translateData(data);
//}
//void Term::openSerialPort()
//{
////    serial->setPortName("ttyUSB0");
////    serial->setBaudRate(9600);
////    serial->setDataBits(QSerialPort::Data8);
////    serial->setParity(QSerialPort::NoParity);
////    serial->setStopBits(QSerialPort::OneStop);
////    serial->setFlowControl(QSerialPort::NoFlowControl);

//    if (serial->open(QIODevice::ReadWrite)) {
//        qDebug() << "Success in connected UART";
//    } else {
//        qDebug() << "Error! UART" <<  serial->errorString();
//    }
//}

//void Term::translateData(QByteArray val)
//{
//    int id;
//    if(val == "1") id=1;
//    else if(val == "2") id=2;
//    else if(val == "3") id=3;
//    else if(val == "4") id=4;
//    else if(val == "5") id=5;
//    else if(val == "6") id=6;
//    else if(val == "7") id=7;
//    else if(val == "8") id=8;
//    else if(val == "9") id=9;
//    else if(val == "a") id=10;
//    else if(val == "b") id=11;
//    else if(val == "c") id=12;
//    else if(val == "d") id=13;
//    else if(val == "e") id=14;
//    else id=0;

//    emit button_clicked_sig(static_cast<unsigned int>(id));
//    qDebug() << "Pressed: " << QString::number(id);
//}
