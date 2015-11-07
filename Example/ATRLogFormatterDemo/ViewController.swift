//
// Created by Alexey Korolev on 07.11.15.
// Copyright (c) 2015 Heads and Hands. All rights reserved.
//

import UIKit
import CocoaLumberjack

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        DDLogError("error message")
        DDLogWarn("warning message")
        DDLogInfo("info message")
        DDLogDebug("debug message")
        DDLogVerbose("verbose message")
    }


    @IBAction func printShortClassButtonPressed(sender: AnyObject) {
        ShortNameClass()
    }
    @IBAction func printLongClassButtonPressed(sender: AnyObject) {
       VeryLongNamedClass()
    }
    @IBAction func printVeryLongClassButtonPressed(sender: AnyObject) {
        VeryVeryVeryVeryLongNamedClass()
    }
}