//
//  AllowFolder.swift
//  macOs-widgetExtension
//
//  Created by Jesse Hyde on 27/08/2024.
//

import WidgetKit
import AppKit

func AllowFolder() -> URL? {
    print("In AllowFolder")
    let openPanel = NSOpenPanel()
    openPanel.allowsMultipleSelection = false
    openPanel.canChooseDirectories = true
    openPanel.canCreateDirectories = true
    openPanel.canChooseFiles = false
    openPanel.begin { (result) -> Void in
        if result.rawValue == NSFileHandlingPanelOKButton {
            let url = openPanel.url
//            BookmarkManager.storeBookmark(url: url!)
        }
    }
    
    return openPanel.url
}
