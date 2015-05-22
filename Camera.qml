import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    width: parent.width
    height: parent.height

    Camera {
        id: camera
        //captureMode: CaptureVideo
    }

    VideoOutput {
        id: video
        width: parent.width
        height: parent.height

        source: camera
    }
}

