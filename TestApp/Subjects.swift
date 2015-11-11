//
//  Subjects.swift
//  TestApp
//
//  Created by Qadir Haqq on 11/10/15.
//  Copyright © 2015 Qadir Haqq. All rights reserved.
//

import Foundation


class Subjects: NSObject, NSCoding{
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("library")
    
    var library = Dictionary<String, String>?()
    var termsList = Array<String>?()
    
    //MARK: Types
    
    struct PropertyKey{
        static let listOfTerms = "termsList"
        static let libraryDict = "library"
        static let storingSubjects = "Subjects"
    }
    
    //MARK: NSCoding
    
    override init(){}
    
    
    func encodeWithCoder(aCoder: NSCoder) {
        if (self.termsList?.isEmpty != true){
            aCoder.encodeObject(self.termsList, forKey: PropertyKey.listOfTerms)
        }
        if (self.library?.isEmpty != true){
            aCoder.encodeObject(self.library, forKey: PropertyKey.libraryDict)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        self.library = (aDecoder.decodeObjectForKey(PropertyKey.listOfTerms) as? Dictionary)!
        self.termsList = (aDecoder.decodeObjectForKey(PropertyKey.libraryDict) as? Array)!
    }
    
    func save(){
        let subjectData = NSKeyedArchiver.archivedDataWithRootObject(self)
        NSUserDefaults.standardUserDefaults().setObject(subjectData, forKey: PropertyKey.storingSubjects)
    }
    
    func clear() {
        NSUserDefaults.standardUserDefaults().removeObjectForKey(PropertyKey.storingSubjects)
    }
    
    class func loadSaved() -> Subjects? {
        if let data = NSUserDefaults.standardUserDefaults().objectForKey(PropertyKey.storingSubjects) as? NSData {
            return NSKeyedUnarchiver.unarchiveObjectWithData(data) as? Subjects
        }
        return nil
    }
    
    //loading a saved Subject List, cannot declare it here, do not know where to declare it however
    /*
    if (Subjects.loadSaved() != nil){
        println("loaded Saved Subjects")
    }else{
        // Create a new Subjects List
        let subject: Subjects = Subjects()
        //subjects.populate()
        subject.save()
    }*/
    
    //add terms
    func addTermAndDef(term: String, def: String){
        library?[term] = def
        termsList?.append(term)
    }
    
    //delete terms
    func deleteTermAndDef(term: String){
        library?[term] = nil
    }

    //print terms
    func printTerms(){
        if((library?.isEmpty) != nil){
            print("Library is empty")
        }else{
            for(term, def) in library!{
                print("\(term): \(def)")
            }
        }
    }
    
    func quizMe(){
        while(true){//Must replace with identifier eventually
            let idx = Int(rand()) % termsList!.count
            print("Given the term \(library?[termsList![idx]]), what is the definition?")

        }
        
        
    }
    
    
    
    
}
