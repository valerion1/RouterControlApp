import QtQuick 2.5
import QtQuick.Controls 1.4
import "components"

RApplicationWindow{
    id: appWindow;

    StackView{
        id: stackView;
        anchors.fill: parent;
        initialItem: MainMenu {}
    }
}

