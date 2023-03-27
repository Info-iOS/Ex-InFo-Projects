//
//  ViewController.swift
//  Calculator
//
//  Created by 박준하 on 2022/05/15.
//

import UIKit

class ViewController: UIViewController
{
    
    
    @IBOutlet var CalculatorWorking: UILabel!
    @IBOutlet var CalculatorResult: UILabel!
    
    var Workings : String = ""
    
    func ClearAll(){
        Workings = ""
        CalculatorWorking.text = ""
        CalculatorResult.text = ""
        
    }
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ClearAll()
    }
    
    @IBAction func epualsTap(_ sender: Any) {
        if(Workings == "***"){
            let alert2 = UIAlertController(title: "이스터에그를 찾았네요!", message: "참 잘했어요!", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert2, animated: true, completion: nil)
            
            let radius = 22
            let imageView = UIImageView(frame: CGRect(x: 5, y: 20, width: 50, height: 40))
            imageView.image = UIImage(named: "참 잘했어요")
            imageView.layer.cornerRadius = CGFloat(radius)
            alert2.view.addSubview(imageView)
        }
        else if(validInput())
        {
            let checkedWorkingsForPercent = Workings.replacingOccurrences(of: "%", with: "*0.01")
            let expression = NSExpression(format: checkedWorkingsForPercent)
            let result = expression.expressionValue(with: nil, context: nil) as! Double
            let resultString = formatResult(result: result)
            CalculatorWorking.text = resultString
        }
        else{
            let alert = UIAlertController(title: "In valid Input", message: "Calculator unable to do math based", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func validInput() -> Bool{
        var count = 0
        var funcCharIndexes = [Int]()
        
        for char in Workings{
            if(specialCharacter(char: char)){
                funcCharIndexes.append(count)
            }
            count += 1
        }
        
        var previous: Int = -1
        
        for index in funcCharIndexes{
            if(index == 0){
                return false
            }
            if(index == Workings.count - 1){
                return false
            }
            if (previous != -1){
                if(index - previous == 1){
                    return false
                }
            }
            previous = index
        }
        
        return true
    }
    
    func specialCharacter(char: Character) -> Bool{
        if(char == "*"){
            return true
        }
        if(char == "/"){
            return true
        }
        if(char == "+"){
            return true
        }
        return false
    }
    
    func formatResult(result: Double) -> String{
        if(result.truncatingRemainder(dividingBy: 1) == 0){
            return String(format: "%.0f", result)
        }
        else{
            return String(format: "%.2f", result)
        }
    }
    
    @IBAction func AllClearTap(_ sender: Any) {
        ClearAll()
    }
    @IBAction func BackTap(_ sender: Any) {
        if(!Workings.isEmpty){
            Workings.removeLast()
            CalculatorWorking.text = Workings
        }
    }
    func AddToWorkings(value  : String)
    {
        Workings = Workings + value
        CalculatorWorking.text = Workings
    }
    @IBAction func PersentTap(_ sender: Any) {
        AddToWorkings(value: "%")
    }
    @IBAction func DivideTap(_ sender: Any) {
        AddToWorkings(value: "/")
        
    }
    @IBAction func TimesTap(_ sender: Any) {
        AddToWorkings(value: "*")
    }
    @IBAction func MinusTap(_ sender: Any) {
        AddToWorkings(value: "-")
    }
    @IBAction func PulsTap(_ sender: Any) {
        AddToWorkings(value: "+")
    }
    
    @IBAction func ColonTap(_ sender: Any) {
        AddToWorkings(value: ".")
    }
    @IBAction func ZeroTap(_ sender: Any) {
        AddToWorkings(value: "0")
    }
    @IBAction func OneTap(_ sender: Any) {
        AddToWorkings(value: "1")
    }
    @IBAction func TwoTap(_ sender: Any) {
        AddToWorkings(value: "2")
    }
    @IBAction func ThreeTap(_ sender: Any) {
        AddToWorkings(value: "3")
    }
    @IBAction func FourTap(_ sender: Any) {
        AddToWorkings(value: "4")
    }
    @IBAction func FiveTap(_ sender: Any) {
        AddToWorkings(value: "5")
    }
    @IBAction func SixTap(_ sender: Any) {
        AddToWorkings(value: "6")
    }
    @IBAction func SevenTap(_ sender: Any) {
        AddToWorkings(value: "7")
    }
    @IBAction func EightTap(_ sender: Any) {
        AddToWorkings(value: "8")
    }
    @IBAction func NineTap(_ sender: Any) {
        AddToWorkings(value: "9")
    }
    
    
}

