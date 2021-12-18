//
//  ViewController.swift
//  ToDoApp
//
//  Created by Abdulmajeed Shukayri on 18/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    let contextObject = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let savingObject: () = (UIApplication.shared.delegate as! AppDelegate).saveContext()
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var myTaskTitle: UITextField!
    
    @IBOutlet weak var myTaskDate: UIDatePicker!
    
    @IBOutlet weak var myTaskNote: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        addButton.layer.cornerRadius = 8
        // Do any additional setup after loading the view.
    }
    @IBAction func addButtonPressed(_ sender: UIButton) {
        if myTaskTitle.text == "" || myTaskNote.text == ""{
            dismiss(animated: true, completion: nil)
        }else{
            let task = ToDoListItem(context: contextObject)
            task.title = myTaskTitle.text!
            task.note = myTaskNote.text!
            task.date = myTaskDate.date
            
            savingObject
            dismiss(animated: true, completion: nil)
        }
    }

}

