//
//  usercontroller.swift
//  log
//
//  Created by TOPS on 8/6/18.
//  Copyright © 2018 dp. All rights reserved.
//

import UIKit

protocol usermodeldelegate {
    
    func returnval(stt : String)
}

class usercontroller: NSObject {
    
    var delegate : usermodeldelegate?
    
    func insertdata(obj : usemodel)  {
        let url = URL(string: "http://localhost/mansi/Insert_Post_Json.php")
        
        let dic = ["u_name" : obj.u_name!,"userid" : obj.userid,"userpass" : obj.userpass,"u_mob" : obj.u_mob];
        
        do {
            let finalbody = try JSONSerialization.data(withJSONObject: dic, options: [])
            
            
            var request = URLRequest(url: url!);
            
            request.addValue(String(finalbody.count), forHTTPHeaderField: "Content-length")
            
            request.httpBody = finalbody;
            
            request.httpMethod = "POST";
            
            let session = URLSession.shared;
            
            let datatask = session.dataTask(with: request){
            
            (data1,rsp,err) in
                
                if err==nil{
                
                    let strrsp = String(data : data1!,encoding : String.Encoding.utf8);
                    
                    DispatchQueue.main.async {
                        
                    
                        self.delegate?.returnval(stt: strrsp!)
                        
                        
                    }
                
                }
            
            
            
            }
            datatask.resume()
            
            
            
        } catch  {
            
        }
        
       
        
        
        
        
        
    }
    

}
