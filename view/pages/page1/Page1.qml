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
        id: pageLight1
        background: Item {}

        Light1Area {
            id: light1_area

            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: style.margin
            anchors.right: parent.right
            height: childrenRect.height
        }

        Light2Area {
            id: light2_area

            anchors.left: parent.left
            anchors.top: light1_area.bottom
            anchors.topMargin: style.margin
            anchors.right: parent.right
            height: childrenRect.height
        }
    }
    Pane {
        id: pageLight2
        background: Item {}

        Light3Area {
            id: light3_area

            anchors.left: parent.left
            anchors.top: parent.top
            anchors.right: parent.right
            height: childrenRect.height
        }
    }

    onCurrentIndexChanged: {
        actions.swipePageVerticalLights(currentIndex)
    }
}
