import QtQuick 2.0
import "../components"

Rectangle{
    id: navButton;

    property alias text : caption.text;
    property alias click: mouseArea.pressed;
    signal clicked();

    height: 19 * settings.pixelDensity;
    anchors.right: parent.right;
    anchors.left: parent.left;

    Text{
        id: caption;
        anchors.fill: parent;
        anchors.margins: 5 * settings.pixelDensity;

        font.pixelSize: 8 * settings.pixelDensity;
        color: "white";
    }

    MouseArea{
        id: mouseArea;

        anchors.fill: parent;
        onClicked: navButton.clicked();
    }
}

