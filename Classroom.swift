//
//  Class.swift
//  
//
//  Created by Rishi Patel on 10/12/22.
//

import Foundation


public class Classroom {
    
    //Students should be the same (public getter ... private setter)
    public var students: [Student];
    
    // Use setter to change teacher
    public var teacher: Teacher;
    
    //Classroom is defined by book, not the teachers
    public private(set) var classBook: Book; 
    
    
    
    public init (book: Book){
        self.teacher = Teacher(name: "");
        self.students = [ ];
        self.classBook = book;
    
    }
    
    public func calculateAveragesPerPage () {
        for i in 0...self.students.count - 1 {
            
            var scoresAdded: Double = 0;
            var average: Int = 0;
            
            for j in 0...self.students.count - 1{
                
                scoresAdded += (self.students[j].answers[i].score * 100).rounded();
            }
            
            average = Int(scoresAdded / (Double)(self.students.count));
            
            print("Page " + "\(i+1)" + ": " + "\(average)" + "%");
            
        }
    }
    
    public func calculateAveragesPerStudent () {
        
        
        for i in 0 ... self.students.count - 1 {
            var average: Int = 0;
            var score: Double = 0;
            for j in 0 ... self.students[i].answers.count - 1 {
                score += (self.students[i].answers[j].score * 100).rounded();
            }
            average = Int(score / Double(self.students[i].answers.count));
            print(self.students[i].name  + ": " + "\(average)" + "%");
        }
        
    }
   
}
