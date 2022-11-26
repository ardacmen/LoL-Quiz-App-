//
//  questionController.swift
//  Quiz App For AppStore
//
//  Created by Arda Çimen on 26.11.2022.
//

import Foundation
import UIKit

class questionController{
    
    var questionResult: [questionn]?
    var index = 0
    static let shared =  questionController()
    var question : Int? = 0
  
    func saveDatas(){
        questionAppService.shared.fetchAllDatas { [weak self] (response) in
        self?.questionResult = response ?? []
     }
    }
    
    func checkQuestion(userAnswer:String) -> Bool{
        
        if userAnswer == (self.questionResult![self.index].answer)
        {
          nextQuestion()
          return true
        }
        else
        {
         return false
        }
      
        
    }
    
    func nextQuestion(){
        if index + 1 < self.questionResult!.count{
            self.index = self.index +  1
        }else{
            index = 0
        }
    }
    
    func getCount() -> Int{
        let questionCount = self.questionResult!.count
        return   questionCount
    }
    
    func getQuestion() -> String?{
       
        let question = (self.questionResult![self.index].question)
        return question
    }
    func getA() -> String?{
        let answerA = (self.questionResult![self.index].A)
        return answerA
    }
    func getB() -> String?{
        let answerB = (self.questionResult![self.index].B)
        return answerB
    }
    func getC() -> String?{
        let answerC = (self.questionResult![self.index].C)
        return answerC
    }
    func getD() -> String?{
        let answerD = (self.questionResult![self.index].D)
        return answerD
    }
    
       
       
    
}
    
    
  
    

