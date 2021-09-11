import UIKit
import SwiftyJSON


//https://www.officeapi.dev/api/{quotes o episodes o characters}

class ViewController: BaseViewController {
    
    var todosURL = "https://jsonplaceholder.typicode.com/todos"
    
    var toDosArray: [ToDos] = []
    
    @IBOutlet weak var TV_CustomTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Call APIRequest
        callService(todosURL)
        setupTableView()
    }
    
    //On viewController
    func callService(_ url: String) {
        APIManager.manejador.callAPIrequest(URLString: url){ responseJSON in
            self.stopAnimating()
            print("Response JSON -> \(responseJSON)")
            // MARK:- Asignar los valores al modelo
            self.JSONResponseHandler(responseJSON)
        } errorCompletion: { error in
            self.stopAnimating()
            print("Error \(error.localizedDescription)")
        }
    }
    
    func setupTableView(){
        TV_CustomTable.delegate = self
        TV_CustomTable.dataSource = self
        TV_CustomTable.register(UINib(nibName: "ToDosTableViewCell", bundle:nil), forCellReuseIdentifier: "ToDosTableViewCell")
    }
    
    func JSONResponseHandler(_ json: JSON) {
        toDosArray.removeAll()
        for index in json {
            print(index)
            self.toDosArray.append(ToDos(json: index.1))
        }
        TV_CustomTable.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDosTableViewCell", for: indexPath) as! ToDosTableViewCell
        cell.LBL_IdLabel.text = String(describing: toDosArray[indexPath.row].id ?? 0)
        cell.LBL_TileLabel.text = toDosArray[indexPath.row].title
        cell.V_ActivationView.backgroundColor = toDosArray[indexPath.row].completed ? .green : .red
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
}

