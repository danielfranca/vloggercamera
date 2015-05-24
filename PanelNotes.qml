import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.2

Rectangle {
    height: parent.height
    width: parent.width

    TextArea {
        id: notes

        x: 2
        y: 5
        height: parent.height - 10
        width: parent.width - 5
        wrapMode: TextInput.WordWrap
        antialiasing: true

        font.family: "Courier"
        font.pixelSize: 14

        style: TextAreaStyle {
            renderType: Text.NativeRendering
        }

    }
}

