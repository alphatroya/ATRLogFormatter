//
// Created by Alexey Korolev on 07.11.15.
// Copyright (c) 2015 Heads and Hands. All rights reserved.
//

import Foundation
import CocoaLumberjack

class VeryLongNamedClass {
    init() {
        DDLogError("error message")
        DDLogWarn("warning message")
        DDLogInfo("info message")
        DDLogDebug("debug message")
        DDLogVerbose("verbose message")
    }
}
