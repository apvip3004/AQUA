import QtQuick 2.12
import QtQuick.Controls 2.4

RangeSlider{
    id: sliderRange

    property var activeInternal: true
    property var colorSection1: activeInternal ? style.accentColor
                                               : style.activeSliderColor
    property var colorSection2: activeInternal ? style.activeSliderColor
                                               : style.accentColor
    width: 300

    from: 0
    to: 1439
    stepSize: 5
    snapMode: RangeSlider.SnapAlways

    function calculate_time_toInt(time) {
        time = time.replace(':','')
        var ret =  parseInt(time.charAt(0) + time.charAt(1), 10)*60
                    + parseInt(time.charAt(2) + time.charAt(3), 10)
        return ret
    }

    background: Rectangle {
        x: sliderRange.leftPadding
        y: sliderRange.topPadding + sliderRange.availableHeight/2 - height /2
        width: sliderRange.availableWidth

        implicitHeight: 6
        height: implicitHeight
        radius: 5
        color: "#bdbebf"

        Rectangle {
            id: section1
            height: parent.height
            width: sliderRange.first.visualPosition*parent.width
            radius: parent.radius
            color: colorSection1
        }

        Rectangle {
            id: section2
            x: sliderRange.first.visualPosition * parent.width
            height: parent.height
            width: sliderRange.second.visualPosition*parent.width - x
            radius: parent.radius
            color: colorSection2
        }

        Rectangle {
            id: section3
            x: sliderRange.second.visualPosition * parent.width
            height: parent.height
            width: parent.width - x
            radius: parent.radius
            color: colorSection1
        }
    }
}
