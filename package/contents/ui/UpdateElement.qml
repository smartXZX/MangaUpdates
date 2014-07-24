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
	
	property alias mangaTitle: title.text
	property alias mangaDate: date.text
	property alias mangaChapters: chapters.text
	
	width: 200
	height: title.height + chapters.height + date.height + 4
	
	checkable: false
	
	
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
		width: parent.width - 10
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
	
	Rectangle{
		id: hot
		color: "red"
		width: 20
		height: parent.height
		radius: 10
		opacity: 0.1
	}
	
	
}