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

PlasmaComponents.PageStack {
	id: root
	//height: 600
	//width: 800
    //property int minimumWidth: 600
    //property int minimumHeight: 300
    anchors.fill: parent
    
    initialPage: updatesList
    
	PlasmaCore.DataSource {
		id: mangaSources
		engine: "mangaengine"
		
		connectedSources: sources
	}
	
	PlasmaCore.DataModel {
			id: mangaModel
			dataSource: mangaSources
	}
	
	PlasmaComponents.Page {
		id: updatesList
		pageStack: root
		ListView {
			anchors.fill: parent
			model: mangaModel
			delegate: updatedItem
		}
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
			
			onClicked: {
				root.push(infoPage)
			}
		}
		
		}
	}
	
	PlasmaComponents.Page {
		id: infoPage
		pageStack: root
		height: root.height - infoDesc.height
		width: root.width
		
		
		Column {
			anchors.fill: parent
			Image {
				id: infoImg
			
				//height: parent.height - infoDesc.height
				
				anchors.top: parent.top
				anchors.right: parent.right
				anchors.left: parent.left
				smooth: true
				source: "cover.jpg"
				fillMode: Image.PreserveAspectFit
			}
		
			PlasmaComponents.Label {
				id: infoDesc
			
				anchors.right: parent.right
				anchors.left: parent.left
				anchors.bottom: closeDesc.top
				anchors.top: infoImg.bottom
			
				wrapMode: Text.WordWrap
				text: '<p class="summary less">From a young age, Minami Harusumi has had recurring dreams of Veronica, a princess whose kingdom is on the verge of destruction. He believes them to be recollections of his past life, and that he is her reincarnation. Because of this, he is ridiculed by his classmates. One day, when the mockery escalates into bullying, he rediscovers magic—something Veronica had studied and used. Reassured his past life is not merely a fantasy, Minami tries to learn more about his past memories and the reason behind them...</p>'
			}
			
			PlasmaComponents.Button {
				anchors.bottom: parent.bottom
				height: 20
				width: parent.width
				id: closeDesc
				text: "Close"
				
				onClicked: {
					root.push(updatesList)
				}
			}
		}
	}
		
}
