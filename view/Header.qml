import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.4

import "controls"

ToolBar {

    height: 30

    background: Rectangle {
        color: style.headerColor

    }

    Text {
        id: title

        anchors.centerIn: parent
    }

    states: [
        State {
            when: system.stateMachine.MainView
            PropertyChanges { target: title; text: ""}
        },
        State {
            when: system.stateMachine.LightView1
            PropertyChanges { target: title; text: "Światła 1/2"}
        },
        State {
            when: system.stateMachine.LightView2
            PropertyChanges { target: title; text: "Światła 2/2"}
        },
        State {
            when: system.stateMachine.WaterTemperatureView
            PropertyChanges { target: title; text: "Czujniki"}
        },
        State {
            when: system.stateMachine.WaterPumpView
            PropertyChanges { target: title; text: "Pompa Wodna"}
        },
        State {
            when: system.stateMachine.PumpView1
            PropertyChanges { target: title; text: "Pompy 1/5"}
        },
        State {
            when: system.stateMachine.PumpView2
            PropertyChanges { target: title; text: "Pompy 2/5"}
        },
        State {
            when: system.stateMachine.PumpView1
            PropertyChanges { target: title; text: "Pompy 3/5"}
        },
        State {
            when: system.stateMachine.PumpView2
            PropertyChanges { target: title; text: "Pompy 4/5"}
        },
        State {
            when: system.stateMachine.PumpView1
            PropertyChanges { target: title; text: "Pompy 5/5"}
        },
        State {
            when: system.stateMachine.PHView
            PropertyChanges { target: title; text: "PH"}
        }
    ]
}
