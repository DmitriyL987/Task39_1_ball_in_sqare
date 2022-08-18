import QtQuick
import QtQuick.Controls
import Task39_Circle_in_Sqare

Rectangle {
    width: Constants.width
    height: Constants.height
    color: Constants.backgroundColor

    id: _scene
    anchors.fill: parent
    layer.enabled: true
    state: "baseState"

    Rectangle {
        id: _leftRect
        color: "#9e9ed9"
        width: _scene.width / 10
        height: _leftRect.width
        x: _leftRect.width / 2 + 20
        y: _scene.height / 2 - height / 2 - 20
        border.color: "black"
        border.width: 4
        radius: width / 20
        Text {
            anchors.centerIn: parent
            font.family: "Rockwell Extra Bold"
            font.pointSize: 16
            text: "Move"
        }
        MouseArea {
            id: mouseArea
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            Connections {
                target: mouseArea
                onClicked: {
                    if ((_ring.x + _ring.width)  < _rightRect.x ) {
                        _ring.x += _scene.width / 10
                        _scene.state = "otherState"
                    } else
                        _scene.state = "baseState"
                }
            }
        }
    }

    Rectangle {
        id: _rightRect
        color: "#9e9ed9"
        width: _scene.width / 10
        height: _rightRect.width
        x: _scene.width - (width * 1.5 + 20)
        y: _scene.height / 2 - height / 2 - 20
        border.color: "black"
        border.width: 4
        radius: width / 20
        Text {
            anchors.centerIn: parent
            font.family: "Rockwell Extra Bold"
            font.pointSize: 16
            text: "Return"
        }
        MouseArea {
            id: mouseArea1
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            Connections {
                target: mouseArea1
                onClicked: {
                    _scene.state = "baseState"
                }
            }
        }
    }

    Rectangle {
        id: _ring
        color: "#039703"
        x: (_leftRect.x + _leftRect.width * 0.2 / 2)
        y: (_leftRect.y + _leftRect.height * 0.2 / 2)
        width: _leftRect.width * 0.8
        height: _leftRect.height * 0.8
        border.color: "#023610"
        border.width: 2
        radius: width / 2
    }

    states: [
        State {
            name: "baseState"
            PropertyChanges {
                target: _ring
                x: (_leftRect.x + _leftRect.width * 0.2 / 2)
            }
        },
        State {
            name: "otherState"
            PropertyChanges {
                target: _ring
                x: _ring.x
            }
        }
    ]

    transitions: [
        Transition {
            from: "otherState"
            to: "baseState"
            NumberAnimation {
                property: "x"
                duration: 1000
                easing.type: Easing.OutBounce
            }
        }
    ]
}
