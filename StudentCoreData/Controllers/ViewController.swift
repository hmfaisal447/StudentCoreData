//
//  ViewController.swift
//  StudentCoreData
//
//  Created by codegradients on 25/12/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCity: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var saveDataBtn: UIButton!
    @IBOutlet weak var showStudentInfoBtn: UIButton!
    
    var dataIndex: Int!
    var updateEditData = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveDataBtn.layer.cornerRadius = 25
        showStudentInfoBtn.layer.cornerRadius = 25
    }
    
// MARK:- save and edit student data
    @IBAction func saveBtn(_ sender: UIButton) {
        let dic = [K.name: txtName.text, K.address: txtAddress.text, K.city: txtCity.text, K.mobile: txtMobile.text]
        if updateEditData{
            updateEditData = false
                StudentDB.shareInstance.editStudentData(object: dic as! [String: String], dataIndex: dataIndex)
        }else {
            updateEditData = false
            StudentDB.shareInstance.saveStudentData(object: dic as! [String: String])
        }
        txtName.text = ""
        txtAddress.text = ""
        txtCity.text = ""
        txtMobile.text = ""
        txtName.becomeFirstResponder()
        
    }
    
// MARK:- diplay student entire data
    @IBAction func studentInfoBtn(_ sender: UIButton) {
        let stdListVC = self.storyboard?.instantiateViewController(withIdentifier: K.StudentDataListVC) as! StudentDataListVC
        self.navigationController?.pushViewController(stdListVC, animated: true)
        stdListVC.delegate = self
    }
}

// MARK:- data pass delegate extenssion
extension ViewController: dataPass {
    func updateData(object: [String : String], index: Int, editData: Bool) {
        txtName.text = object[K.name]
        txtAddress.text = object[K.address]
        txtCity.text = object[K.city]
        txtMobile.text = object[K.mobile]
        dataIndex = index
        updateEditData = editData
    }
}

