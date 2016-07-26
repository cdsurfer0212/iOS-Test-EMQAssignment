//
//  ADKNibCacheManagerExtension.swift
//  EMQAssignment
//
//  Created by Sean Zeng on 6/26/16.
//  Copyright © 2016 Yahoo. All rights reserved.
//

import Foundation
import AppDevKit

extension ADKNibCacheManager
{
    public func instanceForNibNamedByExtension<T>(nibName: String!) -> T {
        let instance = ADKNibCacheManager.sharedInstance().instanceForNibNamed(nibName) as! T
        return instance
    }
}