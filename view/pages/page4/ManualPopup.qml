import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

import "../../controls"

Popup {
    id: root

    property int idPomp: 0

    anchors.centerIn: parent

    leftPadding: 2*style.margin
    rightPadding: 2*style.margin
    width: window.width/2
    height: window.height/2
    modal: true

    background: Rectangle {
        color: style.backgroundColor
        border.width: 1
        radius: 4
    }

    Text {
        id: infoText

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: style.margin

        text: qsTr("Podaj czas pompowania:")
    }

    Slider {
        id: timeSecSlider

        anchors.top: infoText.bottom
        anchors.topMargin: style.margin
        anchors.horizontalCenter: parent.horizontalCenter

        from: 0
        to: 60
        stepSize: 1
        snapMode: RangeSlider.SnapAlways

        value: 0
    }

    Text {
        id: timeSecSliderText

        anchors.top: timeSecSlider.bottom
        anchors.topMargin: 10
        anchors.horizontalCenter: parent.horizontalCenter

        text:  timer.period + " s"
    }

    SetButton {
        id: setManualBtn

        anchors.top: timeSecSliderText.bottom
        anchors.topMargin: style.margin
        anchors.horizontalCenter: parent.horizontalCenter

        color: setManualBtnma.pressed ? style.accentLightColor
                                         : style.accentColor
        text: timer.running ? "Stop"
                            : "Start"

        MouseArea {
            id: setManualBtnma

            anchors.fill: parent
            onClicked: {

                if (timer.running) {
                    timer.stop()
                    timer.period = timeSecSlider.value
                    actions.setOffPump(system.pump_1.idDev)
                } else {
                    timer.start()
                    actions.setOnPump(system.pump_1.idDev)
                }
            }
        }
    }

    Timer {
        id: timer

        property int period: timeSecSlider.value

        interval: 1000
        running: false
        repeat: true

        onTriggered: {
            period = period - 1
            if(period < 1) {
                period = 0
                repeat = false
            }
            timeSecSlider.value = period
            console.log("timer running.. " + period)
        }
    }

    Text {
        id: levelText

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: levelSlider.right

        text: levelSlider.value + " ml"
    }

    SliderVertical {
        id: levelSlider

        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left

        value: system.pump_1.levelValue
    }

    SetButton {
        id: saveLevelButton

        anchors.top: setManualBtn.bottom
        anchors.topMargin: style.margin
        anchors.left: levelSlider.right
        anchors.leftMargin: style.margin

        color: saveLevelButtonma.pressed ? style.accentLightColor
                                         : style.accentColor
        text: "Zapisz"

        MouseArea {
            id: saveLevelButtonma
            anchors.fill: parent
            onClicked: {
                actions.setLevelValuePumps(idPomp, levelSlider.value)
            }
        }
    }
}
