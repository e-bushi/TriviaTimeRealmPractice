//
//  Question.swift
//  TriviaTime
//
//  Created by Chris Mauldin on 2/16/18.
//  Copyright © 2018 Eliel Gordon. All rights reserved.
//

import Foundation
import RealmSwift

class Question: Object {
    @objc dynamic var query: String = ""
    @objc dynamic var correct: Bool = false
    @objc dynamic var answer: String = ""
}
