//
//  ViewController.swift
//  ColorPalette
//
//  Created by Ömer Faruk Okumuş on 19.04.2023.
//

import UIKit

class ColorPaletteVC: UIViewController {
    
    var colorPalette: [UIColor] = []
    
    enum Cell {
        static let colorCell = "colorCell"
    }
    
    enum Segue {
        static let toColorDetailVC = "toColorDetailVC"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateColorPalette()
    }
    
    private func populateColorPalette() {
        for _ in 0..<50 {
            colorPalette.append(.random())
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToColorDetailVC" {
            let vc = segue.destination as! ColorDetailVC
            guard let color = sender as? UIColor else { return }
            vc.color = color
        }
    }
}

extension ColorPaletteVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorPalette.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell.colorCell) else {
            return UITableViewCell()
        }
        cell.backgroundColor = colorPalette[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: Segue.toColorDetailVC,
                     sender: UIColor.blue)
        
    }
    
}

