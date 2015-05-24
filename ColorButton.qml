import QtQuick 2.0

Rectangle {
    width: 25
    height: 25
    color: "black"

    property alias colorSelect: innerColor.color
    signal clicked

    Rectangle {
        id: innerColor
        anchors.centerIn: parent
        width: 23
        height: 23

    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: {
            console.log("Inner clicked")
            parent.clicked()
        }
    }
}

