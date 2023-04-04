import Foundation
//import React

@objc(MyEventEmitter)
class MyEventEmitter: RCTEventEmitter {
    public static var shared: MyEventEmitter?
    
    override init() {
        super.init()
        MyEventEmitter.shared = self
    }
    
  override func supportedEvents() -> [String]! {
    return ["myJavscriptFunction"]
  }

  @objc
  func emitEvent(_ body: String) {
     let appDelegate = UIApplication.shared.delegate as! AppDelegate //For IOS
//      let appDelegate = NSApplication.shared.delegate as! AppDelegate // For MAC
     appDelegate.bridge.eventDispatcher().sendAppEvent(withName: "myJavscriptFunction", body: body)
////      appDelegate.bridge.eventDispatcher().sendAppEvent(withName: "myJavscriptFunction", body: body)

//      appDelegate.bridge.eventDispatcher().sendAppEvent(withName: "myJavscriptFunction", body: body)
////      appDelegate.bridge.eventDispatcher().sendAppEvent(withName: "myJavscriptFunction", body: body)
      
//      sendEvent(withName: "myJavscriptFunction", body: "TEST SEND EVENT")

//      AppDelegate.shared.bridge.eventDispatcher().sendAppEvent(withName: "myJavscriptFunction", body: body)
//    sendEvent(withName: eventName, body: body)
  }
    
    @objc
    func receiveData(_ body: NSArray) {
        print("IN ON EVENT:")
        for item in body {
          let name = (item as! NSDictionary)["name"] as! String
          let isoCode = (item as! NSDictionary)["iso_code"] as! String
          print("Name: \(name), ISO Code: \(isoCode)")
        }
    }

  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
