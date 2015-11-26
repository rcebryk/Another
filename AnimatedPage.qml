import QtQuick 2.0
import QtQuick.Controls 1.4

Item {

    Button {
        id: startButton
        anchors.centerIn: parent
        text: "Start Animations"
        onClicked: buttonAnimations.start();
    }

    SequentialAnimation {
        id: buttonAnimations
        loops: -1
        RotationAnimation {
            from: 0
            to: 360
            target: startButton
            property: "rotation"
        }
        PropertyAnimation {
            target: startButton
            property: "width"
            to: 2*startButton.width
        }
        PropertyAnimation {
            target: startButton
            property: "width"
            to: startButton.width
        }
        RotationAnimation {
            target: startButton
            to: 0
            property:  "rotation"
        }
    }

}

