//
//  ViewController.swift
//  CalcButtons
//
//  Created by Don Mag on 3/9/20.
//  Copyright © 2020 Don Mag. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
	override func layoutSubviews() {
		super.layoutSubviews()
		layer.cornerRadius = bounds.height * 0.5
	}
}

struct CalcButton {
	var normalTitle: String = ""
	var selectedTitle: String = ""
	var foreColor: UIColor = .white
	var backColor: UIColor = .black
}

class ViewController: UIViewController {
	
	let inputLabel: UILabel = {
		let v = UILabel()
		v.textColor = .white
		v.textAlignment = .right
		v.text = "0"
		v.font = UIFont.systemFont(ofSize: 28.0)
		v.translatesAutoresizingMaskIntoConstraints = false
		v.setContentHuggingPriority(.required, for: .vertical)
		v.setContentCompressionResistancePriority(.required, for: .vertical)
		return v
	}()
	
	var normAttributes: [NSAttributedString.Key: Any] = [:]
	var highAttributes: [NSAttributedString.Key: Any] = [:]
	
	let colorA: UIColor = UIColor(red: 254.0 / 255.0, green:  76.0 / 255.0, blue: 144.0 / 255.0, alpha: 1.0)
	let colorB: UIColor = UIColor(red: 201.0 / 255.0, green:  60.0 / 255.0, blue: 114.0 / 255.0, alpha: 1.0)
	let colorC: UIColor = UIColor(red: 196.0 / 255.0, green:  31.0 / 255.0, blue:  58.0 / 255.0, alpha: 1.0)
	let colorD: UIColor = UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
	
	let fColorA: UIColor = UIColor(red:  53.0 / 255.0, green:  15.0 / 255.0, blue:  30.0 / 255.0, alpha: 1.0)
	let fColorD: UIColor = UIColor(red: 197.0 / 255.0, green:  36.0 / 255.0, blue:  61.0 / 255.0, alpha: 1.0)
	
	var padButtons: [CalcButton] = [CalcButton]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = UIColor(red: 54.0 / 255.0, green: 15.0 / 255.0, blue: 30.0 / 255.0, alpha: 1.0)
		
		padButtons = [
			CalcButton(normalTitle: "←",  selectedTitle: "", foreColor: fColorA, backColor: colorA),
			CalcButton(normalTitle: "→",  selectedTitle: "", foreColor: fColorA, backColor: colorA),
			CalcButton(normalTitle: "(",  selectedTitle: "", foreColor: fColorA, backColor: colorA),
			CalcButton(normalTitle: "()", selectedTitle: "", foreColor: fColorA, backColor: colorA),
			CalcButton(normalTitle: ")",  selectedTitle: "", foreColor: fColorA, backColor: colorA),
			
			CalcButton(normalTitle: "7",  selectedTitle: "", foreColor: .white, backColor: colorB),
			CalcButton(normalTitle: "8",  selectedTitle: "", foreColor: .white, backColor: colorB),
			CalcButton(normalTitle: "9",  selectedTitle: "", foreColor: .white, backColor: colorB),
			CalcButton(normalTitle: "÷",  selectedTitle: "", foreColor: .white, backColor: colorC),
			CalcButton(normalTitle: "AC", selectedTitle: "", foreColor: fColorD, backColor: colorD),
			
			CalcButton(normalTitle: "4",  selectedTitle: "", foreColor: .white, backColor: colorB),
			CalcButton(normalTitle: "5",  selectedTitle: "", foreColor: .white, backColor: colorB),
			CalcButton(normalTitle: "6",  selectedTitle: "", foreColor: .white, backColor: colorB),
			CalcButton(normalTitle: "x",  selectedTitle: "", foreColor: .white, backColor: colorC),
			CalcButton(normalTitle: "⌫",  selectedTitle: "⌦", foreColor: fColorD, backColor: colorD),
			
			CalcButton(normalTitle: "1",  selectedTitle: "", foreColor: .white, backColor: colorB),
			CalcButton(normalTitle: "2",  selectedTitle: "", foreColor: .white, backColor: colorB),
			CalcButton(normalTitle: "3",  selectedTitle: "", foreColor: .white, backColor: colorB),
			CalcButton(normalTitle: "-",  selectedTitle: "", foreColor: .white, backColor: colorC),
			CalcButton(normalTitle: "↖︎↘︎", selectedTitle: "", foreColor: fColorD, backColor: colorD),
			
			CalcButton(normalTitle: "0",  selectedTitle: "", foreColor: .white, backColor: colorB),
			CalcButton(normalTitle: ".",  selectedTitle: "", foreColor: .white, backColor: colorB),
			CalcButton(normalTitle: "π",  selectedTitle: "", foreColor: .white, backColor: colorB),
			CalcButton(normalTitle: "+",  selectedTitle: "", foreColor: .white, backColor: colorC),
			CalcButton(normalTitle: "✓",  selectedTitle: "", foreColor: fColorD, backColor: colorD),
		]
		
		let svRows = UIStackView()
		svRows.axis = .vertical
		svRows.alignment = .fill
		svRows.distribution = .fillEqually
		svRows.spacing = 8
		svRows.translatesAutoresizingMaskIntoConstraints = false
		
		let font = UIFont.systemFont(ofSize: 28.0)
		
		var idx = 0
		
		for _ in 1...5 {
			
			let svRow = UIStackView()
			svRow.axis = .horizontal
			svRow.alignment = .fill
			svRow.distribution = .fillEqually
			svRow.spacing = 8
			svRow.translatesAutoresizingMaskIntoConstraints = false
			
			for _ in 1...5 {
				
				let cb: CalcButton = padButtons[idx]
				
				let btn = RoundButton()
				btn.backgroundColor = cb.backColor
				
				normAttributes = [
					.foregroundColor : cb.foreColor,
					.underlineStyle: 0,
					.font : font,
				]
				
				highAttributes = [
					.foregroundColor : UIColor.lightGray,
					.underlineStyle: 0,
					.font : font,
				]
				
				let attNorm = NSAttributedString(string: cb.normalTitle, attributes: normAttributes)
				let attHigh = NSAttributedString(string: cb.normalTitle, attributes: highAttributes)
				
				btn.setAttributedTitle(attNorm, for: .normal)
				btn.setAttributedTitle(attHigh, for: .highlighted)
				
				if cb.selectedTitle != "" {
					let attSel = NSAttributedString(string: cb.selectedTitle, attributes: normAttributes)
					btn.setAttributedTitle(attSel, for: .selected)
				}
				
				btn.heightAnchor.constraint(equalTo: btn.widthAnchor).isActive = true
				
				btn.addTarget(self, action: #selector(btnTapped(_:)), for: .touchUpInside)
				
				svRow.addArrangedSubview(btn)
				
				idx += 1
			}
			
			svRows.addArrangedSubview(svRow)
			
		}
		
		view.addSubview(inputLabel)
		view.addSubview(svRows)
		
		let g = view.safeAreaLayoutGuide
		
		let cLeading = svRows.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 8.0)
		cLeading.priority = .defaultHigh
		
		NSLayoutConstraint.activate([
			
			inputLabel.topAnchor.constraint(greaterThanOrEqualTo: g.topAnchor, constant: 16.0),
			inputLabel.leadingAnchor.constraint(equalTo: g.leadingAnchor, constant: 16.0),
			inputLabel.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -8.0),
			
			cLeading,
			
			svRows.trailingAnchor.constraint(equalTo: g.trailingAnchor, constant: -8.0),
			svRows.bottomAnchor.constraint(equalTo: g.bottomAnchor, constant: -8.0),
			
			svRows.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: 16.0),
			
		])
		
		// just so we can see the frame of the inputLabel
		inputLabel.backgroundColor = .gray
		
	}
	
	@objc func btnTapped(_ sender: Any?) -> Void {
		
		guard let btn = sender as? UIButton, let t = btn.currentAttributedTitle?.string, let curText = inputLabel.text else {
			return
		}
		
		if t == "⌫" || t == "⌦" {
			btn.isSelected = !btn.isSelected
		} else {
			inputLabel.text = curText + t
		}
		
	}
	
}

