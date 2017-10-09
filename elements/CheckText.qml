import QtQuick 2.7
import QtQuick.Controls 1.5
import "../moduls/"

Text
{
    id: main
    signal clicked();
    property bool check: false

    anchors.fill: parent
    text:  "TEXT"
    color: check?"Salmon":fonColor
    horizontalAlignment: Text.AlignHCenter
    font.bold: true
    font.pixelSize: parent.height/1.5
    MouseArea
    {
        anchors.fill: parent
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        onClicked: main.clicked()
    }
}
