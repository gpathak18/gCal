import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var isToggleCell = 0
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.rowHeight = UITableViewAutomaticDimension
        tableview.estimatedRowHeight = 100
    }
    
    var catList: [[String]] = [["Area"],["Square KM","Square Meter","Square Mile","Square Yard","Square Foot","Square Inch","Hectare","Acre"],["Data Transfer Rate"],["Square KM","Square Meter","Square Mile","Square Yard","Square Foot","Square Inch","Hectare","Acre"],["Digital Storage"],["Square KM","Square Meter","Square Mile","Square Yard","Square Foot","Square Inch","Hectare","Acre"],["Energy"],["Square KM","Square Meter","Square Mile","Square Yard","Square Foot","Square Inch","Hectare","Acre"],["Frequency"],["Square KM","Square Meter","Square Mile","Square Yard","Square Foot","Square Inch","Hectare","Acre"],["Fuel Echonomy"],["Square KM","Square Meter","Square Mile","Square Yard","Square Foot","Square Inch","Hectare","Acre"],["Length"],["Square KM","Square Meter","Square Mile","Square Yard","Square Foot","Square Inch","Hectare","Acre"],["Mass"],["Square KM","Square Meter","Square Mile","Square Yard","Square Foot","Square Inch","Hectare","Acre"],["Plane Angle"],["Square KM","Square Meter","Square Mile","Square Yard","Square Foot","Square Inch","Hectare","Acre"],["Pressure"],["Square KM","Square Meter","Square Mile","Square Yard","Square Foot","Square Inch","Hectare","Acre"],["Speed"],["Square KM","Square Meter","Square Mile","Square Yard","Square Foot","Square Inch","Hectare","Acre"],["Temparature"],["Square KM","Square Meter","Square Mile","Square Yard","Square Foot","Square Inch","Hectare","Acre"],["Time"],["Square KM","Square Meter","Square Mile","Square Yard","Square Foot","Square Inch","Hectare","Acre"],["Volume"],["Square KM","Square Meter","Square Mile","Square Yard","Square Foot","Square Inch","Hectare","Acre"],]
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row%2 == 0 {
            //        NSLog("1")
            var cell:UITableViewCell? = self.tableview.dequeueReusableCell(withIdentifier: "Cat") as UITableViewCell!
            
            if(cell == nil)
            {
                cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cat")
            }
            print("\(cell?.reuseIdentifier)")
//
//            NSLog("\(indexPath.row)")
//            NSLog("count \(catList.count)")
            
            cell?.textLabel?.text = self.catList[indexPath.row][0]
            return cell!
            
        } else {
            //     NSLog("2")
            var cell:CustomCell? = tableview.dequeueReusableCell(withIdentifier: "Sub") as?  CustomCell
            if(cell == nil)
            {
                cell = CustomCell(style: UITableViewCellStyle.default, reuseIdentifier: "Sub")
            }
            
            print("\(cell?.reuseIdentifier)")

            cell?.dataArr = self.catList[indexPath.row]
            
            
            return cell!
        }
        
        
    }
    
    
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        print("You tapped cell number \(indexPath.row).")
        let cell:UITableViewCell? = tableview.cellForRow(at: indexPath)
        
        print("\(cell?.reuseIdentifier)")
        
        if cell?.reuseIdentifier == "Cat"{
            return UITableViewAutomaticDimension
        } else {// if cell?.reuseIdentifier == "Sub"{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        if indexPath.row%2 == 0 && isToggleCell == 0 {
        //           tableView.rowHeight = 150
        //            isToggleCell = 1
        //        } else if indexPath.row%2 == 0 && isToggleCell == 1 {
        //            tableView.rowHeight = 200
        //            isToggleCell = 0
        //        } else {
        //           tableView.rowHeight = 200
        //        }
       // let nextRowPath = IndexPath(row: indexPath.row+1, section: 0)        ///tableView.cellForRow(at: <#T##IndexPath#>)
        
        //let cell = tableview.cellForRow(at: nextRowPath as IndexPath)
        tableView.rowHeight = 150
        tableview.beginUpdates()
        tableview.endUpdates()
        print("You tapped cell number \(indexPath.row).")
        print("You tapped cell number \(indexPath.row).")
        print("You number \(tableview.numberOfRows(inSection: 0)).")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        tableview.reloadData()
        
    }
    
}
