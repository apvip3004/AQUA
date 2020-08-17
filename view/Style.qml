import QtQuick 2.12

Item {

    property int margin: 25
    property int spacingMain: 10

    // Colors
    property string backgroundColor: "#06194f" //"#01010d" //"#8bd1f7"
    property string accentColor: "#273c75"
    property string accentLightColor: "#2153db"
    property string headerColor: "#031442"
    property string activeSliderColor: "#FFCC66"

    // Fonts
    property int fontSmallSize: 12
    property int fontMediumSize: 14
    property int fontBigSize: 16
    property int fontLargeSize: 20

    property string mainFontColor: "white"

    Gradient {
        id: backgorundGradient

        GradientStop { position: 0.0; color: "#FFAD06CE" }
        GradientStop { position: 0.0904704; color: "#FFAD06CE"}
        GradientStop { position: 0.373945 ; color: "#FFAD06CE" }
        GradientStop { position: 0.755127; color: "#FFAD06CE" }
        GradientStop { position: 0.875754; color: "#FFAD06CE" }
        GradientStop { position: 1; color: "#FFAD06CE" }
    }
}
