import QtQuick 2.0
import QtQuick.Controls 1.3

Rectangle {
    height: parent.height
    width: parent.width

    TextArea {
        id: notes

        x: 2
        y: 5
        height: parent.height - 10
        width: parent.width - 5

        font.family: "Helvetica"
    }
}

