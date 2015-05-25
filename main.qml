import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import SharedComponents 1.0

ApplicationWindow {
    id: main
    title: qsTr("Vlogger Camera")
    width: 1136
    height: 640
    visible: true
    property string mainColor: "#454545"

    PanelContainer {
        id: mainContainer
        anchors.fill: parent
        layout: "row"
        movable: false

        panels: [
            //{ id: "notes", container: mainContainer, qml: "qrc:/PanelNotes.qml", innerObject: null, name: "notes", percentWidth: 20, percentHeight: 30, object: null, color: mainColor },
            { id: "camera", container: mainContainer, qml: "qrc:/PanelCamera.qml", innerObject: null, name: "camera", percentWidth: 80, percentHeight: 70, object: null, color: mainColor }
        ]

    }
}
