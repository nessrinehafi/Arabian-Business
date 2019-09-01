


import Foundation
import UIKit



public class Article  {
    

    public var id: Int?
   // public let source: NewsSource?
    public var title: String?
    public var likes: Int?
    public var seen: Int?
    public var saved: Int?
    
    
    public init(id: Int? ,  title: String?, likes: Int?, seen: Int?, saved: Int?) {
        self.id = id
        self.title = title
  
        self.likes = 0
        self.seen = 0
        self.saved = 0
        
    }
}
