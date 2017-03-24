//
//  PhoneContactsVC.swift
//  BdayScrollScreen
//
//  Created by Appinventiv on 22/03/17.
//  Copyright © 2017 Appinventiv. All rights reserved.
//

import UIKit

class PhoneContactsVC: UIViewController {

    let data = [["Aadam Jhonathan","Aadrian Hansberg","Aamanda Smith","Aamani Ponting","Aariana Evans"],
                ["Badam Jhonathan","Badrian Hansberg","Bamanda Smith","Bamani Ponting","Bariana Evans"],
                ["Cadam Jhonathan","Cadrian Hansberg","Camanda Smith","Camani Ponting","Cariana Evans"],
                ["Dadam Jhonathan","Dadrian Hansberg","Damanda Smith","Damani Ponting","Dariana Evans"],
                ["Eadam Jhonathan","Eadrian Hansberg","Eamanda Smith","Eamani Ponting","Eariana Evans"],
                ["Fadam Jhonathan","Fadrian Hansberg","Famanda Smith","Famani Ponting","Fariana Evans"],
                ["Gadam Jhonathan","Gadrian Hansberg","Gamanda Smith","Gamani Ponting","Gariana Evans"],
                ["Hadam Jhonathan","Hadrian Hansberg","Hamanda Smith","Hamani Ponting","Hariana Evans"],
                ["Iadam Jhonathan","Iadrian Hansberg","Iamanda Smith","Iamani Ponting","Iariana Evans"],
                ["Jadam Jhonathan","Jadrian Hansberg","Jamanda Smith","Jamani Ponting","Jariana Evans"],
                ["Kadam Jhonathan","Kadrian Hansberg","Kamanda Smith","Kamani Ponting","Kariana Evans"],
                ["Ladam Jhonathan","Ladrian Hansberg","Lamanda Smith","Lamani Ponting","Lariana Evans"],
                ["Madam Jhonathan","Madrian Hansberg","Mamanda Smith","Mamani Ponting","Mariana Evans"],
                ["Nadam Jhonathan","Nadrian Hansberg","Namanda Smith","Namani Ponting","Nariana Evans"],
                ["Oadam Jhonathan","Oadrian Hansberg","Oamanda Smith","Oamani Ponting","Oariana Evans"],
                ["Padam Jhonathan","Padrian Hansberg","Pamanda Smith","Pamani Ponting","Pariana Evans"],
                ["Qadam Jhonathan","Qadrian Hansberg","Qamanda Smith","Qamani Ponting","Qariana Evans"],
                ["Radam Jhonathan","Radrian Hansberg","Ramanda Smith","Ramani Ponting","Rariana Evans"],
                ["Sadam Jhonathan","Sadrian Hansberg","Samanda Smith","Samani Ponting","Sariana Evans"],
                ["Tadam Jhonathan","Tadrian Hansberg","Tamanda Smith","Tamani Ponting","Tariana Evans"],
                ["Uadam Jhonathan","Uadrian Hansberg","Uamanda Smith","Uamani Ponting","Uariana Evans"],
                ["Vadam Jhonathan","Vadrian Hansberg","Vamanda Smith","Vamani Ponting","Variana Evans"],
                ["Wadam Jhonathan","Wadrian Hansberg","Wamanda Smith","Wamani Ponting","Wariana Evans"],
                ["Xadam Jhonathan","Xadrian Hansberg","Xamanda Smith","Xamani Ponting","Xariana Evans"],
                ["Yadam Jhonathan","Yadrian Hansberg","Yamanda Smith","Yamani Ponting","Yariana Evans"],
                ["Zadam Jhonathan","Zadrian Hansberg","Zamanda Smith","Zamani Ponting","Zariana Evans"]]
    
    let sectionData = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
    
    
    @IBOutlet weak var personsTableView: UITableView!
    @IBOutlet weak var sendInviteButton: UIButton!
    
    override func viewDidLoad() {
    
        super.viewDidLoad()
        
        personsTableView.dataSource = self
        personsTableView.delegate = self
        
        self.registerHeaderView()
        
        personsTableView.sectionIndexBackgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8274509804, blue: 0.8274509804, alpha: 1)
        personsTableView.sectionIndexTrackingBackgroundColor = #colorLiteral(red: 0.8274509804, green: 0.8274509804, blue: 0.8274509804, alpha: 1)
        personsTableView.sectionIndexColor = UIColor.black
        
        sendInviteButton.backgroundColor = #colorLiteral(red: 0.8896138928, green: 0.2772284698, blue: 0.386128794, alpha: 1)
        sendInviteButton.layer.cornerRadius = sendInviteButton.bounds.height / 2
        self.automaticallyAdjustsScrollViewInsets = false
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func selectedButton(_ sender: UIButton) {
    
        sender.isSelected = !(sender.isSelected)
    }
    
    func registerHeaderView() {
    
        let headerViewNib = UINib(nibName: "HeaderView", bundle: nil)
        personsTableView.register(headerViewNib, forHeaderFooterViewReuseIdentifier: "HeaderViewID")

    }

}

extension PhoneContactsVC: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhoneContactsTableCellID", for: indexPath) as! PhoneContactsTableCell
        
        cell.personName.text = self.data[indexPath.section][indexPath.row]
        cell.personContactNumber.text = "990-909-0990"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    //height of header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 30
    }
    
    //view of header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerViewObj = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderViewID") as! HeaderView
        
        headerViewObj.sectionName.text = "\(sectionData[section])"
        headerViewObj.sectionName.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        return headerViewObj
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sectionData
    }
    
    // tell table which section
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {

        return index
    }
}
