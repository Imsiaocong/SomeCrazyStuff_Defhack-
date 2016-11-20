//
//  HackathonViewController.swift
//  SomeCrazyStuff
//
//  Created by Di Wang on 2016/11/19.
//  Copyright © 2016年 Di Wang. All rights reserved.
//

import UIKit
import SwiftyJSON
import SwiftHTTP
import Alamofire


class HackathonViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var photosArray = [UIImageView]()
    
    @IBOutlet weak var introductionText: UITextView!
    
    
    
    
    
    
    
    
    
    
    
    fileprivate var viewRect: CGRect!
    fileprivate var cellIdentifier = "cellIdentifier"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        drawCollectionView()
        getData()
    }
    
    func drawCollectionView() {
        self.viewRect = CGRect(x: 0, y: 100, width: self.view.bounds.width, height: 200)
        
        ///////////////////////////
        ////////////////////////
        ////////////////////
        ////////////////
        ////////////
        ////////
        /////
        ///
        //
        self.collectionView = UICollectionView(frame: viewRect, collectionViewLayout: FlowLayout())
        self.collectionView.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.00)
        self.view.backgroundColor = UIColor(red:0.96, green:0.96, blue:0.96, alpha:1.00)
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        self.view.addSubview(collectionView)
        self.collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        ///////////////////////////
        ////////////////////////
        ////////////////////
        ////////////////
        ////////////
        ////////
        /////
        ///
        //
    }

    func getData() {
        
        Alamofire.request("https://hackteams.c6p7kpyzcymg.us-east-1.rds.amazonaws.com").response { response in
            print("Request: \(response.request)")
            print("Response: \(response.response)")
            print("Error: \(response.error)")
            
            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                print("Data: \(utf8Text)")
            }
        }
    }

}

extension HackathonViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! CustomCollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 50
        cell.photos.image = UIImage(named: "defaultImg")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellRow = indexPath.row
        if cellRow == 0 {
            performSegue(withIdentifier: "identifier_2", sender: self)
           
            
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "identifier_2" {
            let viewController = segue.destination as! HKDetailViewController
            
        }
        
    }
    
}
//???: How to parse data from
