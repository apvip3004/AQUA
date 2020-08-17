import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.12

import DRIVERS 1.0

import "../../controls"

Item {
    id: root

    Rectangle {
        anchors.fill: parent
        opacity: 0.2
        radius: 5
    }

    Text {
        id: name
        text: system.light_2.name
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

    Row {
        id: statusRow

        anchors.top: name.bottom
        anchors.topMargin: style.spacingMain
        spacing: 170

        Text {
            id: statusText
            anchors.verticalCenter: devStatus.verticalCenter

            text: qsTr("Status: ");
        }

        InfoText {
            id: devStatus
            text: (system.light_2.status === Light.On) ? "ON"
                                                       : "OFF"
            color: (system.light_2.status === Light.On) ? "green"
                                                    : "red"
        }
    }

    Switch {
        id: automatCheck

        anchors.verticalCenter: setRow.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        checked: system.light_2.automation
        onCheckedChanged: actions.setLightsAutomation(system.light_2.idDev
                                                      , checked)

        Text {

            anchors.left: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 15
            text: system.light_2.automation ? qsTr("Sterowanie Automatycznie")
                                            : qsTr("Sterowanie Ręczne")
            font.pointSize: 12
        }
    }

    Row {
        id: setRow

        anchors.top: statusRow.bottom
        anchors.topMargin: style.spacingMain
        spacing: 78

        enabled: !system.light_2.automation
        opacity: system.light_2.automation ? 0.3
                                           : 1
        Text {
            id: setText

            anchors.verticalCenter: onOffRow.verticalCenter
            text: qsTr("Włącz/Wyłącz: ");
        }

        Row {
            id: onOffRow
            spacing: 20

            SetButton {
                id: setOnBtn

                text: "Włącz"
                MouseArea {
                    anchors.fill: parent
                    onClicked: actions.setOnLight(system.light_2.idDev)
                }
            }

            SetButton {
                id: setOffBtn

                text: "Wyłącz"
                MouseArea {
                    anchors.fill: parent
                    onClicked: actions.setOffLight(system.light_2.idDev)
                }
            }
        }


    }

    Column {
        id: timeColumn

        anchors.top: setRow.bottom
        anchors.topMargin: style.spacingMain
        spacing: 5

        enabled: system.light_2.automation
        opacity: system.light_2.automation ? 1
                                           : 0.3

        Row {
            Text {
                id: startTimeText

                anchors.verticalCenter: parent.verticalCenter

                text: qsTr("Czas działania: ")
            }
            RangeSlider {
                id: timeoutRangeSlider

                anchors.verticalCenter: parent.verticalCenter

                activeInternal: system.light_2.modeTime
                first.value: calculate_time_toInt(system.light_2.startTime_init)
                second.value: calculate_time_toInt(system.light_2.stopTime_init)

                first.onValueChanged: {
                    system.light_2.modeTime ? actions.setRangeLightsStart(system.light_2.idDev, first.value)
                                       : actions.setRangeLightsStop(system.light_2.idDev, first.value)
                }
                second.onValueChanged: {
                    system.light_2.modeTime ? actions.setRangeLightsStop(system.light_2.idDev, second.value)
                                       : actions.setRangeLightsStart(system.light_2.idDev, second.value)
                }
            }
        }

        Text {
            id: tangeSliderText

            text: system.light_2.startTime + " - " + system.light_2.stopTime
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Switch {
        id: rangeCheck

        anchors.verticalCenter: timeColumn.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        checked: system.light_2.modeTime
        onCheckedChanged: actions.setModeTimeLights(system.light_2.idDev, checked)

        enabled: system.light_2.automation
        opacity: system.light_2.automation ? 1
                                           : 0.3
        Text {

            anchors.left: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 15
            text: system.light_2.modeTime ? qsTr("Tryb Dzienny")
                                          : qsTr("Tryb Nocny")
            font.pointSize: 12
        }
    }

    Row {
        id: pwmRow

        anchors.top: timeColumn.bottom
        anchors.topMargin: style.spacingMain
        anchors.left: root.left
        spacing: 57

        Text {
            id: pwmText

            text: qsTr("Jasność:")
        }

        Slider {
            id: pwmSlider
            value: system.light_2.pwm
            onValueChanged: {
                actions.setLightsPwm(system.light_2.idDev, value)
            }
        }
    }

    Text {
        id: pwmValueText
        anchors.left: pwmRow.right
        anchors.verticalCenter: pwmRow.verticalCenter

        text: system.light_2.pwm
        font.pointSize: 16
    }

    Switch {
        id: softStartCheck

        anchors.verticalCenter: pwmRow.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        checked: system.light_2.softStart
        onCheckedChanged: actions.setLightsSoftStart(system.light_2.idDev, checked)

        Text {

            anchors.left: parent.right
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 15
            text: system.light_2.softStart ? qsTr("Soft Start")
                                          : qsTr("Normal")
            font.pointSize: 12
        }
    }
}
