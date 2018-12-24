//
//  ReachabilityManager.swift
//  blissProject
//
//  Created by André Nogueira on 12/23/18.
//  Copyright © 2018 André Nogueira. All rights reserved.
//
import Reachability

class ReachabilityManager: NSObject {
    
    var listeners = [NetworkStatusListener]()
    static  let shared = ReachabilityManager()  // 2. Shared instance
    // 3. Boolean to track network reachability
    var isNetworkAvailable : Bool {
        return reachabilityStatus != .none
    }
    // 4. Tracks current NetworkStatus (notReachable, reachableViaWiFi, reachableViaWWAN)
    var reachabilityStatus: Reachability.Connection = .none
    
    // 5. Reachability instance for Network status monitoring
    let reachability = Reachability()!
    
    @objc func reachabilityChanged(notification: Notification) {
        let reachability = notification.object as! Reachability
        switch reachability.connection {
        case .none:
            debugPrint("Network became unreachable")
        case .wifi:
            debugPrint("Network reachable through WiFi")
        case .cellular:
            debugPrint("Network reachable through Cellular Data")
        }
        
        // Sending message to each of the delegates
        for listener in listeners {
            listener.networkStatusDidChange(status: reachability.connection)
        }
    }
    
    /// Starts monitoring the network availability status
    func startMonitoring() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.reachabilityChanged),
                                               name: Notification.Name.reachabilityChanged,
                                               object: reachability)
        do{
            try reachability.startNotifier()
        } catch {
            debugPrint("Could not start reachability notifier")
        }
    }
    
    func stopMonitoring(){
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self,
                                                  name: Notification.Name.reachabilityChanged,
                                                  object: reachability)
    }
    
    func addListener(listener: NetworkStatusListener){
        listeners.append(listener)
    }
    
    /// Removes a listener from listeners array
    ///
    /// - parameter delegate: the listener which is to be removed
    func removeListener(listener: NetworkStatusListener){
        listeners = listeners.filter{ $0 !== listener}
    }
    
    
}
