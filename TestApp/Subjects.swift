//
//  Subjects.swift
//  TestApp
//
//  Created by Qadir Haqq on 11/10/15.
//  Copyright © 2015 Qadir Haqq. All rights reserved.
//

import Foundation


class Subjects{
    
    private var library = [String: String]()
    private var termsList = [String]()
    //add terms
    func addTermAndDef(term: String, def: String){
        library[term] = def
        termsList.append(term)
    }
    
    //delete terms
    func deleteTermAndDef(term: String){
        library[term] = nil
    }

    //print terms
    func printTerms(){
        if(library.isEmpty){
            print("Library is empty")
        }else{
            for(term, def) in library{
                print("\(term): \(def)")
            }
        }
    }
    
    func quizMe(){
        while(true){//Must replace with identifier eventually
            let idx = Int(rand()) % termsList.count
            print("Given the term \(library[termsList[idx]]), what is the definition?")

        }
        
        
    }
    
    
    
    
}
