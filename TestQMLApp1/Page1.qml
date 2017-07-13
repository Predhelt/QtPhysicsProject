import QtQuick 2.7

Page1Form {
    id: pg1
    property double gravity: -9.8
    property var component: Qt.createComponent("Ball.qml")
    property var balls: []
    property int maxBalls: 5
    btnBall.onClicked: {
        var newBall = component.createObject(pg1)
        if(component.status === Component.Error)
            console.debug("Error:"+ component.errorString() )
        else if(component.status === Component.Ready)
        balls.push(newBall)
        newBall.z = 0
    }
}
