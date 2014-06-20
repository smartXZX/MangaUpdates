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

Column{
	height: 100
	width: 200
	anchors.fill: parent
	
	
	PlasmaExtras.Title { 
		text: "SHINIGAMI TANTEI TO YUUREI GAKUEN"
		wrapMode: Text.WordWrap
		anchors.right: parent.right
		anchors.left: parent.left
		font.bold: true
	}
	
	PlasmaExtras.Heading { 
		text: "Mar 3, 2014"
		level: 5
		anchors.right: parent.right
		anchors.rightMargin: 15
	}
	
	PlasmaExtras.Paragraph {
		text: "Shinigami Tantei to Yuurei Gakuen 1 The Ghost of the Old School Building" 
		//wrapMode: Text.WordWrap
		anchors.right: parent.right
		//anchors.left: parent.left
		font.bold: true
	}
}
