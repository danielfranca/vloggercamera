import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    width: parent.width
    height: parent.height

    Camera {
        id: camera
        captureMode: Camera.CaptureVideo
        videoRecorder.audioEncodingMode: CameraRecorder.ConstantBitRateEncoding
        videoRecorder.audioBitRate: 128000
        videoRecorder.mediaContainer: "mp4"
        videoRecorder.videoCodec: "h264"
        videoRecorder.frameRate: 24
        videoRecorder.resolution: Qt.size(1920, 1080)
        //videoRecorder.outputLocation: "/Users/dfranca"
    }

    VideoOutput {
        id: video
        width: parent.width - 50
        height: parent.height

        source: camera
    }


    Rectangle {
        id: controls
        anchors.left: video.right
        anchors.top: parent.top
        width: 50
        height: parent.height

        color: "#DEDEDE"

        Rectangle {
            id: recordButton
            radius: 50
            width: 40
            height: 40
            color: "red"
            //visible: camera.videoRecorder.recorderStatus == CameraRecorder.LoadedStatus

            anchors.centerIn: parent

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    if (camera.videoRecorder.recorderState === CameraRecorder.StoppedState)
                    {
                        console.log("Starting record")
                        camera.videoRecorder.record();
                    }
                    else
                    {
                        console.log("Stopping record")
                        camera.videoRecorder.stop();
                        console.log("Saved at: " + camera.videoRecorder.actualLocation)
                    }
                }
            }
        }
    }
}

