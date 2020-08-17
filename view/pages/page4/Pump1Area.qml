import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.12

import DRIVERS 1.0

import "../../controls"

Item {
    id: root

    ListModel {
        id: weekModel

        ListElement {
            name: "Monday"
            sign: "Pn"
            active: false
        }
        ListElement {
            name: "Tuesday"
            sign: "Wt"
            active: false
        }
        ListElement {
            name: "Wednesday"
            sign: "Śr"
            active: false
        }
        ListElement {
            name: "Thursday"
            sign: "Cz"
            active: false
        }
        ListElement {
            name: "Friday"
            sign: "Pt"
            active: false
        }
        ListElement {
            name: "Saturday"
            sign: "So"
            active: false
        }
        ListElement {
            name: "Sunday"
            sign: "N"
            active: false
        }
        Component.onCompleted: {
            get(0).active = system.pump_1.getActiveDay("Monday")
            get(1).active = system.pump_1.getActiveDay("Tuesday")
            get(2).active = system.pump_1.getActiveDay("Wednesday")
            get(3).active = system.pump_1.getActiveDay("Thursday")
            get(4).active = system.pump_1.getActiveDay("Friday")
            get(5).active = system.pump_1.getActiveDay("Saturday")
            get(6).active = system.pump_1.getActiveDay("Sunday")
        }
    }

    Rectangle {
        anchors.fill: parent
        opacity: 0.2
        radius: 5
    }

    Text {
        id: name
        text: system.pump_1.name
        font.pointSize: 16

        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        MouseArea {
            anchors.fill: parent

            onDoubleClicked: {
                console.log("change name")
            }
        }
    }

    InfoText {
        id: devStatus

        anchors.top: name.bottom
        anchors.horizontalCenter: root.horizontalCenter

        text: (system.pump_1.status === Light.On) ? "ON"
                                                   : "OFF"
        color: (system.pump_1.status === Light.On) ? "green"
                                                : "red"
    }

    Row {
        id: onOffRow

        anchors.verticalCenter: devStatus.verticalCenter
        anchors.left: root.left
        anchors.leftMargin: style.margin

        spacing: 20

        SetButton {
            id: setOnBtn

            text: "Włącz"
            color: setOnBtnma.pressed ? style.accentLightColor
                                     : style.accentColor
            MouseArea {
                id: setOnBtnma
                anchors.fill: parent
                onClicked: actions.setOnPump(system.pump_1.idDev)
            }
        }

        SetButton {
            id: setOffBtn

            text: "Wyłącz"
            color: setOffBtnma.pressed ? style.accentLightColor
                                     : style.accentColor

            MouseArea {
                id: setOffBtnma

                anchors.fill: parent
                onClicked: actions.setOffPump(system.pump_1.idDev)
            }

        }
    }

    Text {
        id: weekText

        anchors.verticalCenter: weekRow.verticalCenter
        anchors.left: root.left
        anchors.leftMargin: 25

        text: qsTr("Ustaw dni tygodnia:")
    }

    Row {
        id: weekRow

        anchors.top: onOffRow.bottom
        anchors.topMargin: style.margin
        anchors.left: weekText.right
        anchors.leftMargin: style.margin

        Repeater {
            model: weekModel
            Rectangle {
                width: 70; height: 30
                border.width: 1
                color: active ? style.accentLightColor
                              : style.accentColor
                Text {
                    anchors.centerIn: parent
                    text: sign
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {

                        active = !active
                        console.log(name + " is " + active)
                        system.pump_1.set_active_day(name, active)
                    }
                }
            }
        }
    }

    Row {
        id: timeRow

        anchors.top: weekRow.bottom
        anchors.topMargin: style.margin
        anchors.left: root.left
        anchors.leftMargin: style.margin

        spacing: 28

        Text {
            id: timeText

            text: qsTr("Godzina włączenia:")
        }

        Slider {
            id: timeSlider

            anchors.verticalCenter: parent.verticalCenter

            from: 0
            to: 1439
            stepSize: 5
            snapMode: RangeSlider.SnapAlways

            function calculate_time_toInt(time) {
                time = time.replace(':','')
                var ret =  parseInt(time.charAt(0) + time.charAt(1), 10)*60
                            + parseInt(time.charAt(2) + time.charAt(3), 10)
                return ret
            }

            value: calculate_time_toInt(system.pump_1.workingTime)
            onValueChanged: {
                actions.setWorkingTimePumps(system.pump_1.idDev, value)
            }
        }

        Text {
            id: wTimeSliderText

            text: system.pump_1.workingTime
        }
    }

    Row {
        id: timeSecRow

        anchors.top: timeRow.bottom
        anchors.topMargin: style.margin
        anchors.left: root.left
        anchors.leftMargin: style.margin

        spacing: 67

        Text {
            id: timeSecText

            text: qsTr("Czas działania:")
        }

        Slider {
            id: timeSecSlider

            anchors.verticalCenter: parent.verticalCenter

            from: 0
            to: 60
            stepSize: 1
            snapMode: RangeSlider.SnapAlways

            value: system.pump_1.timeSec
            onValueChanged: {
                actions.setTimeSecPumps(system.pump_1.idDev, value)
//                actions.setLevelValuePumps(system.pump_1.idDev, levelSlider.value)
            }
        }

        Text {
            id: timeSecSliderText

            text: system.pump_1.timeSec + " s"
        }
    }


    ManualPopup {
        id: manualPopup
        idPomp: system.pump_1.idDev
    }

    SetButton {
        id: setManualBtn

        anchors.top: timeSecRow.bottom
        anchors.topMargin: style.margin
        anchors.left: parent.left
        anchors.leftMargin: style.margin

        color: setManualBtnma.pressed ? style.accentLightColor
                                      : style.accentColor
        text: "Sterowanie ręczne"

        MouseArea {
            id: setManualBtnma
            anchors.fill: parent
            onClicked: manualPopup.open()
        }
    }

}
