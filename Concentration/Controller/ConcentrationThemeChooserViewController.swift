//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Amir Samir on 10/15/18.
//  Copyright © 2018 Amir Samir. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController , UISplitViewControllerDelegate {
    
    let Themes = [
        "Sports": "⚽️🏈🏓🥊🎾🚴🏿‍♂️🏒🤺🏋🏻‍♂️🏹",
        "Animals": "🐶🐴🐠🐥🐮🐝🐛🐙🐢🐵",
        "Faces": "😍😭😡😳😀😎😛🤢👿🤡",
        ]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        splitViewController?.delegate = self
    }
    
    func splitViewController
        (_ splitViewController: UISplitViewController,
         collapseSecondary secondaryViewController: UIViewController,
         onto primaryViewController: UIViewController) -> Bool {
        if let cvc = secondaryViewController as? ConcentrationViewController {
            if cvc.theme == nil {
                return true
            }
        }
        return false
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Choose Theme" {
            if let themeName = (sender as? UIButton)?.currentTitle , let theme = Themes[themeName] {
                if let cvc =  segue.destination as? ConcentrationViewController {
                    cvc.theme = theme
                }
            }
        }
    }
    
    
}
