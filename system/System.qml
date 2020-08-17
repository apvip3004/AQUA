import QtQuick 2.12
import QtQml 2.4
import QtScxml 5.8

import DRIVERS 1.0

Item {
    property alias stateMachine: smLoader.stateMachine
    property alias dateTimeWatcher: dateTimeWatcher
    property alias appSettings: appSettings

    property alias light_1: light_1
    property alias light_2: light_2
    property alias light_3: light_3

    property alias pump_1: pump_1
    property alias pump_2: pump_2
    property alias pump_3: pump_3
    property alias pump_4: pump_4
    property alias pump_5: pump_5

    property int pageIndex: 0

    StateMachineLoader {
        id: smLoader
        source: "qrc:///system/sm.scxml"
    }

    Initializer {
        id: initializer
    }

    SettingsApp {
        id: appSettings
    }

    DateTimeWatcher {
        id: dateTimeWatcher

        property date currentDate: new Date()

        onDateTimeChanged: {
            light_1.get_next_sec(dateTime)
            light_2.get_next_sec(dateTime)
            light_3.get_next_sec(dateTime)

            pump_1.get_next_sec(dateTime)
//            pump_2.get_next_sec(dateTime)
//            pump_3.get_next_sec(dateTime)
//            pump_4.get_next_sec(dateTime)
//            pump_5.get_next_sec(dateTime)
//            console.log("adsgds:   " + dateTime)
        }
    }


    Light {
        id: light_1

        idDev: 1
        status: Light.Off

        Component.onCompleted: {
            if (!check_init_settings())
                save_init_settings()
            else
                update_init_values()

            set_name("Lampa LED 1")
        }
    }

    Light {
        id: light_2

        idDev: 2
        status: Light.Off

        Component.onCompleted: {
            if (!check_init_settings())
                save_init_settings()
            else
                update_init_values()

            set_name("Lampa LED 2")
        }
    }

    Light {
        id: light_3

        idDev: 3
        status: Light.Off

        Component.onCompleted: {
            if (!check_init_settings())
                save_init_settings()
            else
                update_init_values()

            set_name("Lampa UV")
        }
    }

    Pump {
        id: pump_1

        idDev: 1
        status: Light.Off

        Component.onCompleted: {
            if (!check_init_settings())
                save_init_settings()
            else
                update_init_values()

            set_name("Pompa 1 NO3")
        }
    }

    Pump {
        id: pump_2

        idDev: 2
        status: Light.Off

        Component.onCompleted: {
            if (!check_init_settings())
                save_init_settings()
            else
                update_init_values()

            set_name("Pompa 2 PO4")
        }
    }

    Pump {
        id: pump_3

        idDev: 3
        status: Light.Off

        Component.onCompleted: {
            if (!check_init_settings())
                save_init_settings()
            else
                update_init_values()

            set_name("Pompa 3 K")
        }
    }

    Pump {
        id: pump_4

        idDev: 4
        status: Light.Off

        Component.onCompleted: {
            if (!check_init_settings())
                save_init_settings()
            else
                update_init_values()

            set_name("Pompa 4 MICRO")
        }
    }

    Pump {
        id: pump_5

        idDev: 5
        status: Light.Off

        Component.onCompleted: {
            if (!check_init_settings())
                save_init_settings()
            else
                update_init_values()

            set_name("Pompa 5 INNE")
        }
    }

    WaterPump {
        id: water_pump_1

        idDev: 1
        status: WaterPump.Off

        Component.onCompleted: {
            if (!check_init_settings())
                save_init_settings()
            else
                update_init_values()

            set_name("Pompa Wodna 1")
        }
    }
// Devices to control
// ------------------------------------------------------

//    Timer {
//        id: timer
//        interval: 1000
//        repeat: true
//        running: true

//        onTriggered: {
//            console.log("State is: " + stateMachine.activeStateNames())

//        }
//    }

    Connections {
        id: actionConnections
        target: actions

        onSwipePage: {
            console.log("onSwipePage " + index)
            switch(index){
            case 0:
                stateMachine.submitEvent("goMainView")
                break;
            case 1:
                stateMachine.submitEvent("goLightView")
                break
            case 2:
                stateMachine.submitEvent("goWaterTemperatureView")
                break;
            case 3:
                stateMachine.submitEvent("goWaterPumpView")
                break
            case 4:
                stateMachine.submitEvent("goPumpsView")
                break
            case 5:
                stateMachine.submitEvent("goPHView")
                break
            }
            pageIndex = index
        }

        onBackZeroPage: {
            actions.swipePage(0)
        }


        onSetOnLight: {

            switch(id) {
            case 1:
                light_1.set_on(true)
                break;
            case 2:
                light_2.set_on(true)
                break;
            case 3:
                light_3.set_on(true)
                break;
            }
        }
        onSetOffLight: {

            switch(id) {
            case 1:
                light_1.set_off(true)
                break;
            case 2:
                light_2.set_off(true)
                break;
            case 3:
                light_3.set_off(true)
                break;
            }
        }

        onSwipePageVerticalLights: {
            switch(index){
            case 0:
                stateMachine.submitEvent("swipeUp")
                break;
            case 1:
                stateMachine.submitEvent("swipeDown")
                break
            }
        }

        onSetRangeLightsStart: {
            var h = parseInt(value/60)
            var m = parseInt(value%60)
            var value_str

            if (h < 10)
                value_str = "0" + h
            else
                value_str = h

            if (m < 10)
                value_str = value_str + ":" + "0" + m
            else
                value_str = value_str + ":" + m

            switch(id) {
            case 1:
                light_1.startTime = value_str
                break;
            case 2:
                light_2.startTime = value_str
                break;
            case 3:
                light_3.startTime = value_str
                break;
            }
        }
        onSetRangeLightsStop: {
            var h = parseInt(value/60)
            var m = parseInt(value%60)
            var value_str

            if (h < 10)
                value_str = "0" + h
            else
                value_str = h

            if (m < 10)
                value_str = value_str + ":" + "0" + m
            else
                value_str = value_str + ":" + m

            switch(id) {
            case 1:
                light_1.stopTime = value_str
                break;
            case 2:
                light_2.stopTime = value_str
                break;
            case 3:
                light_3.stopTime = value_str
                break;
            }
        }
        onSetModeTimeLights: {

            switch(id) {
            case 1:
                var temp_start = light_1.startTime
                light_1.startTime = light_1.stopTime
                light_1.stopTime = temp_start
                light_1.modeTime = value
                break;
            case 2:
                var temp_start = light_2.startTime
                light_2.startTime = light_2.stopTime
                light_2.stopTime = temp_start
                light_2.modeTime = value
                break;
            case 3:
                var temp_start = light_3.startTime
                light_3.startTime = light_3.stopTime
                light_3.stopTime = temp_start
                light_3.modeTime = value
                break;
            }
        }
        onSetLightsPwm: {
            switch(id) {
            case 1:
                light_1.pwm = pwm
                break;
            case 2:
                light_2.pwm = pwm
                break;
            case 3:
                light_3.pwm = pwm
                break;
            }
        }
        onSetLightsAutomation: {
            switch(id) {
            case 1:
                light_1.automation = auto
                break;
            case 2:
                light_2.automation = auto
                break;
            case 3:
                light_3.automation = auto
                break;
            }
        }

        onSetLightsSoftStart: {
            switch(id) {
            case 1:
                light_1.softStart = soft
                break;
            case 2:
                light_2.softStart = soft
                break;
            case 3:
                light_3.softStart = soft
                break;
            }
        }

        // POMPS

        onSetOnPump: {

            switch(id) {
            case 1:
                pump_1.set_on(true)
                break;
            case 2:
                pump_2.set_on(true)
                break;
            case 3:
                pump_3.set_on(true)
                break;
            case 4:
                pump_4.set_on(true)
                break;
            case 5:
                pump_5.set_on(true)
                break;
            }
        }
        onSetOffPump: {

            switch(id) {
            case 1:
                pump_1.set_off(true)
                break;
            case 2:
                pump_2.set_off(true)
                break;
            case 3:
                pump_3.set_off(true)
                break;
            case 4:
                pump_4.set_off(true)
                break;
            case 5:
                pump_5.set_off(true)
                break;
            }
        }

        onSwipePageVerticalPumps: {
            switch(index){
            case 0:
                stateMachine.submitEvent("swipeUp")
                break;
            case 1:
                stateMachine.submitEvent("swipeDown")
                break
            case 2:
                stateMachine.submitEvent("swipeDown")
                break
            case 3:
                stateMachine.submitEvent("swipeDown")
                break
            case 4:
                stateMachine.submitEvent("swipeDown")
                break
            }
        }

        onSetWorkingTimePumps: {
            var h = parseInt(value/60)
            var m = parseInt(value%60)
            var value_str

            if (h < 10)
                value_str = "0" + h
            else
                value_str = h

            if (m < 10)
                value_str = value_str + ":" + "0" + m
            else
                value_str = value_str + ":" + m

            switch(id) {
            case 1:
                pump_1.workingTime = value_str
                break;
            case 2:
                pump_2.workingTime = value_str
                break;
            case 3:
                pump_3.workingTime = value_str
                break;
            case 4:
                pump_4.workingTime = value_str
                break;
            case 5:
                pump_5.workingTime = value_str
                break;
            }
        }

        onSetTimeSecPumps: {

            switch(id) {
            case 1:
                pump_1.timeSec = value
                break;
            case 2:
                pump_2.timeSec = value
                break;
            case 3:
                pump_3.timeSec = value
                break;
            case 4:
                pump_4.timeSec = value
                break;
            case 5:
                pump_5.timeSec = value
                break;
            }
        }

        onSetLevelValuePumps: {
//            console.log("onSetLevelValuePumps " + id)
            switch(id) {
            case 1:
                pump_1.levelValue = value
                break;
            case 2:
                pump_2.levelValue = value
                break;
            case 3:
                pump_3.levelValue = value
                break;
            case 4:
                pump_4.levelValue = value
                break;
            case 5:
                pump_5.levelValue = value
                break;
            }
        }

        onSetModeTimePumps: {

            switch(id) {
            case 1:
                var temp_start = pump_1.startTime
                pump_1.startTime = pump_1.stopTime
                pump_1.stopTime = temp_start
                pump_1.modeTime = value
                break;
            case 2:
                var temp_start = pump_2.startTime
                pump_2.startTime = pump_2.stopTime
                pump_2.stopTime = temp_start
                pump_2.modeTime = value
                break;
            case 3:
                var temp_start = pump_3.startTime
                pump_3.startTime = pump_3.stopTime
                pump_3.stopTime = temp_start
                pump_3.modeTime = value
                break;
            case 3:
                var temp_start = pump_4.startTime
                pump_4.startTime = pump_4.stopTime
                pump_4.stopTime = temp_start
                pump_4.modeTime = value
                break;
            case 3:
                var temp_start = pump_5.startTime
                pump_5.startTime = pump_5.stopTime
                pump_5.stopTime = temp_start
                pump_5.modeTime = value
                break;
            }
        }
    }
}
