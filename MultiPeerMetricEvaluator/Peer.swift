//
//  Peer.swift
//  MultiPeerMetricEvaluator
//
//  Created by Michael Tran on 3/2/17.
//  Copyright © 2017 Example. All rights reserved.
//

import UIKit
import MultipeerConnectivity

class Peer {
    
    var peerID : MCPeerID
    var notifyTime: DispatchTime?
    var rtt : Double
    
    init(peerID: MCPeerID, notifyTime: DispatchTime?) {
        self.peerID = peerID
        self.notifyTime = notifyTime
        rtt = 0
    }
    
    func calculateRTT() -> Double {
        if notifyTime == nil {
            rtt = 0
            return rtt
        }
        let nanoTime = DispatchTime.now().uptimeNanoseconds - (notifyTime?.uptimeNanoseconds)!
        rtt = Double(nanoTime) / 1_000_000_000
        return rtt
    }
}
