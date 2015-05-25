import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1
import Qt.labs.settings 1.0

Rectangle {
    height: parent.height
    width: parent.width
    color: "transparent"
    property int originalWidth

    Rectangle {
        id: topMenu
        color: "white"
        x: 0
        y: 0
        width: originalWidth
        height: 30
        state: "close"

        states: [
             State {
                name: "close"
                PropertyChanges { target: topMenu; width: 0 }
                PropertyChanges { target: background; width: 0 }
                PropertyChanges { target: fontDecrease; visible: false }
                PropertyChanges { target: fontIncrease; visible: false }
                PropertyChanges { target: buttonBlack; visible: false }
                PropertyChanges { target: buttonBlue; visible: false }
                PropertyChanges { target: buttonGreen; visible: false }
                PropertyChanges { target: buttonGrey; visible: false }
                PropertyChanges { target: buttonRed; visible: false }
                PropertyChanges { target: buttonYellow; visible: false }
                PropertyChanges { target: background; visible: false }
                PropertyChanges { target: topMenu; color: "transparent" }
            },
            State {
               name: "open"
               PropertyChanges { target: topMenu; width: originalWidth }
               PropertyChanges { target: background; width: originalWidth - 2 }
               PropertyChanges { target: fontDecrease; visible: true }
               PropertyChanges { target: fontIncrease; visible: true }
               PropertyChanges { target: buttonBlack; visible: true }
               PropertyChanges { target: buttonBlue; visible: true }
               PropertyChanges { target: buttonGreen; visible: true }
               PropertyChanges { target: buttonGrey; visible: true }
               PropertyChanges { target: buttonRed; visible: true }
               PropertyChanges { target: buttonYellow; visible: true }
               PropertyChanges { target: background; visible: true }

           }
        ]

        transitions: [
            Transition {
                NumberAnimation {
                    property: "width"; easing.type: Easing.InOutQuad
                    duration: 200
                }
            }
        ]

        RowLayout {
            id: menuLayout
            x: 5
            y: 2
            spacing: 5

            Rectangle {
                id: menuIcon
                color: "transparent"
                height: 20
                width: 20

                ColumnLayout {
                    spacing: 4
                    Repeater {
                        model: 3
                        Rectangle {
                            color: "#509ddd"
                            width: 20
                            height: 4
                            radius: 2
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            if (topMenu.state === "open")
                                topMenu.state = "close";
                            else
                                topMenu.state = "open";
                        }
                    }
                }

            }

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
                id: buttonBlack
                colorSelect: "black"
                onClicked: notes.color = "black"
            }

            ColorButton {
                id: buttonGrey
                colorSelect: "grey"
                onClicked: notes.color = "grey"
            }

            ColorButton {
                id: buttonRed
                colorSelect: "red"
                onClicked: notes.color = "red"
            }

            ColorButton {
                id: buttonBlue
                colorSelect: "blue"
                onClicked: notes.color = "blue"
            }

            ColorButton {
                id: buttonGreen
                colorSelect: "green"
                onClicked: notes.color = "green"
            }

            ColorButton {
                id: buttonYellow
                colorSelect: "yellow"
                onClicked: notes.color = "yellow"
            }

        }

        /*Image {
            id: arrow
            source: "qrc:/img/arrow-down-16.png"
            state: "close"
            anchors.right: topMenu.right
            anchors.rightMargin: 7
            anchors.verticalCenter: topMenu.verticalCenter
            rotation: 0

            states: [
                State {
                    name: "open"
                    PropertyChanges {
                        target: arrow
                        rotation: 180
                    }
                    PropertyChanges {
                        target: background
                        visible: true
                    }
                },
                State {
                    name: "close"
                    PropertyChanges {
                        target: arrow
                        rotation: 0
                    }
                    PropertyChanges {
                        target: background
                        visible: false
                    }
                }
            ]

            transitions: Transition {
                NumberAnimation {
                    properties: "rotation"; easing.type: Easing.Linear
                    duration: 300
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (arrow.state === "close")
                        arrow.state = "open";
                    else
                        arrow.state = "close";
                }
            }
        }*/
    }

    Rectangle {
        id: background
        color: "white"
        opacity: 0.6
        height: parent.height - topMenu.height
        width: parent.width
        x: 2
        anchors.top: topMenu.bottom
        anchors.topMargin: 2

        TextEdit {
            id: notes
            height: parent.height
            width: parent.width
            wrapMode: TextInput.Wrap
            antialiasing: true

            font.family: "Georgia"
            font.pixelSize: 18
            color: "black"

            Settings {
                property alias text: notes.text
                property alias fontColor: notes.color
                property alias fontSize: notes.font.pixelSize
            }
        }
    }
}

