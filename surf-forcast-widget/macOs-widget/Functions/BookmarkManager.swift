//
//  BookmarkManager.swift
//  surf-forcast-widget
//
//  Created by Jesse Hyde on 27/08/2024.
//

import WidgetKit

class BookmarkManager {
    static let manager = BookmarkManager()
    // Save bookmark for URL. Use this inside the NSOpenPanel `begin` closure
    func SaveBookmark(for url: URL) {
        guard let bookmarkDic = self.GetBookmarkData(url: url), let bookmarkURL = GetBookmarkURL()
        else {
            print("Error getting data or bookmarkURL")
            return
        }

        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: bookmarkDic, requiringSecureCoding: false)
            try data.write(to: bookmarkURL)
            print("Did save data to url")
        }
        catch {
            print("Couldn't save bookmarks")
        }
    }

    // Load bookmarks when your app launch for example
    func LoadBookmarks() {
        guard let url = self.GetBookmarkURL() else {
            return
        }

        if self.FileExists(url) {
            do {
                let fileData = try Data(contentsOf: url)
                if let fileBookmarks = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(fileData) as! [URL: Data]? {
                    for bookmark in fileBookmarks{
                        self.RestoreBookmark(key: bookmark.key, value: bookmark.value)
                    }
                }
            }
            catch {
                print ("Couldn't load bookmarks")
            }
        }
    }

    private func RestoreBookmark(key: URL, value: Data) {
        let restoredUrl: URL?
        var isStale = false

        Swift.print ("Restoring \(key)")
        do {
            restoredUrl = try URL.init(resolvingBookmarkData: value, options: NSURL.BookmarkResolutionOptions.withSecurityScope, relativeTo: nil, bookmarkDataIsStale: &isStale)
        }
        catch {
            Swift.print ("Error restoring bookmarks")
            restoredUrl = nil
        }

        if let url = restoredUrl {
            if isStale {
                Swift.print ("URL is stale")
            }
            else {
                if !url.startAccessingSecurityScopedResource() {
                    Swift.print ("Couldn't access: \(url.path)")
                }
            }
        }
    }
    
    private func GetBookmarkData(url: URL) -> [URL: Data]? {
        let data = try? url.bookmarkData(options: NSURL.BookmarkCreationOptions.withSecurityScope, includingResourceValuesForKeys: nil, relativeTo: nil)
        
        if let data = data{
            return [url: data]
        }
        
        return nil
    }

    private func GetBookmarkURL() -> URL? {
        let urls = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)
        
        if let appSupportURL = urls.last {
            let url = appSupportURL.appendingPathComponent("Bookmarks.dict")
            return url
        }
        
        return nil
    }

    private func FileExists(_ url: URL) -> Bool {
        var isDir = ObjCBool(false)
        let exists = FileManager.default.fileExists(atPath: url.path, isDirectory: &isDir)

        return exists
    }
}
