import QtQuick 2.7

Page1Form {
    id: pg1
    width: parent.width
    height: parent.height
    anchors.centerIn: parent
    property double gravity: -9.81
    property var component: Qt.createComponent("Ball.qml")
    property var balls: []
    property int maxBalls: 5
    btnBall.onClicked: {
        if(balls.length < 5)
        {
            var newBall = component.createObject(pg1)
            if(component.status === Component.Error) {
                console.debug("Error:"+ component.errorString())
                return;
            }
            else if(component.status === Component.Ready) {
                newBall.acceleration = gravity
                newBall.z = 0
                balls.push(newBall)
            }
        }
    }
}
