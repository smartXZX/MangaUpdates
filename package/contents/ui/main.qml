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

Item {
	id: root
	height: 200
	width: 800
    property int minimumWidth: 600
    //property int minimumHeight: 210
    anchors.fill: parent
    
	PlasmaCore.DataSource {
		id: mangaSources
		engine: "mangaengine"
		
		connectedSources: sources
	}
	
	PlasmaCore.DataModel {
			id: mangaModel
			dataSource: mangaSources
	}
	
	ListView {
		id: updatesList
		anchors.fill: parent
		
		model: mangaModel
		
		delegate: updatedItem
	}
	
	Component {
		id: updatedItem
		
		PlasmaComponents.ListItem {
			
		function readValues(mangaChapters) {
			var tmp = ""
			for (var prop in mangaChapters) {
				//tmp.push(mangaChapters[prop])
				tmp = tmp + mangaChapters[prop]['chapter'] + "\n"
				//console.log(mangaChapters[prop]['chapter'])
			}
			tmp = tmp.slice(0,-1)
			console.log(tmp[0]['chapter'] + " Loaded")
			//return allChaps
			return tmp
		}
		
		function getDescription(url) {
			var req = new XMLHttpRequest();
			req.open('GET', url, true);
			req.setRequestHeader("Content-Type", "text/xml");
			req.send();
			
			req.onreadystatechange = function() {
				if (req.readyState == XMLHttpRequest.DONE) {
					var tmp = req.responseText.split("<p class=\"summary")[1];
					var tmp2 = tmp.split("<\/p>")[0];
					if (tmp2[0] == "\"") {
						updateElement.mangaDescription = tmp2.substring(2);
					} else {
						updateElement.mangaDescription = tmp2.substring(7);
					}
				}
			//console.log(retval);
			}
		}
		
		UpdateElement {
			id: updateElement
			width: parent.width
			mangaTitle: title
			mangaDate: date
			mangaChapters: readValues(chapters)
			flag: hot_new
			//mangaDescription: getDescription(descr_url)
			
			Component.onCompleted: {
				getDescription(descr_url)
			}
		}
		
		/*MouseArea { 
			anchors.fill: parent
			onClicked: readValues(chapters)
		}*/
		}
	}
	
	
	
}
