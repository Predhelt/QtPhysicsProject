import QtQuick 2.7

Page1Form {
    id: pg1
    width: parent.width
    height: parent.height
    anchors.centerIn: parent
    property double gravity: -9.8
    property var component: Qt.createComponent("Ball.qml")
    property var balls: []
    property int maxBalls: 5
    btnBall.onClicked: {
        firstBall.enabled = true
        var newBall = component.createObject(pg1)
        if(component.status === Component.Error)
            console.debug("Error:"+ component.errorString() )
        else if(component.status === Component.Ready)
            balls.push(newBall)
        newBall.z = 0
    }
    Ball {
        id: firstBall
    }
}
