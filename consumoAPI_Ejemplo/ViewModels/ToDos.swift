import UIKit
import SwiftyJSON

struct ToDos {
    var userId: Int?
    var id: Int?
    var title: String?
    var completed: Bool
    
    init (json: JSON) {
        userId = json["userId"].intValue
        id = json["id"].intValue
        title = json["title"].stringValue
        completed = json["completed"].boolValue
    }
}

