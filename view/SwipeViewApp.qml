import QtQuick 2.9
import QtQuick.Controls 2.4

import "pages/page0"; import "pages/page1"
import "pages/page2"; import "pages/page3"
import "pages/page4"; import "pages/page5"

SwipeView {
    id: root

    anchors.fill: parent
    currentIndex: system.pageIndex

    Item {
        id: zeroPage
        Page0 {
            id: page0
            anchors.fill: parent
        }
    }
    Item {
        id: firstPage
        Page1 {
            id: page1
            anchors.fill: parent
        }
    }
    Item {
        id: secondPage
        Page2 {
            id: page2
            anchors.fill: parent
        }
    }
    Item {
        id: thirdPage
        Page3 {
            id: page3
            anchors.fill: parent
        }
    }
    Item {
        id: fourthPage
        Page4 {
            id: page4
            anchors.fill: parent
        }
    }
    Item {
        id: fifthPage
        Page5 {
            id: page5
            anchors.fill: parent
        }
    }
    onCurrentIndexChanged: {
        actions.swipePage(currentIndex)
    }
}
