import QtQuick 2.0
import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12
import FishUI 1.0 as FishUI
import Cutefish.DebInstaller 1.0

Item {
    Component {
        id: informationPage

        Item {
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: FishUI.Units.largeSpacing

                GridLayout {
                    columns: 2
                    columnSpacing: FishUI.Units.largeSpacing * 2

                    Label {
                        text: qsTr("Maintainer")
                        visible: Installer.maintainer
                    }

                    Label {
                        text: Installer.maintainer
                        visible: text !== ""
                    }

                    Label {
                        text: qsTr("Homepage")
                        visible: Installer.homePage
                    }

                    Label {
                        id: homePageLabel
                        text: "<a href=\"%1\">%1</a>".arg(Installer.homePage)
                        linkColor: FishUI.Theme.highlightColor
                        visible: Installer.homePage

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: Qt.openUrlExternally(Installer.homePage)
                        }
                    }

                    Label {
                        text: qsTr("Installed Size")
                        visible: Installer.installedSize
                    }

                    Label {
                        text: Installer.installedSize
                        visible: text
                    }

                    Label {
                        text: qsTr("Description")
                        visible: Installer.description
                    }

                    Label {
                        text: Installer.description
                        visible: text
                    }
                }

                Item {
                    Layout.fillHeight: true
                }
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.leftMargin: FishUI.Units.largeSpacing
        anchors.rightMargin: FishUI.Units.largeSpacing
        anchors.bottomMargin: FishUI.Units.largeSpacing

        Image {
            width: 64
            height: width
            sourceSize: Qt.size(width, height)
            source: "image://icontheme/application-x-deb"
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
        }

        Label {
            id: packageName
            text: Installer.packageName
            font.pointSize: 15
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
        }

        Label {
            id: version
            text: qsTr("Version: ") + Installer.version
            color: FishUI.Theme.disabledTextColor
            Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
        }

        Item {
            height: FishUI.Units.smallSpacing
        }

        TabBar {
            Layout.fillWidth: true

            TabButton {
                text: qsTr("Information")
            }
            TabButton {
                text: qsTr("Included Files")
            }
        }

        StackView {
            Layout.fillHeight: true
            Layout.fillWidth: true
            initialItem: informationPage
        }

        RowLayout {
            spacing: FishUI.Units.largeSpacing

            Button {
                Layout.fillWidth: true
                text: qsTr("Cancel")
                onClicked: Qt.quit()
            }
            Button {
                Layout.fillWidth: true
                text: qsTr("Install")
                flat: true
                onClicked: Installer.install()
            }
        }
    }
}