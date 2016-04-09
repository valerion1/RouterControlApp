import QtQuick 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.4
import QtQuick.Window 2.0
import Qt.labs.settings 1.0

ApplicationWindow {
    visible: true;
    width: 640;
    height: 480;
    title: "Router Controller";
    visibility: settings.debugMode ? "FullScreen" : "Maximized"

    style: ApplicationWindowStyle{
        background: Rectangle{
            color: "#595959";
        }
    }

    Connections{
        target: control;
    }

    Component.onCompleted: {
        settings.pixelDensity = settings.debugMode ? 6.0 : Screen.logicalPixelDensity;
    }


    QtObject {
        id: settings

        // configurable
        property string font: "Ubuntu Mono"
        property int fontSize: 40
        property string palette: "Cute"
        property int indentSize: 4
        property bool debugging: true

        // internal
        property bool debugMode: false
        property double pixelDensity
        property string previousVersion: "0.0.0"
        property bool desktopPlatform: Qt.platform.os === "windows" ||
                                       Qt.platform.os === "linux" ||
                                       Qt.platform.os === "osx" ||
                                       Qt.platform.os === "unix"
        }
    property alias settings: settings;
}
