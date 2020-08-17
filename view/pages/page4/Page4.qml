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

        Pump1Area {
            id: pump1_area

            anchors.left: parent.left
            anchors.top: parent.top
            anchors.topMargin: style.margin
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: style.margin
        }
    }
//    Pane {
//        id: pagePump2
//        background: Item {}

//        Pump2Area {
//            id: pump2_area

//            anchors.left: parent.left
//            anchors.top: parent.top
//            anchors.right: parent.right
//            height: childrenRect.height
//        }
//    }
//    Pane {
//        id: pagePump3
//        background: Item {}

//        Pump3Area {
//            id: pump3_area

//            anchors.left: parent.left
//            anchors.top: parent.top
//            anchors.right: parent.right
//            height: childrenRect.height
//        }
//    }
//    Pane {
//        id: pagePump4
//        background: Item {}

//        Pump4Area {
//            id: pump4_area

//            anchors.left: parent.left
//            anchors.top: parent.top
//            anchors.right: parent.right
//            height: childrenRect.height
//        }
//    }
//    Pane {
//        id: pagePump5
//        background: Item {}

//        Pump5Area {
//            id: pump5_area

//            anchors.left: parent.left
//            anchors.top: parent.top
//            anchors.right: parent.right
//            height: childrenRect.height
//        }
//    }

    onCurrentIndexChanged: {
        actions.swipePageVerticalPumps(currentIndex)
    }
}
