//
//  questionVC.swift
//  Quiz App For AppStore
//
//  Created by Arda Çimen on 25.11.2022.
//

import UIKit
import SnapKit


 class questionVC: UIViewController {
     let questionTitle: UILabel = UILabel()
     let remainder: UILabel = UILabel()
     let remainderText: UILabel = UILabel()
     let answerA: UIButton = UIButton()
     let answerB: UIButton = UIButton()
     let answerC: UIButton = UIButton()
     let answerD: UIButton = UIButton()
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        questionController.shared.saveDatas()
         sleep(1)
        configure()
        answerA.addTarget(self, action: #selector(check), for: .touchUpInside)
        answerB.addTarget(self, action: #selector(check), for: .touchUpInside)
        answerC.addTarget(self, action: #selector(check), for: .touchUpInside)
        answerD.addTarget(self, action: #selector(check), for: .touchUpInside)
        
      
        
    }
  
    
   
    
    
    func configure()
    {
        view.addSubview(questionTitle)
        view.addSubview(remainder)
        view.addSubview(remainderText)
        view.addSubview(answerA)
        view.addSubview(answerB)
        view.addSubview(answerC)
        view.addSubview(answerD)
        makeRemainder()
        makeRemainderText()
        makeQuestionTitle()
        makeAnswerA()
        makeAnswerB()
        makeAnswerC()
        makeAnswerD()
        drawDesign()
       
        
       
    }
     
     @objc func check(_ sender : UIButton) {
        let userAnswer =  sender.currentTitle
        if questionController.shared.checkQuestion(userAnswer: userAnswer!)
        {
            sender.backgroundColor = .green
        }
        else
        {
            sender.backgroundColor = .red
        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
     
        }
     
     
     @objc func updateUI()
        {
          drawDesign()
        }
    
    
    
    
     
    private func drawDesign() {
      
       
           DispatchQueue.main.async {
               self.view.backgroundColor = .white
               
               
               self.remainderText.text = "Çözülen Soru = "
               self.remainderText.textColor = UIColor.black
               self.remainderText.font = .boldSystemFont(ofSize: 16)
               
               
               
               
               self.remainder.text =  "\(questionController.shared.index+1) / \(questionController.shared.getCount()+1)"
               self.remainder.textColor = UIColor.black
               self.remainder.font = .boldSystemFont(ofSize: 16)
               
               
               
               
               
               self.questionTitle.backgroundColor = (UIColor.white)
               self.questionTitle.text = questionController.shared.getQuestion()
               self.questionTitle.textColor = (UIColor.black)
               self.questionTitle.textAlignment = .center
               self.questionTitle.numberOfLines = 15
               self.questionTitle.font = .boldSystemFont(ofSize: 20)
               
              
               
               
               
               self.answerA.backgroundColor = (UIColor.white)
               self.answerA.titleLabel?.font = .boldSystemFont(ofSize: 16)
               self.answerA.setTitleColor(UIColor.black, for: .normal)
               self.answerA.setTitle( questionController.shared.getA()!, for: .normal)
               self.answerA.titleLabel?.lineBreakMode = .byWordWrapping
               
                
             
             
               
               self.answerB.backgroundColor = (UIColor.white)
               self.answerB.titleLabel?.font = .boldSystemFont(ofSize: 16)
               self.answerB.setTitleColor(UIColor.black, for: .normal)
               self.answerB.setTitle( questionController.shared.getB()!, for: .normal)
               self.answerB.titleLabel?.lineBreakMode = .byWordWrapping
              
             
            
               self.answerC.backgroundColor = (UIColor.white)
               self.answerC.titleLabel?.font = .boldSystemFont(ofSize: 16)
               self.answerC.setTitleColor(UIColor.black, for: .normal)
               self.answerC.setTitle(questionController.shared.getC()!, for: .normal)
               self.answerC.titleLabel?.lineBreakMode = .byWordWrapping
               
             
               
               self.answerD.backgroundColor = (UIColor.white)
               self.answerD.titleLabel?.font = .boldSystemFont(ofSize: 16)
               self.answerD.setTitleColor(UIColor.black, for: .normal)
               self.answerD.setTitle(questionController.shared.getD()!, for: .normal)
               self.answerD.titleLabel?.lineBreakMode = .byWordWrapping
        
              
           
            
               
           }
        
       }

}
extension questionVC {

   

    func makeQuestionTitle() {
        questionTitle.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(125)
            make.left.equalTo(view).offset(30)
            make.right.equalTo(view).offset(-30)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    
    func makeAnswerA() {
        answerA.snp.makeConstraints { (make) in
            make.top.equalTo(questionTitle).offset(75)
            make.left.equalTo(view).offset(30)
            make.width.equalTo(questionTitle)
            make.height.greaterThanOrEqualTo(10)
        }
    }
    func makeAnswerB() {
        answerB.snp.makeConstraints { (make) in
            make.top.equalTo(answerA).offset(50)
            make.left.equalTo(view).offset(30)
            make.width.equalTo(questionTitle)
            make.height.greaterThanOrEqualTo(10)
          
        }
    }
    func makeAnswerC() {
        answerC.snp.makeConstraints { (make) in
            make.top.equalTo(answerB).offset(50)
            make.left.equalTo(view).offset(30)
            make.height.greaterThanOrEqualTo(10)
            make.width.equalTo(questionTitle)
            
        }
    }
    func makeAnswerD() {
        answerD.snp.makeConstraints { (make) in
            make.top.equalTo(answerC).offset(50)
            make.left.equalTo(view).offset(30)
            make.height.greaterThanOrEqualTo(10)
            make.width.equalTo(questionTitle)
          
        }
    }
    
    func makeRemainder(){
        remainder.snp.makeConstraints{ (make) in
            make.top.equalTo(answerD).offset(50)
            make.right.equalTo(questionTitle).offset(-10)
       
            
        }
    }
    func makeRemainderText(){
        remainderText.snp.makeConstraints{ (make) in
            make.top.equalTo(answerD).offset(50)
            make.left.equalTo(questionTitle).offset(10)
       
        }
    }

   
}
