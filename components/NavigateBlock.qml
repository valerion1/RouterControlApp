import QtQuick 2.0
import "../components"

Rectangle{
    id: navButton;

    property alias text : caption.text;
    property alias click: mouseArea.pressed;
    signal clicked();

    property bool showed: false;

    height: 19 * settings.pixelDensity;
    anchors.right: parent.right;
    anchors.left: parent.left;

    Behavior on height{
        NumberAnimation { duration: 1000; easing.type: Easing.InOutQuad; }
    }

    Text{
        id: caption;
        anchors.fill: parent;
        anchors.margins: 5 * settings.pixelDensity;
        opacity: 0;

        NumberAnimation on opacity {
            id: captionOpacityAnimate;
            running: true;
            from: navButton.showed ? 1 : 0;
            to: navButton.showed ? 0 : 1;
            duration: 1500;
            easing.type: Easing.InOutQuint;
        }

        font.pixelSize: 8 * settings.pixelDensity;
        color: "white";
    }

    MouseArea{
        id: mouseArea;

        anchors.fill: parent;
        onClicked: navButton.clicked();
    }

    function show(){
        navButton.showed = true;
        navButton.height = navButton.parent.height + 1;
        captionOpacityAnimate.restart();
        mainMenu.headerTitle = navButton.text;
    }

    function hide(){
        navButton.showed = false;
        navButton.height = 19 * settings.pixelDensity - 1;
        captionOpacityAnimate.restart();
        mainMenu.headerTitle = appWindow.title;
    }


}

