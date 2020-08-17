#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include <QSettings>
#include <QDebug>
#include "drivers/inc/datetimewatcher.h"
#include "drivers/inc/microcontroller.h"
#include "models/settings/settings.h"
#include "deviceoutput.h"
#include "devices/lights/light.h"
#include "devices/lights/pumps.h"
#include "devices/waterpump.h"

int main(int argc, char *argv[])
{
    qputenv("QT_IM_MODULE", QByteArray("qtvirtualkeyboard"));

    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication::setApplicationName("AQUA 2019");
    qmlRegisterType<DateTimeWatcher>("DRIVERS", 1, 0, "DateTimeWatcher");
    qmlRegisterType<Microcontroller>("DRIVERS", 1, 0, "Microcontroller");
    qmlRegisterType<SettingsApp>("DRIVERS", 1, 0, "SettingsApp");

    qmlRegisterType<DeviceOutput>();
    qmlRegisterType<Light>("DRIVERS", 1, 0, "Light");
    qmlRegisterType<Pump>("DRIVERS", 1, 0, "Pump");
    qmlRegisterType<WaterPump>("DRIVERS", 1, 0, "WaterPump");

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine *engine = new QQmlApplicationEngine;
    QQmlContext *context = engine->rootContext();

    engine->load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine->rootObjects().isEmpty())
        return -1;

    return app.exec();
}


/*To DO List:



- Dodać Pompowanie wody zbiornika logika
- Dodać Pompowanie wody zbiornika widok

- Dodać deviceinput
- Dodać Temperaturę
- Dodać PH

- Dodać do device property enabled i switcha do widoku
- Dodać system zmiany nazwy urządzenia


DONE:
1. Zastanowić się nad architekturą strona na urządzenie
2. Zmienić maszynę stanów
3. Rozdzielić Światła na poszczególne strony
4. Zmienić przyciski na RangeSlider do czasów
5. Zastanowić się nad zmianą wyglądu aplikacji
6. Dorobić checked button do odwrócenia slidera
7. Uzależnic wysylanie akcji od checked button
8. Dodać nowe property związane z checked button
9. Dodać tekst informujący o czasu działania
10. Uzależnić kolor slidera od checked button
11. Wstawić informację o soft starcie
12. Dodać do headera liczbę stron jeśli istnieje więcej niż jedna
13. Dodać background z radius i opacity do poszczególnych area
14. Uzależnić kolor range slidera od checked button
15. Uzależnić kolor slidera od checked button
16. Zrobić nowy checkbox z ekg
17. Zmienić wygląd na nowy - światła
18. Dodać POMPY
19. Dodać widok zmiany dni pompy
20. Dodać logikę do widoku zmiany dni pompy
21. Dodać zapisywanie zmiany dni pompy
22. Dodać przycisk na popup
23. Dodać popup ręcznym działaniem z czasem pompowania i zapisem ml
24. Dodać czas działania pomp, widok i logika
25. Dodać akcje na zapis wartości ml z Property logicznym
26. Dodać logikę id w popup pumps
27.Dodać logikę włączania pompy ze względu na czas i datę

*/


