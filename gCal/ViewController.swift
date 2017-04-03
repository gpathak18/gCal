import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    private var isToggleCell = 0
    private var openCellNo = 0
    private var isRotatedCell = 0
    
    @IBOutlet weak var tableview: UITableView!
    
    var subClassCells: SubTableCells!
    
    static var from: String = ""
    static var to: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        tableview.delegate = self
        tableview.dataSource = self
        tableview.estimatedRowHeight = 100
        tableview.rowHeight = 40
        tableview.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        tableview.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        
    }
    
    
    @IBAction func donePressed(_ sender: Any) {
        
        PassData.sharedInstance.from = ConversionUtility.getSubUnit(category: PassData.sharedInstance.category, keyword: ViewController.from)
        PassData.sharedInstance.to = ConversionUtility.getSubUnit(category: PassData.sharedInstance.category, keyword: ViewController.to)
        
        self.performSegue(withIdentifier: "unwindToCV", sender: self)
        
        dismiss(animated: true, completion: nil)
        
    }
    private var catList: [[String]] = [["Area"],["Square KM","Square Meter","Square Mile","Square Yard","Square Foot","Square Inch","Hectare","Acre"],["Data Transfer Rate"],["Bit per second","Kilobit per second","Kilobyte per second","Kibibit per second","Megabit per second","Megabyte per second","Mebibit per second","Gigabit per second","Gigabyte per second","Gibibit per second","Terabit per second","Terabyte per second","Tebibit per second"],["Digital Storage"],["Bit","Kilobit","Kibibit","Megabit","Mebibit","Gigabit","Gibibit","Terabit","Tebibit","Petabit","Pebibit","Byte","Kilobyte","Kibibyte","Megabyte","Mebibyte","Gigabyte","Gibibyte","Terabyte","Tebibyte","Petabyte","Pebibyte"],["Energy"],["Joule","Kilojoule","Gram calorie","Kilocalorie","Watt hour","Kilowatt hour","Electronvolt","British thermal unit","US therm","Foot-pound"],["Frequency"],["Hertz","Kilohertz","Megahertz","Gigahertz"],["Fuel Echonomy"],["US Miles per gallon","Miles per gallon (Imperial)","Kilometer per liter","Liter per 100 kilometers"],["Length"],["Kilometer","Meter","Centimeter","Millimeter","Micrometer","Nanometer","Mile","Yard","Foot","Inch","Nautical mile"],["Mass"],["Metric ton","Kilogram","Gram","Milligram","Microgram","Imperial ton","US ton","Stone","Pound","Ounce"],["Plane Angle"],["Degree","Gradian","Milliradian","Minute of arc","Radian","Second of arc"],["Pressure"],["Atmosphere","Bar","Pascal","Pound-force per square inch","Torr"],["Speed"],["Miles per hour","Foot per second","Meter per second","Kilometer per hour","Knot"],["Temparature"],["Celsius","Fahrenheit","Kelvin"],["Time"],["Nanosecond","Microsecond","Millisecond","Second","Minute","Hour","Day","Week","Month","Year","Decade","Century"],["Volume"],["US liquid gallon","US liquid quart","US liquid pint","US legal cup","US fluid ounce","US tablespoon","US teaspoon","Cubic meter","Liter","Milliliter","Imperial gallon","Imperial quart","Imperial pint","Imperial cup","Imperial fluid ounce","Imperial tablespoon","Imperial teaspoon","Cubic foot","Cubic inch"]]
    
    private var tappedCell = -1
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //func numberOfSections(in tableView: UITableView) -> Int {
    //  return 1;
    //}
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return catList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if indexPath.row%2 == 0 {
            
            //            var cell:UITableViewCell? = self.tableview.dequeueReusableCell(withIdentifier: "Cat") as UITableViewCell!
            
            //            if(cell == nil)
            //            {
            let cell:UITableViewCell? = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cat")
            //print("new cat: \(indexPath.row)")
            //            }
            //print(indexPath.row)
            let disclosureImage = UIImage(named: "ic_keyboard_arrow_right_18pt")
            let disclosureView = UIImageView(image: disclosureImage)
            
            disclosureView.frame = CGRect(x: 80, y: 0, width: 25, height: 25)
            disclosureView.tintColor = UIColor(white:0, alpha:0.10)
            cell?.accessoryView = disclosureView
            cell?.accessoryType = .disclosureIndicator
            cell?.textLabel?.text = self.catList[indexPath.row][0]
            
            let myCustomSelectionColorView = UIView()
            myCustomSelectionColorView.backgroundColor = UIColor(red: 255/255, green: 193/255, blue: 7/255, alpha: 1)
            cell?.selectedBackgroundView = myCustomSelectionColorView
            cell?.textLabel?.font = UIFont(name: "Roboto-Regular", size:16)
            return cell!
            
        } else {
            
            //            var cell:CustomCell? = tableview.dequeueReusableCell(withIdentifier: "Sub") as?  CustomCell
            //
            //            if(cell == nil)
            //            {
            let cell:SubTableCells?  = SubTableCells(style: UITableViewCellStyle.default, reuseIdentifier: "Sub")
            //            }
            print("sub: \(indexPath.row)")
            cell?.dataArr = self.catList[indexPath.row]
            
            return cell!
        }
        
        
    }
    
    
    
    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let cell:UITableViewCell? = tableView.cellForRow(at: indexPath)
        
        if cell == nil {
            
            if indexPath.row%2 == 0 {
                return 40
            } else {
                return 0
            }
            
        } else {
            
            if cell?.reuseIdentifier == "Sub" && indexPath.row == (tappedCell + 1) {
                
                if isToggleCell == 0 && openCellNo == (tappedCell + 1) {
                    isToggleCell = 1
                    openCellNo = tappedCell+1
                    tappedCell = -1
                    return CGFloat(self.catList[indexPath.row].count * 30)
                } else if openCellNo == (tappedCell + 1) {
                    isToggleCell = 0
                    tappedCell = -1
 
                    return 0
                } else {
                    openCellNo = tappedCell+1
                    tappedCell = -1
                    isToggleCell = 1
                    return CGFloat(self.catList[indexPath.row].count * 30)
                }
                
            } else if cell?.reuseIdentifier == "Cat" {
                return  40
            } else {
                return 0
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        let selectedCell:UITableViewCell? = tableView.cellForRow(at: indexPath)
        
        PassData.sharedInstance.category = (selectedCell?.textLabel?.text)!
        
        if isRotatedCell == 0 {
            UIView.animate(withDuration:0.5, animations: { () -> Void in
                selectedCell?.accessoryView?.transform = CGAffineTransform(rotationAngle: .pi/2)
                self.isRotatedCell = 1
            })
        } else {
            UIView.animate(withDuration:0.5, animations: { () -> Void in
                selectedCell?.accessoryView?.transform = CGAffineTransform(rotationAngle: .pi*2 )
                self.isRotatedCell = 0
            })
            
        }
        
        // selectedCell?.contentView.backgroundColor = UIColor(red: 255/255, green: 193/255, blue: 7/255, alpha: 1)
        tappedCell = indexPath.row
        
        //selectedCell?.backgroundColor = UIColor(red: 255/255, green: 193/255, blue: 7/255, alpha: 1)
        
        //selectedCell?.textLabel?.textColor = UIColor.white
        
        //                print("You tapped cell number \(indexPath.row).")
        
        
        //UIView.setAnimationsEnabled(false)
        
        
        // UIView.setAnimationsEnabled(true)
        
        
        
        
        //CATransaction.begin()
        
        tableview.beginUpdates()
        tableview.endUpdates()
        // CATransaction.setCompletionBlock {
        self.tableview.scrollToRow(at: indexPath,
                                   at: UITableViewScrollPosition.top, animated: true)
        //}
        
        
        
        // CATransaction.commit()
        
        
        
    }
    
    //    func tableView(_ tableView: UITableView, didEndDisplayingCell indexPath: IndexPath) {
    //        let selRow = tableview.indexPathForSelectedRow
    //        tableview.scrollToRow(at: selRow!,
    //                              at: UITableViewScrollPosition.top, animated: true)
    //
    //    }
    
    //    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
    //
    //    }
    //
    //    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    //    //    let selectedCell:UITableViewCell? = tableView.cellForRow(at: indexPath)
    //        //selectedCell?.textLabel?.textColor = UIColor.black
    //    }
    
    
    // override func viewDidAppear(_ animated: Bool) {
    
    //    tableview.reloadData()
    
    //}
    
}
