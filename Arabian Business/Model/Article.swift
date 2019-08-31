


import Foundation
import UIKit



public class Article {
  /*
    public class NewsSource {
        public let id: String?
        public let name: String
 
        public init(id: String?, name: String) {
            self.id = id
            self.name = name
        }
    }*/
    public var id: Int
   // public var source: NewsSource = NewsSource(id: "", name: "")
    public var author: String? = ""
    public var title: String
   // public var articleDescription: String?
 //   public var url: URL
 //   public var urlToImage: URL?
   // public var publishedAt: Date
    //public var content: String?
    
  /*  public init(id: Int, source: NewsSource, author: String?, title: String, articleDescription: String?, url: URL, urlToImage: URL?, publishedAt: Date , content: String?) {
        self.id = id
        self.source = source
        self.author = author
        self.title = title
      //  self.articleDescription = articleDescription
        //self.url = url
        //self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
    }*/
    
    public init(id: Int, author: String?, title: String) {
        self.id = id
        self.author = author
        self.title = title
     
    }
  
    
    
}
