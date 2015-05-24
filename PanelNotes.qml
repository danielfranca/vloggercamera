import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1

Rectangle {
    height: parent.height
    width: parent.width

    Rectangle {
        id: topMenu
        color: "white"
        x: 0
        y: 2
        width: parent.width
        height: 30

        RowLayout {
            id: menuLayout
            x: 5
            spacing: 5

            Image {
                id: fontDecrease
                source: "qrc:/img/decrease-font-24.png"

                MouseArea {
                    anchors.fill: parent

                    onClicked: notes.font.pointSize--;
                }
            }

            Image {
                id: fontIncrease
                source: "qrc:/img/increase-font-24.png"

                MouseArea {
                    anchors.fill: parent

                    onClicked: notes.font.pointSize++;
                }
            }

            ColorButton {
                colorSelect: "black"
                onClicked: notes.textColor = "black"
            }

            ColorButton {
                colorSelect: "grey"
                onClicked: notes.textColor = "grey"
            }

            ColorButton {
                colorSelect: "red"
                onClicked: notes.textColor = "red"
            }

            ColorButton {
                colorSelect: "blue"
                onClicked: notes.textColor = "blue"
            }

            ColorButton {
                colorSelect: "green"
                onClicked: notes.textColor = "green"
            }
        }
    }

    TextArea {
        id: notes
        x: 2
        anchors.top: topMenu.bottom
        anchors.topMargin: 2
        height: parent.height - topMenu.height - 5
        width: parent.width - 5
        wrapMode: TextInput.WordWrap
        antialiasing: true

        font.family: "Courier"
        font.pixelSize: 14
        textColor: "black"

        style: TextAreaStyle {
            renderType: Text.NativeRendering
        }

    }
}

