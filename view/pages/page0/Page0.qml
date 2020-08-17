import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.4

import DRIVERS 1.0

import "../../controls"

Pane {
    anchors.fill: parent
    background: Rectangle {color: style.backgroundColor }


    Rectangle {
        id: infoArea

        anchors.top: parent.top
        anchors.topMargin: style.margin
        anchors.left: parent.left
        anchors.leftMargin: style.margin
        anchors.bottom: parent.bottom
        anchors.bottomMargin: style.margin * 2
        width: parent.width/2

        color: style.accentColor

        Text {
            id: infoText

            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: style.margin

            text: qsTr("Stan urządzeń:")
            font.pointSize: 14
            font.bold: true

        }

        Column {
            anchors.left: parent.left
            anchors.leftMargin: style.margin
            anchors.top: infoText.bottom
            anchors.topMargin: style.margin

            spacing: 15
            Text {
                text: qsTr("Temperatura")
            }
            Text {
                text: qsTr("Grzałka")
            }
            Row {

                spacing: 10

                Text {
                    text: qsTr("PH: 6.8")
                }
                Text {
                    text: qsTr("kH: 5")
                }
                Text {
                    text: qsTr("CO2: 23")
                }
            }

            Row {
                Text {
                    text: qsTr("Lampa 1: ")
                }
                Text {
                    text: system.light_1.status === Light.Off ? "OFF"
                                                              : "ON"
                    color: system.light_1.status === Light.Off ? "red"
                                                               : "green"
                }
            }


            Row {
                Text {
                    text: qsTr("Lampa 2: ")
                }
                Text {
                    text: system.light_2.status === Light.Off ? "OFF"
                                                              : "ON"
                    color: system.light_2.status === Light.Off ? "red"
                                                               : "green"
                }
            }
            Text {
                text: qsTr("Lampa UV")
            }
            Text {
                text: qsTr("Wentylator")
            }
        }
    }



    Rectangle {
        id: mainBox

        anchors.right: parent.right
        anchors.rightMargin: 15
        anchors.verticalCenter: parent.verticalCenter
        width: 400
        height: 350

        color: "blue"
        border.color: "black"

        Rectangle {
            anchors.left: parent.left
            anchors.leftMargin: 1
            anchors.right: parent.right
            anchors.rightMargin: 1
            anchors.top: parent.top
            height: parent.border.width
            color: parent.color
        }

        Rectangle {
            anchors.left: parent.left
            anchors.bottom: parent.top
            width: 1
            height: 20
            color: parent.border.color
        }

        Rectangle {
            anchors.right: parent.right
            anchors.bottom: parent.top
            width: 1
            height: 20
            color: parent.border.color
        }
    }
}
