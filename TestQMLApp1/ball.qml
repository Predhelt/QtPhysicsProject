import QtQuick 2.0

//TODO: figure out how to simulate air friction. If moving horizontally, the ball should
//slow down at a realistic speed.  Same with vertically.  currently, terminalV simulates that,
//but not requiring it would be neat.

Rectangle {
    id: ball
    property double acceleration: 0
    readonly property int terminalV: 30
    property double speedY: 0
    property double speedX: 4
    property bool mousePressed: false
    property int cursorX
    property int cursorY
    property int stillCount: 0
    property int i: 16

    width: 30
    height: 30
    radius: 15
    x: 25
    border.width: 1
    color: Qt.rgba(Math.random()%255, Math.random()%255, Math.random()%255, 255)

    Timer {
        id: timer;
        interval: i; running: true; repeat: true;
        onTriggered: {
            if(mousePressed)
                ;
            else
            {
                speedY += acceleration*i/100;
                y -= speedY;
                x += speedX;
                if(speedY > terminalV)
                    speedY = terminalV;
                if(speedX > terminalV*2)
                    speedX = terminalV*2;
                else if(speedY < -terminalV)
                    speedY = -terminalV;
                checkPosition();
            }
        }
    }

    MouseArea {
        id: ma
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        property int msX // mouse speed X
        property int msY // mouse speed Y
        onPressed: {
            speedX = 0
            speedY = 0
            cursorX = mouseX
            cursorY = mouseY
            mousePressed = true
        }
        onReleased: {
            speedX = msX
            speedY = msY
            stillCount = 0
            mousePressed = false
            timer.running = true
        }
        onPositionChanged: {
            ball.x += mouseX - cursorX
            ball.y += mouseY - cursorY
            msX = mouseX - cursorX
            msY = cursorY - mouseY
            checkPosition() //FIXME: This is not efficient, but works to prevent the
            //ball from going out of the window.
            speedX = 0
            speedY = 0
        }
    }

    function checkPosition() {
        if(ball.y+ball.height > ball.parent.height) // bottom
        {
            ball.y = ball.parent.height-ball.height;
            if(speedY > 1)
                speedY = 0.5-speedY;
            else if(speedY < 1)
                speedY = -speedY-0.5;
            else
                speedY = 0
            if(speedX < -0.01)
                speedX+=0.01
            else if(speedX > 0.01)
                speedX-=0.01
            else {
                speedX = 0
                stillCount++;
            }
            if(stillCount === 3)
                timer.running = false;
            return;
        }
        else if(ball.y < 0) // top
        {
            ball.y = 0;
            if(speedY > 0)
                speedY = -speedY;
            if(speedY < -0.1)
                speedY+=0.5;
            if(speedX < 0)
                speedX+=0.1
            else if(speedX > 0)
                speedX-=0.1
        }
        if(ball.x < 0) // left
        {
            ball.x = 0;
            speedX = -speedX-0.5;
        }
        else if(ball.x+ball.width > ball.parent.width) // right
        {
            ball.x = ball.parent.width-ball.width;
            speedX = 0.5-speedX;
        }
        stillCount = 0;
    }
}
