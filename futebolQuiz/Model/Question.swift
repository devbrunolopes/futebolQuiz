//
//  Question.swift
//  futebolQuiz
//
//  Created by Bruno Lopes on 10/12/21.
//

import Foundation

struct Question {
    
    let text: String
    let answer: [String]
    let correctAnswer: String
    
    init(q: String, a: [String], ca: String) {
        text = q
        answer = a
        correctAnswer = ca        
    }
    
    
}
