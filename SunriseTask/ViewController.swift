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
            self.sunSet.text = sunset
            self.sunRise.text = sunrise
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
