import Alamofire
import Foundation
import SwiftyJSON

typealias SuccessBlock = (JSON) -> Void
typealias ErrorBlock = (Error) -> Void

class APIManager {
    static var manejador = APIManager()
    var successResponse: SuccessBlock!
    var errorResponse: ErrorBlock!
    //var URLString = "https://www.officeapi.dev/api/quotes/"
    
    init() {
    
    }
    //Call APIRequest for all Quotes
    func callAPIrequest(URLString: String,successCompletion: @escaping SuccessBlock, errorCompletion: @escaping ErrorBlock) {
        AF.request(URLString, method: .get).responseJSON {response in
            if let error = response.error {
                errorCompletion(error)
            } else {
                if let responseData = response.data {
                    let json = JSON(responseData)
                    successCompletion(json)
                }
            }
        }
    }
}
