import UIKit

class SubTableCells: UITableViewCell,UITableViewDataSource,UITableViewDelegate {
    
    
    var dataArr:[String] = []
    var subMenuTableRight:UITableView?
    var subMenuTableLeft:UITableView?
    
    var from: String = ""
    var to: String = ""
    var isLeftDone = 0
    
    var catTable: ViewController?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        setUpTable()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        setUpTable()
    }
    
    func setUpTable()
    {
        
        subMenuTableLeft = UITableView(frame: CGRect.zero, style:UITableViewStyle.plain)
        subMenuTableLeft?.delegate = self
        subMenuTableLeft?.dataSource = self
        subMenuTableLeft?.rowHeight = 30//UITableViewAutomaticDimension
        subMenuTableLeft?.estimatedRowHeight = 100
        subMenuTableLeft?.register(UITableViewCell.self, forCellReuseIdentifier: "from")
        self.addSubview(subMenuTableLeft!)
        
        isLeftDone = 1
        
        subMenuTableRight = UITableView(frame: CGRect.zero, style:UITableViewStyle.plain)
        subMenuTableRight?.delegate = self
        subMenuTableRight?.dataSource = self
        subMenuTableRight?.rowHeight = 30//UITableViewAutomaticDimension
        subMenuTableRight?.estimatedRowHeight = 100
        subMenuTableRight?.register(UITableViewCell.self, forCellReuseIdentifier: "to")
        self.addSubview(subMenuTableRight!)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        subMenuTableLeft?.frame = CGRect(x: 0, y: 0, width: (self.bounds.size.width/2), height: self.bounds.size.height)
        
        subMenuTableRight?.frame = CGRect(x: (self.bounds.size.width/2), y: 0, width: (self.bounds.size.width/2), height: self.bounds.size.height)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if isLeftDone == 0 {
            
           var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "from")
            if(cell == nil){
                cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "from")
            }
            cell?.textLabel?.font = UIFont(name: "Roboto-Regular", size:12);
            
            cell?.textLabel?.text = dataArr[indexPath.row]
            
            return cell!
            
        } else {
            
            var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "to")
            if(cell == nil){
                cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "to")
            }
            cell?.textLabel?.font = UIFont(name: "Roboto-Regular", size:12);
            
            cell?.textLabel?.text = dataArr[indexPath.row]
            
            return cell!
        }
        
        
       // cell?.textLabel?.adjustsFontSizeToFitWidth = true
       // cell?.contentView.backgroundColor = UIColor.green
        
    }
  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
//        selectedCell.contentView.backgroundColor = UIColor(red: 187/255, green: 222/255, blue: 251/255, alpha: 1)
//        selectedCell.accessoryType = .checkmark
        tableView.scrollToNearestSelectedRow(at: UITableViewScrollPosition.top, animated: true)
        
    
        let selectedCell:UITableViewCell? = tableView.cellForRow(at: indexPath)
        selectedCell?.contentView.backgroundColor = UIColor(red: 33/255, green: 150/255, blue: 243/255, alpha: 1)
        selectedCell?.textLabel?.textColor = UIColor.white
        selectedCell?.tintColor = UIColor(red: 33/255, green: 150/255, blue: 243/255, alpha: 1)
        selectedCell?.accessoryType = .checkmark
        
       // catTable?.from = (selectedCell?.reuseIdentifier)!
        
        print(selectedCell?.reuseIdentifier as Any)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let selectedCell:UITableViewCell? = tableView.cellForRow(at: indexPath)
        selectedCell?.textLabel?.textColor = UIColor.black
        selectedCell?.accessoryType = .none
    }
    
//    func  tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 40.0
//    }
    
}
