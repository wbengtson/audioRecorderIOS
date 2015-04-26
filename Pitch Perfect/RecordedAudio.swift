//
//  RecordedAudio.swift
//  Pitch Perfect
//
//  Created by Wellington Bengtson on 26/04/15.
//  Copyright (c) 2015 Wellington Bengtson. All rights reserved.
//

import Foundation

class RecordedAudio: NSObject{
    var filePathUrl: NSURL!
    var title: String!
    
    init(filePathUrl: NSURL, title: String) {
        self.filePathUrl = filePathUrl
        self.title = title
    }
}