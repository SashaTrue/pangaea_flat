import QtQuick 2.7
import QtQuick.Controls 1.5
import "../elements/"

Item
{
    property string fonColor: "#EBECEC"
    property string devColor: "#5E5971"
    property string devColorDis: "#7E7991"
    property string name:     "CM"
    property bool on: false
    property string nameValue: "compreccor_on"
    anchors.fill: parent
    id: main
    Rectangle
    {
        id: fon
        anchors.fill: parent
        color: devColor
        clip: true

        Material
        {
            id: material
        }

        MouseArea
        {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape:  Qt.PointingHandCursor
            onClicked:
            {
                main.on = (!main.on);
                _core.setValue("compreccor_on", main.on);
                material.start(mouseX, mouseY)
            }
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
                    id: common
                    anchors.fill: parent
                    header: name
                    on: main.on
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*80
            }

            Item
            {
                width:  parent.width
                height: parent.height/1000*165
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*165
                Dial
                {
                    enabled: main.on
                    name: "SUSTAIN"
                    checkable: false
                    nameValue: "compreccor_sustein"
                }
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
                    nameValue: "compreccor_volume"
                }
            }
            Item
            {
                width:  parent.width
                height: parent.height/1000*25
            }
        }
    }
    Connections
    {
        target: _core
        onSgReadValue:
        {
            if((main.nameValue.length>0)&&(nameParam.localeCompare(main.nameValue)==0))
            {
                main.on=value
                fon.color= main.on?devColor:devColorDis
            }
        }
    }
}
