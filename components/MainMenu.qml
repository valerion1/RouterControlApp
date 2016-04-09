import QtQuick 2.0
import QtGraphicalEffects 1.0
import "../components"

Item {
    id: mainMenu;

    Rectangle{
        id: header;
        height: 22 * settings.pixelDensity;
//        width: parent.width;
        z: 2;
        color: "#454545";

        anchors.top: parent.top;
        anchors.left: parent.left;
        anchors.right: parent.right;

        Text{
            id: label;

            font.family: "Roboto";
            font.pixelSize: 10 * settings.pixelDensity;
            font.bold: true;
            color: "#fff";

            anchors.fill: parent;
            anchors.margins: 4 * settings.pixelDensity;
            anchors.leftMargin: 15 * settings.pixelDensity;

            text: appWindow.title;
        }

        Rectangle{
            height: 1 * settings.pixelDensity;
            anchors.left: parent.left;
            anchors.right: parent.right;
            anchors.bottom: parent.bottom;

            RadialGradient {
                anchors.fill: parent
                anchors.left: parent.left;
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#00C708" }
                    GradientStop { position: 0.65; color: "#595959" }
                }
            }
        }
    }

    Column{
        id: navigateColumn;
        anchors.right: parent.right;
        anchors.left: parent.left;
        anchors.top: header.bottom;
        anchors.bottom: parent.bottom;

        NavigateButton{
            id: stateButton;
            text: "Состояние";

            color: click ? "#828282" : "#595959";

            Rectangle{
                height: 0.3 * settings.pixelDensity;
                anchors.right: parent.right;
                anchors.left: parent.left;
                anchors.bottom: parent.bottom;
                color: "#fff";
            }
        }

        NavigateButton{
            id: rebootButton;
            text: "Перезагрузка";

            color: click ? "#828282" : "#595959";

            Rectangle{
                height: 0.3 * settings.pixelDensity;
                anchors.right: parent.right;
                anchors.left: parent.left;
                anchors.bottom: parent.bottom;
                color: "#fff";
            }

            onClicked: control.reboot();
        }
    }
}

