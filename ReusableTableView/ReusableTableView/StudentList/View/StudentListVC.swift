//
//  StudentListVC.swift
//  ReusableTableView
//
//  Created by Varun on 05/02/21.
//

import UIKit

class StudentListVC: UIViewController {

    @IBOutlet weak var studentListTableView: UITableView!
    
    var studentListTableViewDataSource: GenericTableViewDataSource<StudentModel, StudentListCell>?
    var studentListArray = [StudentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK:- Custom Methods
    
    private func setupView() {
        prepareData()
        setupTableView()
    }
    
    private func prepareData() {
        studentListArray.append(contentsOf: [
            StudentModel(name: "William", age: 19),
            StudentModel(name: "James", age: 19),
            StudentModel(name: "Harper", age: 19),
            StudentModel(name: "Mason", age: 19),
            StudentModel(name: "Jackson", age: 19)
                            ])
    }
    
    private func setupTableView() {
        studentListTableView.register(UINib(nibName: "StudentListCell", bundle: nil), forCellReuseIdentifier: "StudentListCell")
        // Use with init
//        let dataSource = GenericTableViewDataSource(models: studentListArray, reuseIdentifire: "StudentListCell", cellConfigurator: { (model: StudentModel, cell: StudentListCell) in
//            cell.nameLabel.text = model.name
//            cell.ageLabel.text = "\(model.age)"
//        })
//        self.studentListTableViewDataSource = dataSource
//        studentListTableView.dataSource = dataSource
        
        // Use with static convenience method
        studentListTableViewDataSource = GenericTableViewDataSource.make(for: studentListArray)
        studentListTableView.dataSource = studentListTableViewDataSource
    }
}
