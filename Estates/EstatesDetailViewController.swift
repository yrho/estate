
import UIKit

class EstatesDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var estatesImageView: UIImageView!
    
    @IBOutlet var tableView:UITableView!
    
    var estates:Estates!
    
    var estatesImage = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        estatesImageView.image = UIImage(named: estatesImage)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! EstatesDetailTableViewCell
        
     // Configure the cell ...
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "Name"
            cell.valueLabel.text = estates.name
        case 1:
            cell.fieldLabel.text = "Type"
            cell.valueLabel.text = estates.type
        case 2:
            cell.fieldLabel.text = "Location"
            cell.valueLabel.text = estates.location
        case 3:
            cell.fieldLabel.text = "Been here"
            cell.valueLabel.text = (estates.isVisited) ? "Yes, I've been here before" : "No"
        default:
            cell.fieldLabel.text = ""
            cell.valueLabel.text = ""
        }
        
        cell.backgroundColor = UIColor.clearColor()
    
        
    return cell
    }
    
}
