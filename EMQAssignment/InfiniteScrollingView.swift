//
//  InfiniteScrollingView.swift
//  EMQAssignment
//
//  Created by Sean Zeng on 6/27/16.
//  Copyright © 2016 Yahoo. All rights reserved.
//

import UIKit
import AppDevKit

class InfiniteScrollingView: UIView, ADKInfiniteScrollingViewProtocol {
    private var activityIndicatorView: UIActivityIndicatorView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func ADKInfiniteScrollingStopped(scrollView: UIScrollView!) {
        activityIndicatorView!.stopAnimating()
    }
  
    func ADKInfiniteScrollingTriggered(scrollView: UIScrollView!) {
        activityIndicatorView!.stopAnimating()
    }

    func ADKInfiniteScrollingLoading(scrollView: UIScrollView!) {
        activityIndicatorView!.startAnimating()
    }
}
