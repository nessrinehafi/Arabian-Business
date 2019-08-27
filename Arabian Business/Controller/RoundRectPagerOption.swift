import Foundation
import Swift_PageMenu

struct RoundRectPagerOption: PageMenuOptions {
    
    var isInfinite: Bool = false
    
    var tabMenuPosition: TabMenuPosition = .top
    
    var menuItemSize: PageMenuItemSize {
        return .sizeToFit(minWidth: 80, height: 30)
    }
    
    var menuTitleColor: UIColor {
        return UIColor(red: 153/255, green: 153/255, blue: 153/255, alpha: 1.0)
    }
    
    var menuTitleSelectedColor: UIColor {
        return Theme.mainColor
    }
    
    var menuCursor: PageMenuCursor {
        return .roundRect(rectColor: .white, cornerRadius: 10, height: 22, borderWidth: nil, borderColor: nil)
    }
    
    var font: UIFont {
        return UIFont.systemFont(ofSize: UIFont.systemFontSize)
    }
    
    var menuItemMargin: CGFloat {
        return 6
    }
    
    var tabMenuBackgroundColor: UIColor {
        return Theme.mainColor
    }
    
    var tabMenuContentInset: UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
    }
    
    public init(isInfinite: Bool = false, tabMenuPosition: TabMenuPosition = .top) {
        self.isInfinite = isInfinite
        self.tabMenuPosition = tabMenuPosition
    }
}
