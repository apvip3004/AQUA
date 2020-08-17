import QtQuick 2.12

Item {

    Loader {
        id: loader

        anchors.fill: parent

        source: ""
    }

    states: [
        State {
            name: 'initial'
            when: system.stateMachine.Init
            PropertyChanges { target: loader; source: ""}
        },
        State {
            name: 'operational'
            when: system.stateMachine.Operational
            PropertyChanges { target: loader; source: "qrc:///view/SwipeViewApp.qml"}
        }
    ]
}

