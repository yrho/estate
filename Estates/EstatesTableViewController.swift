

import UIKit

class EstatesTableViewController: UITableViewController {
    
    var estates:[Estates] = [
        Estates(name: "terraces", type: "5 bedrooms", location: "Ang Mo Kio", image: "terraces", isVisited: false),
        Estates(name: "merryl", type: "2 bedrooms", location: "Clementi", image: "merryl", isVisited: false),
        Estates(name: "kingbay", type: "1 bedroom", location: "Jurong", image: "kingbay", isVisited: false),
        Estates(name: "janenose", type: "3 bedrooms", location: "MacPherson", image: "janenose", isVisited: false),
        Estates(name: "serence", type: "4 bedrooms", location: "sengkang", image: "serence", isVisited: false),
        Estates(name: "potong", type: "5 bedrooms", location: "simei", image: "potong", isVisited: false),
        Estates(name: "esteem", type: "2 bedrooms", location: "Tanjong Pagar", image: "esteem", isVisited: false),
        Estates(name: "valleyfall", type: "1 bedroom", location: "Tiong Bahru", image: "valleyfall", isVisited: false),
        Estates(name: "goldlin", type: "3 bedrooms", location: "Woodland", image: "goldlin", isVisited: false),
        Estates(name: "otong", type: "4 bedrooms", location: "Yio Chu Kang", image: "otong", isVisited: false)
        ]
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

       // Remove the title of the back button
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    
    
      // Enable self sizing cell
        tableView.estimatedRowHeight = 36.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.hidesBarsOnSwipe = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return estates.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! EstatesTableViewCell

        // Configure the cell...
        cell.nameLabel.text = estates[indexPath.row].name
        cell.thumbnailImageView.image = UIImage(named: estates[indexPath.row].image)
        cell.locationLabel.text = estates[indexPath.row].location
        cell.typeLabel.text = estates[indexPath.row].type
        cell.accessoryType = estates[indexPath.row].isVisited ? .Checkmark : .None
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle:
        UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            // Delete the row from the data source
            estates.removeAtIndex(indexPath.row)
        }
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    

    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath)
        -> [UITableViewRowAction]? {
            
        // Social Sharing Button
            let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler:
                { (action, indexPath) -> Void in
            
            let defaultText = "Just checking in at " + self.estates[indexPath.row].name
            if let imageToShare = UIImage(named: self.estates[indexPath.row].image) {
            let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare],
                applicationActivities: nil)
                self.presentViewController(activityController, animated: true, completion: nil)
                
            }
            })

        // Delete button
            let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title:
                "Delete",handler: { (action, indexPath) -> Void in
            
        // Delete the row from the data source
        self.estates.removeAtIndex(indexPath.row)

        self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
})

        // Set the button color
        shareAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
}

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showEstatesDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! EstatesDetailViewController
                destinationController.estatesImage = estates[indexPath.row].image
    
            }
        }
    }
}

