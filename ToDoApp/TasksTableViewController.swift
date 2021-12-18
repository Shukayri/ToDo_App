//
//  TasksTableViewController.swift
//  ToDoApp
//
//  Created by Abdulmajeed Shukayri on 18/12/2021.
//

import UIKit
import CoreData

class TasksTableViewController: UITableViewController {
    
    let contextObject = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let savingObject: ()  = (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
    var tasks: [ToDoListItem] = []

    
    override func viewDidAppear(_ animated: Bool) {
       fetchData()
        tableView.reloadData()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

  

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TodoTableViewCell
        
        let todo = tasks[indexPath.row]
        cell.taskTitle.text = todo.title!
        cell.taskNote.text = todo.note!
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        let dateString = dateFormatter.string(from: todo.date!)
        cell.taskDate.text = dateString
        
        if todo.complete {
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
        }

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        task.complete = !task.complete
        if task.complete {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
        }else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
        }
        savingObject
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        contextObject.delete(task)
        savingObject
        tasks.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    func fetchData(){
        let request:NSFetchRequest<ToDoListItem> = ToDoListItem.fetchRequest()
        do{
            tasks = try contextObject.fetch(request)
        }catch{
            print(error)
        }
    }
}
