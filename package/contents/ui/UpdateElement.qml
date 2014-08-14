/***************************************************************************
 *   Copyright (C) %{CURRENT_YEAR} by %{AUTHOR} <%{EMAIL}>                            *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA .        *
 ***************************************************************************/

import QtQuick 1.1
import org.kde.plasma.core 0.1 as PlasmaCore
import org.kde.plasma.components 0.1 as PlasmaComponents
import org.kde.plasma.extras 0.1 as PlasmaExtras



PlasmaComponents.Button {
	id: element
	
	property alias mangaTitle: title.text
	property alias mangaDate: date.text
	property alias mangaChapters: chapters.text
	property alias mangaDescription: toolTip.subText
	property string flag: ""
	
	width: 200
	height: title.height + chapters.height + date.height + 4
	
	checkable: true	
	
	PlasmaExtras.Title {
		id: title
		y: 1
		x: 5
		width: parent.width - 10 
		text: "Really long manga title with some random text"
		elide: Text.ElideRight
	}
	
	PlasmaExtras.Heading {
		id: date
		y: title.height
		width: parent.width - 25
		horizontalAlignment: Text.AlignRight 
		text: "Today"
		level: 5
	}
	
	PlasmaExtras.Heading {
		id: chapters
		
		y: title.height + date.height
		x: 8
		width: parent.width - 10
		text: "some chapter\nsome chapter"
		horizontalAlignment: Text.AlignLeft
		elide: Text.ElideRight 
		level: 4
	}
	
	Component {
		id: hotFlag
		
		Rectangle{
			color: "red"
			width: 20
			height: element.height
			radius: 3
			opacity: 0.2
			x: element.width - 20
			
			Text {
				text: "HOT"
				rotation: -90
				color: "white"
				anchors.centerIn: parent
				font.bold: true
			}
		}
	}
	
	Component {
		id: newFlag
		
		Rectangle{
			color: "blue"
			width: 20
			height: element.height
			radius: 3
			opacity: 0.2
			x: element.width - 20
			
			Text {
				text: "NEW"
				rotation: -90
				color: "white"
				anchors.centerIn: parent
				font.bold: true
			}
		}
	}
	
	PlasmaCore.ToolTip {
        id: toolTip
        target: element
        mainText: mangaTitle
        // subText: Get.getDescription(mangaDescription)
    }

	
	Loader {
		id: flagLoader
		//anchors.fill: parent
		
		state: if (element.flag == "hot") {
			"HOT";
		} else if (element.flag == "new") {
			"NEW";
		} else "NORMAL";
		
		states:[
			State {
				name: "HOT"
				PropertyChanges {
					target: flagLoader
					sourceComponent: hotFlag
				}
			},
			
			State {
				name: "NEW"
				PropertyChanges {
					target: flagLoader
					sourceComponent: newFlag
				}
			}
		]
	}
	
	
}