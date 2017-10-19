import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    id: main
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property string name:     "PA"
    property bool on: false
    signal chPresence(int value)
    anchors.fill: parent
    Rectangle
    {
        anchors.fill: parent
        color: devColor
        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape:  Qt.PointingHandCursor
            onClicked: main.on = (!main.on);
        }
        Column
        {
            anchors.fill: parent
            Item
            {
                width:  parent.width
                height: parent.height/1000*70
                Common
                {
                    id:common
                    anchors.fill: parent
                    header: name
                    on: main.on
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*90
            }

            Item
            {
                width:  parent.width
                height: parent.height/1000*265
                TypePA
                {
                    enabled: main.on
                }
            }

            Item
            {
                width:  parent.width
                height: parent.height/1000*55
            }

            Item
            {
                width:  parent.width
                height: parent.height/1000*165
                Dial
                {
                    enabled: main.on
                    name: "VOLUME"
                    checkable: false
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
                Dial
                {
                    id: presence
                    enabled: main.on
                    name: "PRESENCE"
                    checkable: false
                    onChValue: main.chPresence(value)
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
                Dial
                {
                    id: slave
                    enabled: main.on
                    name: "SLAVE"
                    checkable: false
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*25
            }
        }
    }

    function setPresence(value)
    {
        presence.valueUpdateSoft(value);
    }
}

