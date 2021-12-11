//
//  QuizBrain.swift
//  futebolQuiz
//
//  Created by Bruno Lopes on 10/12/21.
//

import Foundation


struct QuizBrain {
    
    let quiz = [
        Question(q: "Em que ano o Palmeiras conquistou o primeiro título da Copa Libertadores?", a: ["1997", "1998", "1999"], ca: "1999" ),
        Question(q: "Em que ano o Corinthians conquistou o título da Copa Libertadores?", a: ["2011", "2012", "2013"], ca: "2012"),
        Question(q: "Em que ano o Brasil conquistou a primeira Copa do Mundo?", a: ["1958", "1962", "1970"], ca: "1958"),
        Question(q: "Em que ano foi realizado o primeiro Campeonato Brasileiro de futebol?", a: ["1959", "1961", "1969"], ca: "1959"),
        Question(q: "Quem é o maior artilheiro da história do Campeonato Brasileiro?", a: ["Roberto Dinamite", "Romário", "Fred" ] , ca: "Roberto Dinamite"),
        Question(q: "Quem é o maior artilheiro da história em Copa do Mundo?", a: ["Ronaldo Fenômeno", "Gerd Muller", "Miroslav Klose"], ca: "Miroslav Klose"),
        Question(q: "Qual o clube com mais títulos do Campeonato Brasileiro?", a: ["Palmeiras", "Santos", "Corinthians e Flamengo"], ca: "Palmeiras"),
        Question(q: "Em que ano a seleção Brasileira conquistou o tetracampeonato?", a: ["1994", "1998", "2002"], ca: "1994"),
        Question(q: "Qual é o jogodor com mais títulos da Bola de Ouro?", a: ["Cristiano Ronaldo", "Michel Platini", "Lionel Messi"], ca: "Lionel Messi"),
        Question(q: "Qual o clube com mais títulos da Copa Libertadores?", a: ["Peñarol(URU)", "Boca Juniors(ARG)", "Independiente(ARG)"], ca: "Independiente(ARG)")
    ]
    
    var questionNumber = 0
    var score = 0
    var changeView = 1
    var finalScore = 0
    
    mutating func checkAnswer (_ userAnswer: String) -> Bool {
        
        if userAnswer == quiz[questionNumber].correctAnswer {
            score += 1
            finalScore += 1
            return true
        } else {
            return false
        }
        
    }
    
    mutating func nextQuestion() {
        
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
            changeView += 1
        } else {
            questionNumber = 0
            score = 0
            changeView += 1
        }
        
    }
    
    func updateProgressBar() -> Float {
        
       return Float(questionNumber + 1) / Float(quiz.count)
        
    }
    
    func getQuestionText() -> String {
        
        return quiz[questionNumber].text
        
    }
    
    func getScore() -> Int {
        
        return score
        
    }
    
    func getAswers() -> [String] {
        
        return quiz[questionNumber].answer
        
    }
    
    func goToResults() -> Int {
        
       return changeView
        
    }
    
    func getFinalScore() -> Int {
        
        return finalScore
        
    }
    
    mutating func resetApp() {
        
        changeView = 1
        finalScore = 0
        
    }

}
