//
//  StudentDB.swift
//  StudentCoreData
//
//  Created by codegradients on 25/12/2020.
//

import Foundation
import CoreData
import UIKit

class StudentDB {
    
    static var shareInstance = StudentDB()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
// MARK:- save student data method
    func saveStudentData(object:[String:String]) {
        let student = NSEntityDescription.insertNewObject(forEntityName: K.Student, into: context) as! Student
        student.name = object[K.name]
        student.address = object[K.address]
        student.city = object[K.city]
        student.mobile = object[K.mobile]
        do{
            try context.save()
        }catch {
            print("Student data saving error\(error)")
        }
    }
    
// MARK:- get student data from database and display on table view
    func getStudentData() -> [Student] {
        var student = [Student]()
        //let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Student")
        let fetchRequest: NSFetchRequest<Student> = Student.fetchRequest()
        do {
            student = try context.fetch(fetchRequest) //as! [Student]
        }catch {
            print("student data getting errro\(error)")
        }
        return student
    }
    
// MARK:- delete student selected/specific data
    func deleteStudentData(indexPath: Int) -> [Student] {
        var student = getStudentData()
        context.delete(student[indexPath])
        student.remove(at: indexPath)
        do{
            try context.save()
        }catch {
            print("Student data deleting error\(error)")
        }
        return student
    }

// MARK:- edit student selected/specific data
    func editStudentData(object: [String: String], dataIndex: Int) {
        let student = getStudentData()
        student[dataIndex].name = object[K.name]
        student[dataIndex].address = object[K.address]
        student[dataIndex].city = object[K.city]
        student[dataIndex].mobile = object[K.mobile]
        do{
            try context.save()
        }catch {
            print("Student data editing error\(error)")
        }
    }
}
