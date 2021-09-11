import UIKit

class SecondViewController: UIViewController {

    var url = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        callService(urlString: url)
    }
    
    func callService(urlString: String) {
        APIManager.manejador.callAPIrequest (URLString: urlString) { responseJSON in
            print("Response JSON -> \(responseJSON)")
        } errorCompletion: { error in
            print("Error \(error.localizedDescription)")
        }
    }


}
