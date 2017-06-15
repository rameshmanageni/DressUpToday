//
//  CancelableDispatchQueue.swift
//  Mezuka
//
//  Created by Hasan H. Topcu on 24/03/2017.
//  Copyright © 2017 Mezuka. All rights reserved.
//

import Foundation

typealias CancelableBlock = (_ cancel: Bool) -> Void

class CancelableDispatchQueue {
    static func asyncAfter(deadline: DispatchTime, queue: DispatchQueue, block: @escaping () -> Void) -> CancelableBlock {
        var isCanceled: Bool = false
        
        let cancelableBlock: CancelableBlock = { cancel in
            isCanceled = cancel
        }
        
        queue.asyncAfter(deadline: deadline) {
            if(isCanceled == false) {
                block()
            }
        }
        
        return cancelableBlock
    }
}
