//
//  Question.swift
//  QuizIt
//
//  Created by Gokul Nair on 02/12/20.
//

import Foundation

struct Question {
    let text: String
    let options: [String]
    let answer: String
    
    init(q: String, o: [String], a: String) {
        text = q
        options = o
        answer = a
    }
}
