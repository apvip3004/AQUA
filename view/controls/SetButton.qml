import QtQuick 2.0

Rectangle {
    id: control

    property string text: "Button"

    implicitWidth: childrenRect.width + 10*2
    implicitHeight: childrenRect.height + 10*2

    color: ma.pressed ? style.accentLightColor
                             : style.accentColor
    border.color: "white"

    radius: 5

    Text {
        id: backText

        anchors.centerIn: parent
        text: parent.text
        color: "white"

        font.pointSize: 14
    }
    MouseArea {
        id: ma
        anchors.fill: parent
    }
}
