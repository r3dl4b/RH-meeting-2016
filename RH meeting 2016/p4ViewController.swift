//
//  p4ViewController.swift
//  RH meeting 2016
//
//  Created by Billy Jack Bates Garcia on 8/4/16.
//  Copyright © 2016 Palindromo. All rights reserved.
//

import UIKit

class p4ViewController: UIViewController {
    var code_final: String! = "camara"
    
    @IBOutlet weak var validarButton: UIButton!
    @IBOutlet weak var validacion: UILabel!
    @IBOutlet weak var codigo: UITextField!
    var r1 : String! = "si"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
    }
    
    @IBAction func enviarResp(sender: AnyObject) {
        
        if (codigo.text == code_final){
            validacion.text = "Corecto"
            NSUserDefaults.standardUserDefaults().setObject(r1, forKey:"respuesta4")
            
            
        }
        else {
            validacion.text = "Incorrecto"
        }
        
        let correoData = NSUserDefaults.standardUserDefaults().stringForKey("UserCorreo")
        
        let request = NSMutableURLRequest(URL: NSURL(string: "http://app-pepsico.palindromo.com.mx/APP/respuestas.php")!)
        request.HTTPMethod = "POST"
        let postString = "correo=\(correoData!)"
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request){
            data, response, error in
            
            if error != nil {
                print("error\(error)")
                return
            }
            print("response = \(response)")
            
            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print("responseString = \(responseString)")
        }
        
        task.resume()
    }

}
