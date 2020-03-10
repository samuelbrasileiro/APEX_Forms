//
//  QuestionViewController.swift
//  APEX Forms
//
//  Created by Samuel Brasileiro on 09/03/20.
//  Copyright © 2020 Samuel Brasileiro. All rights reserved.
//

import UIKit
var questionIndex: Int = 0
var questionBank = QuestionBank()

class QuestionViewController: UIViewController {
    
    @IBOutlet var text: UILabel!
    
    @IBOutlet var porcentLabel: UILabel!
    
    @IBOutlet var optionView1: UIView!
    
    @IBOutlet var optionView2: UIView!
    
    @IBOutlet var optionView3: UIView!
    
    @IBOutlet var optionView4: UIView!
    
    @IBOutlet var optionCircle1: UIImageView!
    
    @IBOutlet var optionCircle2: UIImageView!
    
    @IBOutlet var optionCircle3: UIImageView!
    
    @IBOutlet var optionCircle4: UIImageView!
    
    @IBOutlet var optionText1: UILabel!
    
    @IBOutlet var optionText2: UILabel!
    
    @IBOutlet var optionText3: UILabel!
    
    @IBOutlet var optionText4: UILabel!
    
    @IBOutlet var continueButtonOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        porcentLabel.text = "Pergunta \(questionIndex + 1) de \(questionBank.getNumberOfQuestions())"
        self.navigationItem.hidesBackButton = true
        if questionIndex + 1 == questionBank.getNumberOfQuestions(){
            continueButtonOutlet.setTitle("Concluir", for: .normal)
        }
        if(questionIndex == 0){
            
            questionBank = QuestionBank()
            self.navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(systemName: "multiply"), style: .done, target: self, action: #selector(cancelButton)),animated: true)
        }
        else{
            self.navigationItem.setLeftBarButton(UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .done, target: self, action: #selector(goBackButton)),animated: false)
        }
        
        
        let gesture = [UITapGestureRecognizer(target: self, action:  #selector (self.actionOptionView1(_:))),
                       UITapGestureRecognizer(target: self, action:  #selector (self.actionOptionView2(_:))), UITapGestureRecognizer(target: self, action:  #selector (self.actionOptionView3(_:))),
                       UITapGestureRecognizer(target: self, action:  #selector (self.actionOptionView4(_:)))]
        self.optionView1.addGestureRecognizer(gesture[0])
        self.optionView2.addGestureRecognizer(gesture[1])
        self.optionView3.addGestureRecognizer(gesture[2])
        self.optionView4.addGestureRecognizer(gesture[3])
        self.text.text = questionBank.getQuestionText(index: questionIndex)
        
        self.optionView1.isHidden = true
        self.optionView2.isHidden = true
        self.optionView3.isHidden = true
        self.optionView4.isHidden = true
        
        for index in 0..<questionBank.getCountOptionsInQuestion(questionIndex: questionIndex){
            if index == 0{
                self.optionView1.isHidden = false
                self.optionText1.text = questionBank.getTextOptionOfQuestion(optionIndex: index, questionIndex: questionIndex)
                if questionBank.isSelectedOptionOfQuestion(optionIndex: index, questionIndex: questionIndex){
                    optionCircle1.image = UIImage(systemName: "circle.fill")
                }
            }
            if index == 1{
                self.optionView2.isHidden = false
                self.optionText2.text = questionBank.getTextOptionOfQuestion(optionIndex: index, questionIndex: questionIndex)
                if questionBank.isSelectedOptionOfQuestion(optionIndex: index, questionIndex: questionIndex){
                    optionCircle2.image = UIImage(systemName: "circle.fill")
                }
            }
            if index == 2{
                self.optionView3.isHidden = false
                self.optionText3.text = questionBank.getTextOptionOfQuestion(optionIndex: index, questionIndex: questionIndex)
                if questionBank.isSelectedOptionOfQuestion(optionIndex: index, questionIndex: questionIndex){
                    optionCircle3.image = UIImage(systemName: "circle.fill")
                }
            }
            if index == 3{
                self.optionView4.isHidden = false
                self.optionText4.text = questionBank.getTextOptionOfQuestion(optionIndex: index, questionIndex: questionIndex)
                if questionBank.isSelectedOptionOfQuestion(optionIndex: index, questionIndex: questionIndex){
                    optionCircle4.image = UIImage(systemName: "circle.fill")
                }
            }
        }
    }
    @objc func goBackButton(){
        if questionIndex >= 1{
            questionBank.printAllSelectedResults()
            questionIndex -= 1
            print("back index = \(questionIndex)")
        }
        
        navigationController?.popViewController(animated: false)
    }
    
    @objc func cancelButton(){
        let alert = UIAlertController(title: "Deseja realmente cancelar o formulário?", message: nil, preferredStyle: .alert)
        let stop = UIAlertAction(title: "Sim", style: .default, handler: {(action:UIAlertAction) in
            self.navigationController?.popViewController(animated: true)
            
        })
        stop.setValue(UIColor.red, forKey: "titleTextColor")
        alert.addAction(stop)
        let cancel = UIAlertAction(title: "Não", style: .cancel, handler: nil)
        alert.addAction(cancel)
        
        self.present(alert, animated: true)
    }
    
    @objc func actionOptionView1(_ sender:UITapGestureRecognizer){
        if questionBank.isSelectedOptionOfQuestion(optionIndex: 0, questionIndex: questionIndex) == false{
            if questionBank.isPossibleToSelect(questionIndex: questionIndex){
                questionBank.setSelectedOptionOfQuestion(value: true, optionIndex: 0, questionIndex: questionIndex)
                optionCircle1.image = UIImage(systemName: "circle.fill")
            }
            
        }
        else{
            
            questionBank.setSelectedOptionOfQuestion(value: false, optionIndex: 0, questionIndex: questionIndex)
            optionCircle1.image = UIImage(systemName: "circle")
            
        }
    }
    @objc func actionOptionView2(_ sender:UITapGestureRecognizer){
        if questionBank.isSelectedOptionOfQuestion(optionIndex: 1, questionIndex: questionIndex) == false{
            if questionBank.isPossibleToSelect(questionIndex: questionIndex){
                questionBank.setSelectedOptionOfQuestion(value: true, optionIndex: 1, questionIndex: questionIndex)
                optionCircle2.image = UIImage(systemName: "circle.fill")
            }
            
        }
        else{
            
            questionBank.setSelectedOptionOfQuestion(value: false, optionIndex: 1, questionIndex: questionIndex)
            optionCircle2.image = UIImage(systemName: "circle")
            
        }
    }
    @objc func actionOptionView3(_ sender:UITapGestureRecognizer){
        if questionBank.isSelectedOptionOfQuestion(optionIndex: 2, questionIndex: questionIndex) == false{
            if questionBank.isPossibleToSelect(questionIndex: questionIndex){
                questionBank.setSelectedOptionOfQuestion(value: true, optionIndex: 2, questionIndex: questionIndex)
                optionCircle3.image = UIImage(systemName: "circle.fill")
            }
            
        }
        else{
            
            questionBank.setSelectedOptionOfQuestion(value: false, optionIndex: 2, questionIndex: questionIndex)
            optionCircle3.image = UIImage(systemName: "circle")
            
        }
    }
    @objc func actionOptionView4(_ sender:UITapGestureRecognizer){
        if questionBank.isSelectedOptionOfQuestion(optionIndex: 3, questionIndex: questionIndex) == false{
            if questionBank.isPossibleToSelect(questionIndex: questionIndex){
                questionBank.setSelectedOptionOfQuestion(value: true, optionIndex: 3, questionIndex: questionIndex)
                optionCircle4.image = UIImage(systemName: "circle.fill")
            }
            
        }
        else{
            
            questionBank.setSelectedOptionOfQuestion(value: false, optionIndex: 3, questionIndex: questionIndex)
            optionCircle4.image = UIImage(systemName: "circle")
            
        }
    }
    
    
    
    @IBAction func continueButton(_ sender: Any) {
        questionBank.printAllSelectedResults()
        if questionBank.isSelectedAnyOptionOfQuestion(questionIndex: questionIndex){
            questionIndex += 1
            
            print("continue index = \(questionIndex)")
            
            if  questionIndex < questionBank.getNumberOfQuestions(){
                
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "QuestionViewController")
                self.navigationController?.pushViewController(vc, animated: false)
            }
            else{
                questionIndex -= 1
                //let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController")
                //self.navigationController?.pushViewController(vc, animated: false)
            }
        }
        else{
            let alert = UIAlertController(title: "Atenção", message: "Escolha uma alternativa para poder avançar", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            
            self.present(alert, animated: true)
        }
    }
    
    
}
