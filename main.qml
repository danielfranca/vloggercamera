import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtMultimedia 5.4

ApplicationWindow {
    id: main
    title: qsTr("Vlog Self")
    width: 1136
    height: 640
    visible: true
    color: "black"

    PanelCamera {
        anchors.fill: parent
        id: panelCamera
    }
}
