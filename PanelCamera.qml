import QtQuick 2.0
import QtMultimedia 5.4
import QtQuick.Layouts 1.1
import QtQuick.Window 2.2

Rectangle {
    width: parent.width
    height: parent.height
    id: rootCamera

    PanelNotes {
        id: panelNotes
        z: 100
        originalWidth: video.width
        originalHeight: video.height
        height: video.height - 30
    }

    MouseArea {
        anchors.fill: parent
        onClicked: rootCamera.forceActiveFocus();
    }

    Camera {
        id: camera
        //captureMode: Camera.CaptureVideo
        videoRecorder.audioEncodingMode: CameraRecorder.ConstantBitRateEncoding
        videoRecorder.audioBitRate: 128000
        videoRecorder.mediaContainer: "mp4"
        videoRecorder.videoCodec: "h264"
        videoRecorder.frameRate: 24
        videoRecorder.resolution: Qt.size(1920, 1080)
        position: Camera.FrontFace
    }

    VideoOutput {
        id: video
        //width: parent.width
        //height: parent.height
        anchors.fill: parent
        autoOrientation: true
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

        Image {
            id: switchCameraButton
            source: "qrc:/img/switch-camera-48.png"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 5
            anchors.topMargin: 10

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if ( camera.position === Camera.FrontFace )
                        camera.position = Camera.BackFace;
                    else
                        camera.position = Camera.FrontFace;
                }
            }
        }

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
                    },
                    State {
                        name: "recording"; when: camera.videoRecorder.recorderState === CameraRecorder.RecordingState
                        PropertyChanges {
                            target: recordButton; radius: 0;
                        }
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
                            camera.captureMode = Camera.CaptureVideo;
                            camera.videoRecorder.record();
                        }
                        else
                        {
                            console.log("Stopping record")
                            camera.videoRecorder.stop();
                            camera.captureMode = Camera.CaptureViewfinder;
                            console.log("Saved at: " + camera.videoRecorder.actualLocation)
                        }
                    }
                }
            }
        }
    }
}

