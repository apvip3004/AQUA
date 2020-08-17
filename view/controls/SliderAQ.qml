import QtQuick 2.12
import QtQuick.Controls 2.4
import QtQuick.Controls.Styles 1.4

Slider {
    id: control

    width: 300
    height: 20

    from: 0
    to: 100
    stepSize: 1

    background: Rectangle {
        x: control.leftPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2
        implicitWidth: 200
        implicitHeight: 6
        width: control.availableWidth
        height: implicitHeight
        radius: 2
        color: style.accentColor

        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            color: style.activeSliderColor
            radius: 2
        }
    }
}
