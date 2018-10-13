//
//  ViewController.swift
//  DomainParserExample
//
//  Created by Sheshnath Kumar on 07/10/18.
//  Copyright © 2018 Example Technologies. All rights reserved.
//

import UIKit
import DomainParser

class ViewController: UIViewController {

    var domainParser:DomainParser?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let topLevelDomainName = ViewController.getTLD(withSiteURL: "https://www.google.co.in") {
            print("top level name = \(topLevelDomainName)")
        }
    }

    static func getTLD(withSiteURL:String) -> String? {
        do{
            let domainParse = try DomainParser()
            if let publicSuffixName = domainParse.parse(host: withSiteURL)?.publicSuffix {
                if let domainName = domainParse.parse(host: withSiteURL)?.domain {
                    
                    let tldName = domainName.replacingOccurrences(of: publicSuffixName, with: "").replacingOccurrences(of: ".", with: "")
                    //print("top level name = \(tldName)")
                    return tldName
                }
            }
        }catch{
        }
        return nil
    }
    

}

