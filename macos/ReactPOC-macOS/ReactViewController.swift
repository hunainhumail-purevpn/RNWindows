//
//  ReactViewController.swift
//  ReactPOC-macOS
//
//  Created by Basit on 21/03/2023.
//

import Cocoa
//import React

class ReactViewController: NSViewController {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//      guard let appDelegate = NSApplication.shared.delegate as? AppDelegate else {
//            return
//        }
//
//        let bridge = appDelegate.bridge
//        let rootView = RCTRootView(
//          bridge: bridge!,
//            moduleName: "ReactPOC",
//            initialProperties: nil
//        )
//      rootView.backgroundColor = NSColor.windowBackgroundColor
//      rootView.frame = view.bounds
//      view.addSubview(rootView)
//
//    }
    @IBOutlet weak var reactView: NSBox!
//  @IBOutlet weak var rootView3: RCTRootView
//  @IBOutlet var rootView2: RCTRootView! = RCTRootView(bridge: (NSApplication.shared.delegate as! AppDelegate).bridge, moduleName: "ReactPOC", initialProperties: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        bridge = RCTBridge(delegate: self, launchOptions: nil)

        loadReactNativeView()
        
    }
    
    func loadReactNativeView() {
////        let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")!
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let rootView = RCTRootView(bridge: appDelegate.bridge, moduleName: "app", initialProperties: nil)
////        let rootView =  RCTRootView(
////            bundleURL: jsCodeLocation,
////            moduleName: "app",
////            initialProperties: nil,
////            launchOptions: nil
////        )
        
        guard let appDelegate = NSApplication.shared.delegate as? AppDelegate else {
              return
          }

          let bridge = appDelegate.bridge
          let rootView = RCTRootView(
            bridge: bridge!,
              moduleName: "ReactPOC",
              initialProperties: nil
          )
      rootView.frame = reactView.bounds
      reactView.addSubview(rootView)
      
      rootView.translatesAutoresizingMaskIntoConstraints = false
      
      let topConstraint = rootView.topAnchor.constraint(equalTo: reactView.topAnchor)
      let bottomConstraint = rootView.bottomAnchor.constraint(equalTo: reactView.bottomAnchor)
      let leftConstraint = rootView.leftAnchor.constraint(equalTo: reactView.leftAnchor)
      let rightConstraint = rootView.rightAnchor.constraint(equalTo: reactView.rightAnchor)

      rootView.backgroundColor = .windowBackgroundColor
      
      reactView.addConstraints([topConstraint,bottomConstraint,leftConstraint,rightConstraint])

               // Add the RCTRootView to your UIView
     
    }
    
    @IBAction func countryFetchBtn(_ sender: Any) {
        MyEventEmitter.shared?.emitEvent("HEELLLLLLOOOOO!!!!!")
    }
}
