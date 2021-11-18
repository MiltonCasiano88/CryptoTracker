//
//  ViewController.swift
//  CryptoTracker
//
//  Created by Milton Casiano on 11/17/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var outputLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func ButtonPressed(_ sender: Any) {
        
        if let symbol = textField.text {
            
            getData(symbol : symbol)
    }
        

            
    }
        
    var url = "https://min-api.cryptocompare.com/data/price?tsyms=USD"
        
    func getData(symbol : String) {
        
            url = "\(url)&fsym=\(symbol)"
        
            //1, Initialize the URL
            
            guard let url  = URL(string: url) else {return}
            
        
        //2. Initialize task and URL Session
            
            let task = URLSession.shared.dataTask(with: url) { data, _, error in
                
                
                //3. Check Optionals
                
                guard let data = data, error == nil else {return}
                
                
                print("Data Received")
                
                do {
                
                let Result = try JSONDecoder().decode(APIResponse.self, from: data)
                
                    print(Result.USD)
                    
                    //               |HOV (Grand Central Dispatch)|1|2|3|4|5|
                    //
                    //                sync | async | concurrency | sequential
                    //
                    //
                    //                seq : A -> B -> C
                    //                conc :
                    //                A -----end time
                    //                B ----------
                    //                C -----
                    //
                    //                0
                    
                    DispatchQueue.main.async {
                                        
                                    self.outputLabel.text = "\(Result.USD)"
                                        
                                    }
                    
            }
                //5. Define Response Parameters in a Structure
                
                catch {
                    
                    print(error.localizedDescription)
                    
                }
            
            }
            //resume task
            task.resume()
            
            
                    //CLOSURE - create a function with function within function
            
        }
        
            //1. Initialize URL
            
            //2. Initialize Task and URL Session
            
            //3 Check Optionals
            
            //4. Resume Task
            
            //5. Define Response Parameters in a Structure
    
    //5. Define Response Parameters in a Structure
    
    struct APIResponse : Codable {
        
        let USD : Float

    }
    }


