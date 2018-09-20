
import UIKit

class profile_page: UIViewController,UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    var flg  = 0;
    var mainview  = UIView()
    var backgroudview = UIView();
    var tbl = UITableView();
    
    let menuarr = ["home","about tour","how it work","about your cart","about us","log out"]
    
    let collarr = ["12.jpg","123.jpeg","1234.jpeg","12345.jpeg","12.jpg","123.jpeg","1234.jpeg","12345.jpeg","1234.jpeg","12.jpg","123.jpeg"];
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

         navbar()
        searchbar()
    }
    
    func navbar()  {
        
        
        let btn = UIButton(type: .custom);
        btn.frame = CGRect(x: 0, y: 0, width: 40, height: 40);
        btn.setImage(UIImage(named: "images.png"), for: .normal);
        btn.addTarget(self, action: #selector(self.menubutton), for: .touchUpInside);
        
        let menubutton = UIBarButtonItem(customView: btn);
        self.navigationItem.rightBarButtonItem = menubutton;
        self.view.addSubview(btn)
        
       
        
    }
    
    
  func searchbar()   {
    
    let btnsearch = UIButton(type: .custom);
    btnsearch.frame = CGRect(x: 0, y: 0, width: 40, height: 40);
    btnsearch.setImage(UIImage(named: "search.png"), for: .normal);
    btnsearch.addTarget(self, action: #selector(self.test), for: .touchUpInside);
    
    let test = UIBarButtonItem(customView: btnsearch);
    self.navigationItem.leftBarButtonItem = test;
    self.view.addSubview(btnsearch)
    
    }
    
    func test() {
        let stb = self.storyboard?.instantiateViewController(withIdentifier: "search")
        self.navigationController?.pushViewController(stb!, animated: true)
       
    }
    
    func menubutton(sender:UIButton)
    {
        if flg == 0
        {
            showmenu()
        }
        else
        {
            hidemenu()
        }
    }
    
    func showmenu()
    {
        mainview = UIView(frame: CGRect(x: 0, y: 70, width: self.view.frame.size.width, height: self.view.frame.size.height-70));
        mainview.backgroundColor = UIColor.gray;
        mainview.alpha = 0.3;
        mainview.isUserInteractionEnabled = true;
        self.view.addSubview(mainview);
        
        
        tapgesture()
        
        backgroudview = UIView(frame: CGRect(x: 0, y: 70, width: 0, height: self.view.frame.size.height));
        backgroudview.backgroundColor = UIColor.gray;
        
        backgroudview.alpha = 1;
        
        tbl = UITableView(frame: CGRect(x: 0, y: 70, width: 0, height: self.view.frame.size.height-70));
        //footer remove after cell
        tbl.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0));
        tbl.tag = 2;
        
        tbl.dataSource = self;
        tbl.delegate = self;
        
        self.view.addSubview(tbl);
        
        
        
        //self.view.addSubview(backgroudview);
        
        UITableView.beginAnimations(nil, context: nil);
        UITableView.setAnimationDuration(0.6);
        tbl.frame = CGRect(x: 0, y: 70, width: 200, height: self.view.frame.size.height-70)
        
        UITableView.commitAnimations();
        flg = 1;
        
        
    }
    func hidemenu(){
        UITableView.beginAnimations(nil, context: nil);
        UITableView.setAnimationDuration(0.6);
        tbl.frame = CGRect(x: 0, y: 70, width: 0, height: self.view.frame.size.height-70)
        UIView.setAnimationDelegate(self);
        
        UIView.commitAnimations();
        
        flg = 0;
        
    }
    
    
    func tapgesture()  {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.slideout));
        tap.numberOfTapsRequired = 1;
        
        mainview.addGestureRecognizer(tap);
        
    }
    
    func slideout(sender:UITapGestureRecognizer) {
        UITableView.beginAnimations(nil, context: nil);
        UITableView.setAnimationDuration(0.6);
        tbl.frame = CGRect(x: 0, y: 70, width: 0, height: self.view.frame.size.height-70)
        UIView.setAnimationDelegate(self);
        
        UIView.commitAnimations();
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        
        mainview.removeFromSuperview();
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menuarr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menucell");
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "menucell", for: indexPath)
        
        cell.textLabel?.text = menuarr[indexPath.row]
        return cell;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let stb = self.storyboard?.instantiateViewController(withIdentifier: "search")
            self.navigationController?.pushViewController(stb!, animated: true)
            
        }
        if indexPath.row == 1 {
            let stb = self.storyboard?.instantiateViewController(withIdentifier: "search")
            self.navigationController?.pushViewController(stb!, animated: true)
            
        }
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collarr.count;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! Collection;
        
        cell.img1.image = UIImage(named: collarr[indexPath.row]);
        
        return cell;
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    

  
}
