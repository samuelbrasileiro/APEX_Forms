//
//  QuestionModel.swift
//  APEX Forms
//
//  Created by Samuel Brasileiro on 09/03/20.
//  Copyright © 2020 Samuel Brasileiro. All rights reserved.
//

import Foundation
class Option{
    private var text: String?
    private var selected: Bool?
    init(text: String){
        self.text = text
        selected = false
    }
    func getText()->String{
        return text!
    }
    func isSelected()->Bool{
        return selected!
    }
    func setSelected(value: Bool){
        selected = value
    }
}
class Question{
    private var text: String?
    private var options: [Option]?
    private var multipleAnswer: Bool?
    init(text: String, multipleAnswer: Bool){
        self.text = text
        options = []
        self.multipleAnswer = multipleAnswer
    }
    func addOption(text: String){
        options?.append(Option(text: text))
    }
    
    func addOptions(options: [String]){
        for text in options{
            self.options?.append(Option(text: text))
        }
    }
    func getText() -> String{
        return text!
    }
    func getTextOption(index: Int) -> String{
        if(index < options!.count){
            return options![index].getText()
        }
        else{
            return "Option index out of range"
        }
    }
    func isSelectedOption(index: Int) -> Bool{
        if(index < options!.count){
            return options![index].isSelected()
        }
        else{
            return false
        }
    }
    func setSelectedOption(value: Bool, index: Int){
        if(index < options!.count){
            options![index].setSelected(value: value)
        }
    }
    func isMultipleAnswer() -> Bool{
        return multipleAnswer!
    }
    func getCountOptions() -> Int{
        return options!.count
    }

}
