//
//  HomeViewController.swift
//  HenriPotier
//
//  Created by Nicolas Fonsat on 11/02/2020.
//  Copyright © 2020 BlackStyle. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private var henryPotierWS: HenryPotierWebService {
        return HenryPotierWebService.shared
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func testFetching(_ sender: UIButton) {
        self.henryPotierWS.fetchBooks { (books) in
            print(books)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
