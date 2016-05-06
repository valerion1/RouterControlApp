import QtQuick 2.0
import QtGraphicalEffects 1.0
import "../components"

Item {
    id: mainMenu;

    property alias headerTitle: label.text;

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

        NavigateBlock{
            id: stateButton;
            text: "Состояние";

            color: click && !stateButton.showed ? "#828282" : "#595959";

            onClicked: {
                if(!stateButton.showed){
                    stateButton.show();
                    buttonHide.enabled = true;
                    buttonHide.opacity = 1;
                }
            }


            Rectangle{
                height: 0.3 * settings.pixelDensity;
                anchors.right: parent.right;
                anchors.left: parent.left;
                anchors.bottom: parent.bottom;
                color: "#fff";
            }

            UpButton{
                id: buttonHide;
                enabled: false;
                anchors.bottom: parent.bottom;
                anchors.horizontalCenter: parent.horizontalCenter;
                anchors.bottomMargin: 10 * settings.pixelDensity;

                onClicked:{
                    stateButton.hide();
                    buttonHide.opacity = 0;
                    buttonHide.enabled = false;
                }
            }

        }

        NavigateBlock{
            id: rebootButton;
            text: "Перезагрузка";

            color: click ? "#828282" : "#595959";

            onClicked: {
                timer.start();
                progressBar.value = 0;
                progressBar.visible = true;

                router.reboot();
            }

            RProgressBar{
                id: progressBar;

                visible: false;

                outerColor: "#595959";
                activeColor: "lightgreen";

                anchors.right: parent.right;
                anchors.rightMargin: 10 * settings.pixelDensity;
                anchors.verticalCenter: parent.verticalCenter;

                maximumValue: 100;
                minimumValue: 0;
                value: 0;


                Timer{
                    id: timer;
                    interval: 50;
                    repeat: true;
                    onTriggered:{
                        progressBar.value += 1;
                        if(progressBar.value == 100){
                            timer.stop();
                            progressBar.visible = false;
        //                    progressBar.complite();
                        }
                    }
                }
            }


            Rectangle{
                height: 0.3 * settings.pixelDensity;
                anchors.right: parent.right;
                anchors.left: parent.left;
                anchors.bottom: parent.bottom;
                color: "#fff";
            }
        }
    }


}

