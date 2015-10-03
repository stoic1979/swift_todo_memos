//
//  AddCategoryViewController.swift
//  iToDo Memo
//
//  Created by wb27 on 7/7/15.
//  Copyright (c) 2015 Weavebytes Infotech Pvt Ltd. All rights reserved.
//

import UIKit

class AddCategoryViewController: UIViewController {

   
    @IBOutlet weak var tfCategory : UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func saveCategory(id:UIButton){
                
        
        
        
        // Validations
        if tfCategory!.text.isEmpty {
            let alert = UIAlertView(title:"iToDo Memo", message:"Please enter category name !", delegate:nil, cancelButtonTitle: "OK")
            alert.show()
            
            return
        }
        
        
        // Save category
        let db = SQLiteDB.sharedInstance()
        
        let sql = "INSERT INTO category(title) VALUES (?)"
        
        // create list of params to relplace ? in SQLite query
        let params = [tfCategory!.text]
        
        let rc = db.execute(sql, parameters:params)
        if rc != 0 {
            let alert = UIAlertView(title:"iToDo Memo", message:"Category saved successfully", delegate:nil, cancelButtonTitle: "OK")
            alert.show()
        }


        
        // remove current VC and show prev. VC
        self.navigationController!.popViewControllerAnimated(true)

        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}//AddCategoryViewController
