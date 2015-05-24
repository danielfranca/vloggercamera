import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import SharedComponents 1.0

ApplicationWindow {
    id: main
    title: qsTr("Vlogger Camera")
    width: 900
    height: 480
    visible: true

    PanelContainer {
        id: mainContainer
        anchors.fill: parent
        layout: "row"
        movable: false

        panels: [
                    { id: "notes", container: mainContainer, qml: "qrc:/PanelNotes.qml", innerObject: null, name: "notes", percentWidth: 20, percentHeight: 30, object: null },
                    { id: "camera", container: mainContainer, qml: "qrc:/PanelCamera.qml", innerObject: null, name: "camera", percentWidth: 80, percentHeight: 70, object: null }
        ]

    }
}
