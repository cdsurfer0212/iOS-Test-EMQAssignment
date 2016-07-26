//
//  ViewController.swift
//  EMQAssignment
//
//  Created by Sean Zeng on 6/24/16.
//  Copyright © 2016 Yahoo. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper
import AppDevKit

let inset: CGFloat = 10.0

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private var data: [Transaction] = [Transaction]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //setupInfiniteScrollingView()
        //setupCollectionView()
    }
    
    override func didMoveToParentViewController(parent: UIViewController?) {
        super.didMoveToParentViewController(parent)
        
        setupInfiniteScrollingView()
        setupCollectionView()
        
        fetchData(0, num: 10)
    }

    // MARK: Private methods
    func fetchData(start: Int, num: Int) {
        Alamofire.request(.GET, "https://hook.io/syshen/infinite-list", parameters: ["startIndex": start, "num": num]).responseArray { (response: Response<[Transaction], NSError>) in
            self.data.appendContentsOf(response.result.value!)
            self.collectionView.reloadData()
            self.collectionView.infiniteScrollingContentView.stopAnimating()
        }
    }
    
    func setupCell() {
        collectionView.registerNib(UINib(nibName: transactionCollectionViewCellIdentifier, bundle: nil), forCellWithReuseIdentifier: transactionCollectionViewCellIdentifier)
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = UIColor.clearColor()
        collectionView.dataSource = self
        collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        
        setupCell()
    }
    
    func setupInfiniteScrollingView() {
        let activityIndicatorView = UIActivityIndicatorView.init(frame: CGRectMake(0.0, 0.0, collectionView.frame.size.width, 50.0))
        activityIndicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.Gray
        activityIndicatorView.hidesWhenStopped = false
        activityIndicatorView.startAnimating()
        
        collectionView.ADKAddInfiniteScrollingWithHandleView(activityIndicatorView) {
            self.fetchData(self.data.count, num: 10)
        }
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(transactionCollectionViewCellIdentifier, forIndexPath: indexPath) as!TransactionCollectionViewCell
        let transaction = self.data[indexPath.item]
        cell.amountLabel.text = String(transaction.destination!.amount!)
        cell.currencyLabel.text = transaction.destination!.currency
        cell.idLabel.text = String(transaction.id!) + "."
        cell.noteLabel.text = transaction.source!.note!
        cell.recipientLabel.text = transaction.destination!.recipient
        cell.senderLabel.text = transaction.source!.sender
        
        return cell
    }
    
    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        //return ADKNibSizeCalculator.sharedInstance().sizeForNibNamed(transactionCollectionViewCellIdentifier, withStyle: ADKNibSizeStyle.FixedHeightScaling)
        
        let cell: TransactionCollectionViewCell = ADKNibCacheManager.sharedInstance().instanceForNibNamedByExtension(transactionCollectionViewCellIdentifier)
        cell.noteLabel.text = self.data[indexPath.item].source!.note!

        var cellSize = ADKNibSizeCalculator.sharedInstance().sizeForNibNamed(transactionCollectionViewCellIdentifier, withStyle: ADKNibSizeStyle.FixedHeightScaling, fitSize: CGSizeMake(collectionView.frame.size.width, CGFloat.max))
        cellSize.width -= inset * 2
        cellSize.height = cellSize.height - CGRectGetHeight(cell.noteLabel.bounds) + cell.noteLabel.sizeThatFits(cell.noteLabel.bounds.size).height
        return cellSize
        
        //let newSize = ADKCellDynamicSizeCalculator.sharedInstance().sizeForDynamicHeightCellInstance(cell, preferredSize: cellSize)
        //return newSize
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(inset, inset, inset, inset)
    }
}

