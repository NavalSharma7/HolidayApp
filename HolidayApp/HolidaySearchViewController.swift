//
//  HolidaySearchViewController.swift
//  HolidayApp
//
//  Created by Naval Sharma on 2021-12-15.
//

import UIKit

class HolidaySearchViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var CountryPicker: UIPickerView?
    @IBOutlet weak var YearPicker: UIPickerView?
    
    @IBAction func SearchButtonAction(_ sender: UIButton) {
            performSegue(withIdentifier: "Search", sender: self)
        
        
    }
    var countriesList: [countries]!
    var year: Int!
    var country : String!
    var countriesPickerData: [String] = [String]()
    var countriesData: [String] = [String]()
    
    var yearPickerData: [Int] = []
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        APIHelper.getCountriesList(){
                   countries -> Void in
                   self.countriesList = countries
            
                
            let stringarray = self.countriesList.compactMap({$0.country_name})
           
            self.countriesPickerData.append(contentsOf:stringarray)
            self.CountryPicker!.delegate = self
            self.CountryPicker!.dataSource = self
           
        }
        
        
        self.YearPicker!.delegate = self
        self.YearPicker!.dataSource = self
        
         
        
        for i in 1...400{
            yearPickerData.append(i+1900)
        }
        
        
       
        
        // Connect data
               
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destination.
         Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
            let destination = segue.destination as? HolidaysTableViewController
        destination?.country = self.country
        destination?.year = self.year
            
        }
        
    
    
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
                return countriesPickerData.count
            } else {
                return yearPickerData.count
            }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
                return countriesPickerData[row]
            } else {
                return yearPickerData[row].description
            }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 1 {
            self.country = countriesPickerData[row]
            } else {
                self.year = yearPickerData[row]
            }
    }
    
}
