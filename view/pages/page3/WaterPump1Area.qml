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
        text: system.water_pump_1.name
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

        text: (system.water_pump_1.status === Light.On) ? "ON"
                                                   : "OFF"
        color: (system.water_pump_1.status === Light.On) ? "green"
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
                onClicked: actions.setOnPump(system.water_pump_1.idDev)
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
                onClicked: actions.setOffPump(system.water_pump_1.idDev)
            }

        }
    }
}
