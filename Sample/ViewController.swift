/*
Created on: 12/26/2015

A very simple Swift application for personal use.  I have saved carb counts for my favorite foods; this app allows me to input things I have eaten today (with servings) and keeps a running count of how many carbs I have eaten.  If something is not on the list, I can input "custom" and directly input the number of grams.  There is also a "reset" button

Though simple, making this was a learning experience and a way for me to get exposed to the Swift language 

Possible extensions:

-Add more foods
-Clean up and functinoalize code
-(ideal) Give this application a customizable add-on list for whatever foods they want, so that it can be of value to other people
*/

import UIKit

class ViewController: UIViewController
{

    var totalCarbs = 0
    var newText = ""

    @IBOutlet weak var foodInput: UITextField!
    
    @IBOutlet weak var servingsInput: UITextField!
    
    @IBOutlet weak var resultToDisplay: UITextView!
    
    @IBAction func calcPressed(sender: AnyObject)
    {
        
        self.foodInput.resignFirstResponder()
        self.servingsInput.resignFirstResponder()
        let foodInputString = self.foodInput.text! as String
        var servingsInt:Int? = Int(servingsInput.text!)
        let stringServings = String(servingsInt!)
        
        if(foodInputString.isEmpty || self.foodInput == "nil")
        {
            servingsInt = 1 //TODO: rewrite error check
        }//if
        
        if(foodInputString.lowercaseString.containsString(("bread")))
        {
            resultToDisplay.text = "Recognized.  Added \(stringServings) slice(s) of Natural Own Whole Grain Bread to today's carb count."
            totalCarbs += 12 * servingsInt!
        }//if
        else if(foodInputString.lowercaseString.containsString(("kashi")))
        {
            resultToDisplay.text = "Recognized. Added \(stringServings) serving(s) Raisin Vineyard Kashi Cereal to the carb count, where a serving is 1/2 cup."
            totalCarbs += 26 * servingsInt!
        }//else if kashi
        else if(foodInputString.lowercaseString.containsString(("fiber one")))
            
        {
            resultToDisplay.text = "Recognized. Added \(stringServings) serving(s) original Fiber One to the carb count, where a serving is 1/2 cup."
            totalCarbs += 25 * servingsInt!
        }//else if fiber one
        else if(foodInputString.lowercaseString.containsString(("lowfat milk")))
        {
            resultToDisplay.text = "Recognized. Added \(stringServings) serving(s) 1% Crystal lowfat milk to the carb count, where a serving is 1/2 cup milk."
            totalCarbs += 8 * servingsInt!
        }//else if lowfat milk
        else if(foodInputString.lowercaseString.containsString(("quaker oatmeal")))
        {
            resultToDisplay.text = "Recognized. Added \(stringServings) serving(s) whole grain Quaker Oatmeal to the carb count, where a serving is 1/2 cup cooked oatmeal"
            totalCarbs += 27 * servingsInt!
        }//else if quaker
        else if(foodInputString.lowercaseString.containsString(("small apple")))
        {
            resultToDisplay.text = "Recognized. Added \(stringServings) extra small red apple(s) to the carb count."
            totalCarbs += 15 * servingsInt!
        }//else if small apple
        else if(foodInputString.lowercaseString.containsString(("medium apple")))
        {
            resultToDisplay.text = "Recognized. Added \(stringServings) medium red apple(s) to the carb count."
            totalCarbs += 20 * servingsInt!
        }//else if medium apple
        else if(foodInputString.lowercaseString.containsString(("large apple")))
        {
            resultToDisplay.text = "Recognized. Added \(stringServings) large-sized red apple(s) to the carb count."
            totalCarbs += 30 * servingsInt!
        }//else if large apple
        else if(foodInputString.lowercaseString.containsString(("banana")))
        {
            resultToDisplay.text = "Recognized. Added \(stringServings) medium-sized banana(s) to the carb count."
            totalCarbs += 27 * servingsInt!
        }
        else if(foodInputString.lowercaseString.containsString(("cutie")))
        {
            resultToDisplay.text = "Recognized. Added \(stringServings) cutie(s) to the carb count."
        }//else if cuties
        else if(foodInputString.lowercaseString.containsString(("coho salad")))
        {
            resultToDisplay.text = "Recognized. Added \(stringServings) Davis Coffee House Caesar Salad(s) to the carb count."
            totalCarbs += 9 * servingsInt!
        }//coho salad
            
        else if(foodInputString.lowercaseString.containsString(("brown rice")))
        {
            resultToDisplay.text = "Recognized. Added \(stringServings) serving(s) Robert's long grain brown rice to the carb count, where 1 serving is 1/2 cup rice after cooking."
            totalCarbs += 22 * servingsInt!
        }//brown rice
        else if(foodInputString.lowercaseString.containsString(("black beans")))
        {
            resultToDisplay.text = "Recognized. Added \(stringServings) serving(s) Trader Joe's canned black beans to the carb count, where 1 serving is 1/4 cup beans"
            totalCarbs += 10 * servingsInt!
        }//black beans
        else if(foodInputString.lowercaseString.containsString(("peanut butter")))
        {
            resultToDisplay.text = "Recognized. Added \(stringServings) tablespoon(s) Trader Joe's unsalted peanut butter to the carb count."
            totalCarbs += 4 * servingsInt!
        }//peanut butter
        else if(foodInputString.lowercaseString.containsString(("custom")))
        {
            resultToDisplay.text = "Custom Input.  Added \(stringServings) grams to today's carb count."
            totalCarbs += servingsInt!
        }//a custom result where you just input number of carbs
        
        else
        {
            resultToDisplay.text = "Not recognized. cannot add \(foodInputString) to calculation"
        }
        
        
        newText = "\n\nTotal carbs today: \(totalCarbs) g"
        resultToDisplay.text = resultToDisplay.text + newText
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        self.view.endEditing(true)
    }
    
    @IBAction func resetPressed(sender: UIButton)
    {
        resultToDisplay.text = "Carb count reset."
        totalCarbs = 0
        displayCarbResult()
    }
    
    func displayCarbResult()
    {
        newText = "\n\nTotal carbs today: \(totalCarbs)"
        resultToDisplay.text = resultToDisplay.text + newText
    }
    
    /*
    @IBOutlet weak var sliderIndicator: UILabel!
    
    @IBAction func sliderMoved(sender: UISlider) {
        
        let sliderValue = lroundf(sender.value) * 10
        sliderIndicator.text = "\(sliderValue)"
    }
    */
    
    
}

