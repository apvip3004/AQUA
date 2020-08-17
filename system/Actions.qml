import QtQuick 2.12

Item {
    // user
    signal swipePage(int index)
    signal backZeroPage()

    signal setOnLight(int id)
    signal setOffLight(int id)
    signal swipePageVerticalLights(int index)
    signal setRangeLightsStart(int id, int value)
    signal setRangeLightsStop(int id, int value)
    signal setModeTimeLights(int id, bool value)
    signal setLightsPwm(int id, int pwm)
    signal setLightsAutomation(int id, bool auto)
    signal setLightsSoftStart(int id, bool soft)

    signal setOnPump(int id)
    signal setOffPump(int id)
    signal swipePageVerticalPumps(int index)
    signal setWorkingTimePumps(int id, int value)
    signal setTimeSecPumps(int id, int value)
    signal setLevelValuePumps(int id, int value)
    signal setModeTimePumps(int id, bool value)

}
