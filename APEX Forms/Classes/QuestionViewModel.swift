//
//  QuestionViewModel.swift
//  APEX Forms
//
//  Created by Samuel Brasileiro on 09/03/20.
//  Copyright © 2020 Samuel Brasileiro. All rights reserved.
//

import Foundation

class QuestionBank{
    private var questions: [Question]?
    
    init(){
        questions = []
        addQuestion(text: "Quanto, em reais, você produz, localmente, em um mês?",
                    multipleAnswer: false,
                    options: ["Até R$10.000",
                              "De R$10.000 até R$50.000",
                              "De R$50.000 até R$250.000",
                              "Mais de R$250.000"])
        addQuestion(text: "Quanto, em reais, você gasta, localmente, em um mês?",
                    multipleAnswer: false,
                    options: ["Até R$5.000",
                              "De R$5.000 até R$20.000",
                              "De R$20.000 até R$50.000",
                              "Mais de R$50.000"])
        addQuestion(text: "Você considera seu produto útil para o mercado exterior?",
                    multipleAnswer: false,
                    options: ["Sim",
                              "Não"])
        addQuestion(text: "Com quais hotspot você acha que seu produto seria de importância?",
        multipleAnswer: true,
        options: ["América do Norte",
                  "Europa",
                  "China",
                  "Oriente Médio"])
    }
    func getNumberOfQuestions()->Int{
        
        return questions!.count
    }
    func addQuestion(text: String, multipleAnswer: Bool, options: [String]) {
        let question = Question(text: text, multipleAnswer: multipleAnswer)
        question.addOptions(options: options)
        questions?.append(question)
    }
    func addOptionToQuestion(index: Int, option: String) {
        if index < questions!.count{
            questions![index].addOption(text: option)
        }
    }
    func getQuestionText(index: Int) -> String{
        if index < questions!.count{
            return questions![index].getText()
        }
        else{
            return "Question index out of range"
        }
    }
    func getTextOptionOfQuestion(optionIndex: Int, questionIndex: Int) -> String{
        if questionIndex < questions!.count{
            return questions![questionIndex].getTextOption(index: optionIndex)
        }
        else{
            return "Question index out of range"
        }
    }
    func isSelectedOptionOfQuestion(optionIndex: Int, questionIndex: Int) -> Bool{
        //print("\(optionIndex) -> \(questionIndex)")
        //print("\(questions![questionIndex].isSelectedOption(index: optionIndex))")
        if questionIndex < questions!.count{
            return questions![questionIndex].isSelectedOption(index: optionIndex)
        }
        else{
            return false
        }
    }
    func setSelectedOptionOfQuestion(value: Bool, optionIndex: Int, questionIndex: Int){
        if questionIndex < questions!.count{
            questions![questionIndex].setSelectedOption(value: value, index: optionIndex)
        }
    }
    func isPossibleToSelect(questionIndex: Int) -> Bool{
        print(questionIndex)
        if questions![questionIndex].isMultipleAnswer(){
            return true
        }
        else{
            for index in 0..<questions![questionIndex].getCountOptions(){
                if questions![questionIndex].isSelectedOption(index: index){
                    return false
                }
            }
        }
        return true
    }
    func getCountOptionsInQuestion(questionIndex: Int)->Int{
        return questions![questionIndex].getCountOptions()
    }
    func isSelectedAnyOptionOfQuestion(questionIndex: Int) -> Bool{
        
        for index in 0..<getCountOptionsInQuestion(questionIndex: questionIndex){
            if questions![questionIndex].isSelectedOption(index: index){
                return true
            }
        }
        return false
    }
    func printAllSelectedResults(){
        for questionIndex in 0..<getNumberOfQuestions(){
            print("Analisando questao \(questionIndex+1)")
            for index in 0..<getCountOptionsInQuestion(questionIndex: questionIndex){
                print(isSelectedOptionOfQuestion(optionIndex: index, questionIndex: questionIndex))
            }
        }
    }
}
