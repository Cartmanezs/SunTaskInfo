//
//  ViewController.swift
//  SunriseTask
//
//  Created by Ingvar on 18.11.2020.
//

import UIKit
import GooglePlaces

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sunSet: UILabel!
    @IBOutlet weak var sunRise: UILabel!
    
    private var dataFetcherService = DataFetcherService(baseURLString: "https://api.sunrise-sunset.org")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func dateFormat(timeResult: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let date = dateFormatter.date(from:timeResult)!
        let convertDateFormatter = DateFormatter()
        convertDateFormatter.dateFormat = "h:mm a"
        return convertDateFormatter.string(from: date)
    }
    
    @IBAction func textFieldTapped(_ sender: Any) {
        textField.resignFirstResponder()
        let acController = GMSAutocompleteViewController()
        acController.delegate = self
        present(acController, animated: true, completion: nil)
    }
}

extension ViewController: GMSAutocompleteViewControllerDelegate {
    func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
        textField.text = place.name
        
        dataFetcherService.fetchSunStatus(longitude: place.coordinate.longitude,
                                          latitude: place.coordinate.latitude,
                                          completion: { [weak self] (sunInfo) in
                                            guard let `self` = self,
                                                  let sunrise = sunInfo?.results.sunrise,
                                                  let sunset = sunInfo?.results.sunset else {
                                                print("Cannot find location")
                                                return
                                            }
                                            
                                            if sunrise != "" && sunset != "" {
                                                
                                                self.sunRise.text = self.dateFormat(timeResult: sunrise)
                                                self.sunSet.text = self.dateFormat(timeResult: sunset)
                                                 
                                            }
                                            
                                          })
        dismiss(animated: true, completion: nil)
    }
    
    func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
        print("Error: ", error.localizedDescription)
    }
    
    func wasCancelled(_ viewController: GMSAutocompleteViewController) {
        dismiss(animated: true, completion: nil)
    }
}
