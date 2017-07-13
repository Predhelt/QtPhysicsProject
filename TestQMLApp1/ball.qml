import QtQuick 2.0

Rectangle {
    id: ball
    property double acceleration: -9.8
    property double speedY: 0
    property double speedX: 0
    property int stillCount: 0
    property int i: 10

    width: 30
    height: 30
    radius: 15
    border.width: 1
    color: "red"

    Timer {
        id: timer
        interval: i; running: true; repeat: true
        onTriggered: {
            speedY += acceleration*i/1000
            y -= speedY
            x += speedX
            if(ball.x < -ball.parent.width/2) // left
            {
                ball.x = 0;
                speedX = -speedX;
            }
            if(ball.x+ball.width > ball.parent.width/2) // right
            {
                ball.x = ball.parent.width-ball.width;
                speedX = -speedX;
            }
            if(ball.y < -ball.parent.width/2) // top
            {
                ball.y = 0;
                speedY = -speedY
            }
//            if(ball.y+ball.height > ball.parent.height/2) // bottom
//            {
//                ball.y = ball.parent.height-ball.height
//                speedY = -speedY
//                if(speedX === 0)
//                    stillCount++;
//            }
        }
    }

    MouseArea {
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        onPressed: {
            speedX = 0
            speedY = 0
            ball.anchors.left = mouseX
            ball.anchors.top = mouseY
            timer.stop()
        }
        onReleased: timer.start()
    }
}
