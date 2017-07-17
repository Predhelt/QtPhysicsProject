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
    x: 25
    border.width: 1
    color: Qt.rgba(Math.random()*255, Math.random()*255, Math.random()*255, 255)

    Timer {
        id: timer;
        interval: i; running: true; repeat: true;
        onTriggered: {
            speedY += acceleration*i/1000;
            y -= speedY;
            x += speedX;
            if(ball.x < 0) // left
            {
                ball.x = 0;
                speedX = 1-speedX;
            }
            else if(ball.x+ball.width > ball.parent.width) // right
            {
                ball.x = ball.parent.width-ball.width;
                if(speedX > 0)
                    speedX = 1-speedX;
                else if(speedX < 0)
                    speedX = -speedY-1;
            }
            if(ball.y < 0) // top
            {
                ball.y = 0;
                if(speedY > 0)
                    speedY = 1-speedY;
                else if(speedY < 0)
                    speedY = -speedY-1;
            }
            else if(ball.y+ball.height > ball.parent.height) // bottom
            {
                ball.y = ball.parent.height-ball.height;
                if(speedY > 1)
                    speedY = 1-speedY;
                else if(speedY < 1)
                    speedY = -speedY-1;
                else
                    speedY = 0
                if(speedX === 0)
                    stillCount++;
                if(stillCount === 3)
                    timer.running = false;
            }
            else
                stillCount = 0;
        }
    }

    MouseArea {
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        onPressed: {
            speedX = 0
            speedY = 0
            timer.running = false
        }
        onReleased: timer.running = true
    }
}
