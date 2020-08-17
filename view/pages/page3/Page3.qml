import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.4


import DRIVERS 1.0

import "../../controls"

SwipeView {
    id: root
    anchors.fill: parent

    orientation: Qt.Vertical
    background: Rectangle {color: style.backgroundColor }

    Pane {
        id: pagePump1
        background: Item {}

        WaterPump1Area {
            id: pump1_area

            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: style.margin
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: style.margin
        }
    }
    onCurrentIndexChanged: {
        actions.swipePageVerticalPumps(currentIndex)
    }
}
