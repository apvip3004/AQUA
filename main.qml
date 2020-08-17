import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4
import QtQuick.Controls 2.4

import "view"
import "system"


ApplicationWindow {
    id: window

    visible: true
    width: 1024
    height: 600
    title: qsTr("AQUA 2019")

    header: Header{
                id: header
            }

    Style {
        id: style
    }
// --------------------------------------------------

    ViewLoader {
        id: viewLoader

        anchors.fill: parent
    }


// --------------------------------------------------

    Rectangle {
        id: zeroPageButton

        width: backText.width
        height: backText.height

        anchors.bottom: parent.bottom
        anchors.bottomMargin: style.margin + 20
        anchors.right: parent.right
        anchors.rightMargin: 20

        color: mouseArea.pressed ? style.backgroundColor
                                 : style.accentColor
        visible: system.pageIndex !== 0 ? true : false
        border.color: "white"

        Text {
            id: backText

            anchors.centerIn: parent
            padding: 10

            text: qsTr("Wróć na główną stronę")
            color: "white"

            font.pointSize: 13
        }

        MouseArea {
            id: mouseArea
            anchors.fill: parent

            onClicked: {
                actions.backZeroPage()
            }
        }
    }

//    InputPanel {
//        id: inputPanel
//        z: 99
//        x: 0
//        y: window.height
//        width: window.width

//        states: State {
//            name: "visible"
//            when: inputPanel.active
//            PropertyChanges {
//                target: inputPanel
//                y: window.height - inputPanel.height
//            }
//        }
//        transitions: Transition {
//            from: ""
//            to: "visible"
//            reversible: true
//            ParallelAnimation {
//                NumberAnimation {
//                    properties: "y"
//                    duration: 250
//                    easing.type: Easing.InOutQuad
//                }
//            }
//        }
//    }

    System {
        id: system
    }

    Actions {
        id: actions
    }

    PageIndicator {
        id: indicator

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        count: 6
        currentIndex: system.pageIndex

        delegate: Rectangle {
            implicitWidth: 15
            implicitHeight: 15

            radius: width
            opacity: index === indicator.currentIndex ? 0.95 : pressed ? 0.7 : 0.45

            Behavior on opacity {
                OpacityAnimator {
                    duration: 100
                }
            }
        }
    }
}
