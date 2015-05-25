import QtQuick 2.0
import QtQuick.Controls 1.3
import QtQuick.Controls.Styles 1.2
import QtQuick.Layouts 1.1

Rectangle {
    height: parent.height
    width: parent.width
    color: "transparent"

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
                onClicked: notes.color = "black"
            }

            ColorButton {
                colorSelect: "grey"
                onClicked: notes.color = "grey"
            }

            ColorButton {
                colorSelect: "red"
                onClicked: notes.color = "red"
            }

            ColorButton {
                colorSelect: "blue"
                onClicked: notes.color = "blue"
            }

            ColorButton {
                colorSelect: "green"
                onClicked: notes.color = "green"
            }

            ColorButton {
                colorSelect: "yellow"
                onClicked: notes.color = "yellow"
            }

            Image {
                id: arrow
                source: "qrc:/img/arrow-down-16.png"
                state: "close"
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
            }
        }
    }

    Rectangle {
        id: background
        color: "white"
        opacity: 0.6
        height: parent.height - topMenu.height
        width: parent.width - 2
        x: 2
        anchors.top: topMenu.bottom
        anchors.topMargin: 2

        TextEdit {
            id: notes
            height: parent.height
            width: parent.width
            wrapMode: TextInput.WordWrap
            antialiasing: true

            font.family: "Arial"
            font.pixelSize: 18
            color: "black"

        }
    }
}

