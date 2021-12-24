
import Foundation
import UIKit
import SnapKit

final class FirstScreenViewController:  UIView {

    lazy var lblTitle: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .white
        view.text = "Cálculo de IMC"
        view.font = UIFont.systemFont(ofSize: 36, weight: .heavy)
        view.textAlignment = .center
        return view
    }()
    
    
    lazy var lblSubTitleMessage: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .white
        view.text = "Descubra seu Índice de Massa Corporal"
        view.font = UIFont.systemFont(ofSize: 15, weight: .light)
        view.textAlignment = .center
        return view
    }()
    
    
    
    lazy var lblWeight: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .white
        view.text = "Peso (KG)"
        view.font = UIFont.systemFont(ofSize: 15, weight: .light)
        view.textAlignment = .center
        return view
    }()
    
    
    
    lazy var textFieldWeight: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = .white
        view.font = .systemFont(ofSize: 15, weight: .bold)
        view.textColor = .black
        view.layer.cornerRadius = 7.0
        view.placeholder = "EX: 75"
        view.keyboardType = .decimalPad
        return view
    }()
    
    
    
    
    lazy var lblHeight: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .white
        view.text = "Altura (M)"
        view.font = UIFont.systemFont(ofSize: 15, weight: .light)
        view.textAlignment = .center
        return view
    }()
    
    
    
    lazy var textFieldHeight: UITextField = {
        let view = UITextField(frame: .zero)
        view.backgroundColor = .white
        view.font = .systemFont(ofSize: 15, weight: .bold)
        view.textColor = .black
        view.layer.cornerRadius = 7.0
        view.placeholder = "EX: 1.75"
        view.keyboardType = .decimalPad
        return view
    }()
    
    
    lazy var btn: UIButton = {
        let view = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.setTitle("Calcular", for: .normal)
        view.setTitleColor(UIColor(hexString: "#51b1c0"), for: .normal)
        view.backgroundColor = .yellow
        view.addTarget(self, action: #selector(realizarCalculo), for: .touchUpInside)
        view.layer.cornerRadius = 7.0
        return view
    }()
    
    
    lazy var viewBack: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white
        return view
    }()
    
    
    lazy var lblTitleInViewMessage: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .gray
        view.text = "Seu Índice de Massa Corporal é: "
        view.font = UIFont.systemFont(ofSize: 15, weight: .light)
        view.textAlignment = .center
        return view
    }()
    
    lazy var lblResultMessage: UILabel = {
        let view = UILabel(frame: .zero)
        view.textColor = .black
        view.text = "Voce Está Obeso "
        view.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        view.textAlignment = .center
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFit
        view.backgroundColor = .red
        return view
    }()
    
    
    
    @objc func realizarCalculo() {
        print("Toquei aqui")
    }
    

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}


extension FirstScreenViewController: CodeView {

    func buildViewHierarchy() {
        addSubview(lblTitle)
        addSubview(lblSubTitleMessage)
        addSubview(lblWeight)
        addSubview(lblHeight)
        addSubview(textFieldWeight)
        addSubview(textFieldHeight)
        addSubview(btn)
        
        addSubview(viewBack)
        addSubview(lblTitleInViewMessage)
        addSubview(lblResultMessage)
        addSubview(imageView)
    }

    func setupConstraints() {
        lblTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.centerX.equalToSuperview()
        }
        
        lblSubTitleMessage.snp.makeConstraints { make in
            make.top.equalTo(lblTitle.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
        
        lblWeight.snp.makeConstraints { make in
            make.top.equalTo(lblSubTitleMessage.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(40)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        lblHeight.snp.makeConstraints { make in
            make.top.equalTo(lblSubTitleMessage.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(220)
            make.width.equalTo(100)
            make.height.equalTo(20)
        }
        
        
        textFieldWeight.snp.makeConstraints { make in
            make.top.equalTo(lblWeight.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(40)
            make.width.equalTo(120)
            make.height.equalTo(30)
        }
        
        textFieldHeight.snp.makeConstraints { make in
            make.top.equalTo(lblHeight.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(220)
            make.width.equalTo(120)
            make.height.equalTo(30)
        }
        
        btn.snp.makeConstraints { make in
            make.top.equalTo(textFieldWeight.snp.bottom).offset(40)
            make.left.equalTo(textFieldWeight.snp.left)
            make.right.equalTo(textFieldHeight.snp.right)
            make.height.equalTo(50)
        }
        
        
        //View
        viewBack.snp.makeConstraints { make in
            make.top.equalTo(btn.snp.bottom).offset(40)
            make.right.left.bottom.equalToSuperview()
        }
        
        lblTitleInViewMessage.snp.makeConstraints { make in
            make.top.equalTo(viewBack.snp.top).offset(20)
            make.centerX.equalToSuperview()
        }
        
        lblResultMessage.snp.makeConstraints { make in
            make.top.equalTo(lblTitleInViewMessage.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(lblResultMessage.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(30)
        }
        
        
        
        
    }

    func setupAdditionalConfiguration() {
        backgroundColor = UIColor(hexString: "#51b1c0")
        
    }
}
