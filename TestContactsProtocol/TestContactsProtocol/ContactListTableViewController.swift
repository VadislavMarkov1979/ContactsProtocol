//
//  ContactListTableViewController.swift
//  TestContactsProtocol
//
//  Created by Владимир Макаров on 08.12.2021.
//

import UIKit

class ContactListTableViewController: UITableViewController {
    
    
    var persons = Contact.loadContact()

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let contact = persons[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = contact.fullName
        content.secondaryText = contact.phone
        content.secondaryTextProperties.color = .gray
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let actionDelete = UIContextualAction(style: .destructive, title: "Удалить") {
            _,_,_ in
            // удаляем контакт
            self.persons.remove(at: indexPath.row)
            // заново формируем табличное представление
            tableView.reloadData()
            }
            // формируем экземпляр, описывающий доступные действия
            let actions = UISwipeActionsConfiguration(actions: [actionDelete])
        
        return actions
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let detailVC = segue.destination as! DetailsViewController
            detailVC.person = persons[indexPath.row]
        }
    }

}
