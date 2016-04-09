import QtQuick 2.5
import QtQuick.Controls 1.4

ApplicationWindow {
    visible: true;
    width: 640;
    height: 480;
    title: qsTr("Hello World");

    Connections{
        target: control;

        onInfo:{
            labelInfo.text = str;
        }
    }

    Rectangle{
        id: labelBox;
        anchors.centerIn: parent;

        width: 100;
        height: 50;

        Text{
            id: labelInfo;
        }
    }

    Rectangle{
        id: button;
        width: 100;
        height: 100;
        anchors.top: labelBox.bottom;
        anchors.horizontalCenter: parent.horizontalCenter;
        color: mAreaButton.pressed ? "red" : "black";

        MouseArea{
            id: mAreaButton;
            anchors.fill: parent;

            onClicked: {
                control.reboot();
            }
        }
    }

}

