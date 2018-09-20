
import UIKit

class register: UIViewController,usermodeldelegate{

    override func viewDidLoad() {
        
       
        super.viewDidLoad()
        
       
   }
    
    override func viewDidAppear(_ animated: Bool) {
        reloadata()
    }
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var mailid: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confpass: UITextField!
    @IBOutlet weak var mobno: UITextField!
    
    
    @IBAction func userchange(_ sender: Any) {
        
        if isValidInput(Input: username.text!) {
            
            username.rightViewMode = .never
            username.clipsToBounds = true
            username.layer.borderWidth = 1
            username.layer.borderColor = UIColor.green.cgColor
        }
        else{
            
            username.rightViewMode = .whileEditing
            let user_imgview = UIImageView(image: UIImage(named: "if_Error_381599.png"))
            username.rightView = user_imgview
            username.clipsToBounds = true
            username.layer.borderWidth = 1
            username.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    @IBAction func mailchange(_ sender: Any) {
    
        if isValidEmail(testStr: mailid.text!) {
            mailid.rightViewMode = .never
            mailid.clipsToBounds = true
            mailid.layer.borderWidth = 1
            mailid.layer.borderColor = UIColor.green.cgColor
        }
        else{
            mailid.rightViewMode = .whileEditing
            let mail_imgview = UIImageView(image: UIImage(named: "if_Error_381599.png"));
            mailid.rightView = mail_imgview;
            mailid.clipsToBounds = true
            mailid.layer.borderWidth = 1
            mailid.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    @IBAction func passchange(_ sender: Any) {
        if isPasswordValid(password.text!) {
           password.rightViewMode = .never
           password.clipsToBounds = true
           password.layer.borderWidth = 1
           password.layer.borderColor = UIColor.green.cgColor
        }
        else{
            password.rightViewMode = .whileEditing
            let user_imgview = UIImageView(image: UIImage(named: "if_Error_381599.png"))
            password.rightView = user_imgview
            password.clipsToBounds = true
            password.layer.borderWidth = 1
            password.layer.borderColor = UIColor.red.cgColor
        }
    }
    
    @IBAction func confpasschanged(_ sender: Any) {
             if confpass.text == password.text {
            confpass.rightViewMode = .never
            confpass.clipsToBounds = true
            confpass.layer.borderWidth = 1
            confpass.layer.borderColor = UIColor.green.cgColor

        }
        else{
            confpass.rightViewMode = .whileEditing
            let user_imgview = UIImageView(image: UIImage(named: "if_Error_381599.png"))
            confpass.rightView = user_imgview
            confpass.clipsToBounds = true
            confpass.layer.borderWidth = 1
            confpass.layer.borderColor = UIColor.red.cgColor
        }


    }
    
    @IBAction func mobchanged(_ sender: Any) {
        if validate(value: mobno.text!) {
            mobno.rightViewMode = .never
            mobno.clipsToBounds = true
            mobno.layer.borderWidth = 1
            mobno.layer.borderColor = UIColor.green.cgColor
        }
        else{
            let user_imgview = UIImageView(image: UIImage(named: "if_Error_381599.png"))
            mobno.rightView = user_imgview
            mobno.clipsToBounds = true
            mobno.layer.borderWidth = 1
            mobno.layer.borderColor = UIColor.red.cgColor
        }
        
    }
    
        @IBAction func acc(_ sender: Any) {
        
        
        if username.text != "" && mailid.text != "" && password.text != "" && confpass.text != "" && mobno.text != "" {
            
            if isValidInput(Input: username.text!) && isValidEmail(testStr: mailid.text!) && isPasswordValid(password.text!) && isPasswordValid(confpass.text!) && validate(value: mobno.text!) && password.text == confpass.text{
                
                
                
                let obj = usemodel(user_id: 0, u_name: username.text!, userid: mailid.text!, userpass: password.text!, u_mob: mobno.text!);
                
                let objcnt = usercontroller();
                
                objcnt.delegate = self
                
                objcnt.insertdata(obj: obj);
                
               
                
                let stb = self.storyboard?.instantiateViewController(withIdentifier: "sub")
                self.navigationController?.pushViewController(stb!, animated: true)
                                
                }
                
            
        }
        else {
            
            let alt = UIAlertController(title: "enter detail is incorrect", message: "enter valid details", preferredStyle: .alert)
            let ok = UIAlertAction(title: "ok", style: .default, handler: {action in
            
            })
            alt.addAction(ok);
            self.present(alt, animated: true, completion: {action in
            })
            
            
        }
            
        
        
}
    
    func returnval (stt : String){
        
        print(stt);
        
    }

    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    func isValidInput(Input:String) -> Bool {
        let RegEx = "\\A\\w{7,18}\\z"
        let usernameTest = NSPredicate(format:"SELF MATCHES %@", RegEx)
        return usernameTest.evaluate(with: Input)
    }
    
    
    
    func isPasswordValid(_ password : String) -> Bool{
        let RegEx = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}"
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", RegEx);
        return passwordTest.evaluate(with: password)
    }
    
    
    func validate(value: String) -> Bool {
        let PHONE_REGEX = "([0-9]{10})?"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        return phoneTest.evaluate(with: value)
    }
    
    
    func reloadata() {
        username.text="";
        username.layer.borderColor = UIColor.black.cgColor
        mailid.text="";
        mailid.layer.borderColor = UIColor.black.cgColor
        password.text="";
        password.layer.borderColor = UIColor.black.cgColor
        confpass.text="";
        confpass.layer.borderColor = UIColor.black.cgColor
        mobno.text="";
        mobno.layer.borderColor = UIColor.black.cgColor
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
  
    }

}
