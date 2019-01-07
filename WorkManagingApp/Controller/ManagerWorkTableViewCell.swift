//
//  ManagerWorkTableViewCell.swift
//  WorkManagingApp
//
//  Created by David Perez on 6/4/18.
//  Copyright © 2018 David Perez P. All rights reserved.
//

import UIKit

class ManagerWorkTableViewCell: UITableViewCell {

    let viewBack: UILabel =  {
        let v = UILabel()
        v.layer.cornerRadius = 10
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .white
        v.layer.shadowColor = UIColor.black.cgColor
        v.layer.masksToBounds = true
        v.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        v.layer.shadowRadius = 5.0
        return v
    }()
    
    let descriptionTextView: UILabel = {
        let d = UILabel()
        d.backgroundColor = .clear
        d.numberOfLines = 4
        d.shadowColor = UIColor.darkGray
        d.shadowOffset = CGSize(width: 0.0, height: 1.0)
        d.translatesAutoresizingMaskIntoConstraints = false
        return d
    }()
    let priceTextView: UILabel = {
        let d = UILabel()
        d.backgroundColor = .clear
        d.font = UIFont.systemFont(ofSize: 30)
        d.shadowColor = UIColor.darkGray
        d.shadowOffset = CGSize(width: 0.0, height: 1.0)

        d.textAlignment = NSTextAlignment.center
        d.translatesAutoresizingMaskIntoConstraints = false
        return d
    }()
    let timeTextView: UILabel = {
        let d = UILabel()
        d.backgroundColor = .clear
        d.font = UIFont.systemFont(ofSize: 30)
        d.textAlignment = NSTextAlignment.center
        d.translatesAutoresizingMaskIntoConstraints = false
        return d
    }()
    
    let separatorView: UILabel = {
        let s = UILabel()
        s.backgroundColor = .clear
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        layer.cornerRadius = 10
        backgroundColor  = .clear
        viewSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
        // Initialization code
    }
    
    func viewSetup(){
        addSubview(viewBack)
        addSubview(descriptionTextView)
        addSubview(priceTextView)
        addSubview(timeTextView)
        
        layer.cornerRadius = 5
        heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        viewBack.heightAnchor.constraint(equalToConstant: 150).isActive = true
        viewBack.topAnchor.constraint(equalTo: topAnchor).isActive = true
        viewBack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        viewBack.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
        viewBack.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
        
        descriptionTextView.topAnchor.constraint(equalTo: viewBack.topAnchor).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        descriptionTextView.heightAnchor.constraint(equalToConstant: 150/3).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        
       
        
        priceTextView.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor).isActive = true
        priceTextView.bottomAnchor.constraint(equalTo: self.timeTextView.topAnchor).isActive = true
        priceTextView.heightAnchor.constraint(equalToConstant: 150/3).isActive = true

        priceTextView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        priceTextView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        
        timeTextView.topAnchor.constraint(equalTo: priceTextView.bottomAnchor).isActive = true
        timeTextView.heightAnchor.constraint(equalToConstant: 150/3).isActive = true

        timeTextView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        timeTextView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        timeTextView.bottomAnchor.constraint(equalTo: viewBack.bottomAnchor).isActive = true
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
