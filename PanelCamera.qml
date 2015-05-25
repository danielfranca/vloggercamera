import QtQuick 2.0
import QtMultimedia 5.0
import QtGraphicalEffects 1.0

Rectangle {
    width: parent.width
    height: parent.height

    PanelNotes {
        id: panelNotes
        z: 100
        width: video.width / 4
        height: video.height - 30
    }

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
        width: parent.width
        height: parent.height

        source: camera
    }

    Rectangle {
        id: controls
        anchors.right: video.right
        anchors.top: parent.top
        width: 60
        height: parent.height
        z: 100
        opacity: 0.5
        color: "#DEDEDE"

        Rectangle {
            id: parentButton

            radius: recordButton.radius
            width: recordButton.width + 5
            height: recordButton.height + 5
            color: "#454545"

            anchors.centerIn: parent

            Rectangle {
                id: recordButton
                radius: 50
                width: 40
                height: 40
                color: "red"

                anchors.centerIn: parent

                states: [
                    State {
                        name: "stopped"; when: camera.videoRecorder.recorderState === CameraRecorder.StoppedState
                        PropertyChanges {
                            target: recordButton; radius: 50;
                        }
                        /*PropertyChanges {
                            target: controls; opacity: 1;
                        }*/

                    },
                    State {
                        name: "recording"; when: camera.videoRecorder.recorderState === CameraRecorder.RecordingState
                        PropertyChanges {
                            target: recordButton; radius: 0;
                        }
                        /*PropertyChanges {
                            target: controls; opacity: 0.2;
                        }*/

                    }
                ]

                transitions: Transition {
                    NumberAnimation {
                        properties: "radius"; easing.type: Easing.Linear
                        duration: 300
                    }
                }

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
}

