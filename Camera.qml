import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    width: parent.width
    height: parent.height

    VideoOutput {
        id: video
        width: parent.width
        height: parent.height
    }
}

