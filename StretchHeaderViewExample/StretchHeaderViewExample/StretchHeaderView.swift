//
//  StretchHeaderView.swift
//  Easy House CPH
//
//  Created by Pérsio on 19/10/16.
//  Copyright © 2016 Persio Vieira. All rights reserved.
//

import UIKit

class StretchHeaderView: UIView {
    
    private let contentOffsetKeyPath = "contentOffset"
    
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.addObserver(self, forKeyPath: contentOffsetKeyPath, options: .prior, context: nil)
        }
    }
    
    private var initialFrame = CGRect.zero
    private var defaultHeight = CGFloat(0)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialFrame = self.frame
        self.defaultHeight = initialFrame.size.height
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if object as? UITableView == self.tableView && keyPath == contentOffsetKeyPath {
            stretch()
        }
    }
    
    private func stretch() {
        var f = frame
        f.size.width = tableView.frame.size.width
        frame = f
        
        if tableView.contentOffset.y < 0 {
            let offsetY = (tableView.contentOffset.y + tableView.contentInset.top) * -1
            initialFrame.origin.y = offsetY * -1
            initialFrame.size.height = defaultHeight + offsetY;
            self.frame = initialFrame
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        initialFrame.size.width = tableView.frame.size.width
        self.frame = initialFrame
    }
    
    func stopStretching() {
        tableView.removeObserver(self, forKeyPath: contentOffsetKeyPath)
    }
}

