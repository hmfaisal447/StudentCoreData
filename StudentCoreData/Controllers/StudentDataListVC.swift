//
//  StudentDataListVC.swift
//  StudentCoreData
//
//  Created by codegradients on 26/12/2020.
//

import UIKit

protocol dataPass {
    func updateData(object: [String: String], index: Int, editData: Bool)
}

class StudentDataListVC: UIViewController {

    @IBOutlet weak var studentListTV: UITableView!
    var student = [Student]()
    var delegate: dataPass!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        student = StudentDB.shareInstance.getStudentData()
        studentListTV.delegate = self
        studentListTV.dataSource = self
    }
}

// MARK:- Student Data List Table View
extension StudentDataListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.StudentTVCell, for: indexPath) as! StudentTVCell
        cell.student = student[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            //student.remove(at: indexPath.row)
            student = StudentDB.shareInstance.deleteStudentData(indexPath: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = student[indexPath.row]
        let dict = [K.name: data.name, K.address: data.address, K.city: data.city, K.mobile: data.mobile]
        delegate.updateData(object: dict as! [String: String], index: indexPath.row, editData: true)
        self.navigationController?.popViewController(animated: true)
    }
}
