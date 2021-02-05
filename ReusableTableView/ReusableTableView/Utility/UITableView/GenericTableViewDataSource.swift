//
//  GenericTableViewDataSource.swift
//  ReusableTableView
//
//  Created by Varun on 05/02/21.
//

import Foundation
import UIKit

class GenericTableViewDataSource<Model, Cell: UITableViewCell>: NSObject, UITableViewDataSource {
    typealias CellConfigurator = (Model, Cell) -> Void
    var models: [Model]
    
    private let reuseIdentifire: String
    private let cellConfigurator: CellConfigurator
    
    init(models: [Model], reuseIdentifire: String, cellConfigurator: @escaping CellConfigurator) {
        self.models = models
        self.reuseIdentifire = reuseIdentifire
        self.cellConfigurator = cellConfigurator
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifire, for: indexPath) as? Cell else {
            return UITableViewCell()
        }
        cellConfigurator(models[indexPath.row], cell)
        return cell
    }
}

extension GenericTableViewDataSource where Model == StudentModel, Cell == StudentListCell {
    static func make(for students: [StudentModel]) -> GenericTableViewDataSource {
        return GenericTableViewDataSource(models: students, reuseIdentifire: "StudentListCell") { (student, cell) in
            cell.nameLabel.text = student.name
            cell.ageLabel.text = "\(student.age)"
        }
    }
}
