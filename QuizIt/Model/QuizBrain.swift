//
//  QuizBrain.swift
//  QuizIt
//
//  Created by Gokul Nair on 02/12/20.
//

import Foundation

struct QuizBrain {
    let questionArray = [
        Question(q: "Which is the largest organ in the human body?", o: ["Heart", "Skin", "Large Intestine", "Leg"], a: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", o: ["25", "50", "75","100"], a: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", o: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time", "General Middle Time"], a: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", o: ["Chapeau", "Écharpe", "Bonnet", "Loda"], a: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", o: ["Notebook", "Handkerchief", "Watch", "Wallet"], a: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", o: ["Au Revoir", "Adiós", "Salir", "Sheri"], a: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", o: ["Green", "Orange", "Blue", "Violet"], a: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", o: ["Rum", "Whisky", "Gin", "Vodka"], a: "Rum"),
        Question(q: "What type of animal was Harambe?", o: ["Panda", "Gorilla", "Crocodile", "Langoore"], a: "Gorilla"),
        Question(q: "Where is Tasmania located?", o: ["Indonesia", "Australia", "Scotland", "America"], a: "Australia")
    ]
    var questionNumber = 0
    var score = 0
    var testOver = false
    
    func getQuestion() -> String {
        return questionArray[questionNumber].text
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(questionArray.count)
    }
    
    func getOptions() -> [String]{
        return questionArray[questionNumber].options
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func checkAnswer(answer userAnswer: String) -> Bool {
        
        if userAnswer == questionArray[questionNumber].answer {
            score += 1
            return true
        }else{
            return false
        }
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < questionArray.count {
            questionNumber += 1
        } else{
            questionNumber = 0
            score = 0
            testOver = true
        }
    }
    
    func checkTestCompletion() -> Bool{
        if testOver == true {
            return true
        }
        else{
            return false
        }
    }
}
