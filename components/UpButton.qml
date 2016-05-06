import QtQuick 2.0

Rectangle{
    id: upButton;
    color: "transparent";
    width: image.width * settings.pixelDensity;
    height: image.height * settings.pixelDensity;
    opacity: 0;

    signal clicked();

    Behavior on opacity{
        NumberAnimation{
            duration: 1500;
            easing.type: Easing.InOutQuint;
        }
    }

    Image {
        id: image;
        width: (sourceSize.width * 0.1) * settings.pixelDensity;
        height: (sourceSize.height * 0.1) * settings.pixelDensity;
        anchors.bottom: parent.bottom;
        anchors.horizontalCenter: parent.horizontalCenter;
        source: "qrc:/img/resource/but_up.png";
        opacity: nouseArea.pressed ? 1 : 0.8;
    }

    MouseArea{
        id: nouseArea;
        anchors.fill: parent;

        onClicked: upButton.clicked();
    }
}

