//
//  usemodel.swift
//  log
//
//  Created by TOPS on 8/6/18.
//  Copyright © 2018 dp. All rights reserved.
//

import UIKit

class usemodel: NSObject {
    
    var user_id : Int?
    var u_name : String?
    var userid : String?
    var userpass : String?
    var u_mob : String?
    
    init(user_id : Int,u_name : String,userid : String,userpass : String,u_mob : String) {
        
        self.user_id = user_id;
        self.u_name = u_name;
        self.userid = userid;
        self.userpass = userpass;
        self.u_mob = u_mob;
        
    }

}
