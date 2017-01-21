//
//  Extension.swift
//  GoodGIrlOrBoy
//
//  Created by Margaret Ikeda on 1/21/17.
//  Copyright © 2017 Margaret Ikeda. All rights reserved.
//

import Foundation
extension BehavioralEvent {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        timestamp = NSDate()
    }
    var localizeDescription: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        let string = formatter.string(from: timestamp! as Date)
        return "🚸 \(string)"
    }
}
