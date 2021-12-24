import UIKit

class FirstScreenController: UIViewController {
    
    let screen = FirstScreenView()
    var indiceMassaCorporal: Double = 0.0
    
    override func loadView() {
        super.loadView()
        self.view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.endEditing(true)
        
        // Add action for button
        screen.btn.addTarget(self, action: #selector(calculcate), for: .touchUpInside)
        
    }
    
    // disable keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    
    @objc func calculcate() {
        var sucesso: Bool = true
        if (screen.textFieldWeight.text?.isEmpty == true) {
            sucesso = false
            showAlert(title: "Atenção!", message: "O campo peso deve ser preenchido!")
        }
        
        if (screen.textFieldHeight.text?.isEmpty == true) {
            sucesso = false
            showAlert(title: "Atenção!", message: "O campo altura deve ser preenchido!")
        }
        
        if (sucesso == true){
            if let weight = Double(screen.textFieldWeight.text!), let height = Double(screen.textFieldHeight.text!) {
                indiceMassaCorporal = weight / (height * height)
                showsResults()
                print(indiceMassaCorporal)
                
                // Add value of imc in message
                screen.lblTitleInViewMessage.text = screen.lblTitleInViewMessage.text! + "\(String(format: "%.3f", indiceMassaCorporal))"
                
            }
        }
    }
    
    
    func showsResults() {
        var result: String = ""
        var image: String = ""
        switch indiceMassaCorporal{
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        
        screen.lblResultMessage.text = result
        screen.imageView.image = UIImage(named: image)
        screen.appearAtributtsView()
    }
    
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle:.alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


}

