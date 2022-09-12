//
//  JokeSelection.swift
//  LotsOfUrlSessions
//
//  Created by Adrian Iraizos Mendoza on 8/9/22.
//

import Foundation

final class JokeSelection {
    
    var url = "https://v2.jokeapi.dev/joke/Any?type=single"
    let urlCategoryComponent = ""
    let language: Language? = nil
    let blacklist: Flags? = nil
    
    enum Categories {
        //https://v2.jokeapi.dev/joke/Any?type=single
        //https://v2.jokeapi.dev/joke/Programming,Miscellaneous,Dark,Spooky,Christmas?type=single
        
        case Programming, Miscellaneous, Dark, Pun, Spooky, Christmas
    }
    
    enum Language {
        case cs, de, en, es, fr, pt
    }
    
    enum Flags {
        case nsfw, religious, political, racist,sexist, explicit
    }
    enum jokeType {
        case single, twoPart
    }
    
    var programmingIsOn = true
    var miscellaneousIsOn = true
    var darkIsOn = true
    var punIsOn = true
    var spookyIsOn = true
    var christmasIsOn = true
    
    var nsfwIsOn = true
    var religiousIsOn = true
    var politicalIsOn = true
    var racistIsOn = true
    var sexistIsOn = true
    var explicitIsOn = true
    
    var parts = 0
    
    
    func createCategoryUrlComponentWith() -> String {
        var urlArray: [String] = []
        var url = ""
        let activeCategories = [programmingIsOn,miscellaneousIsOn,darkIsOn,punIsOn,spookyIsOn,christmasIsOn]
        print("Categories: \(activeCategories)")
        
        let areAllTrue = activeCategories.allSatisfy { $0 == true }
        let areAllFalse = activeCategories.allSatisfy { $0 == false }
        
        if areAllTrue || areAllFalse {
            url = "Any"
        } else {
            if programmingIsOn {urlArray.append("Programming")}
            if miscellaneousIsOn {urlArray.append("Miscellaneous")}
            if darkIsOn {urlArray.append("Dark")}
            if punIsOn {urlArray.append("Pun")}
            if spookyIsOn {urlArray.append("Spooky")}
            if christmasIsOn {urlArray.append("Christmas")}
            urlArray.forEach { category in
                url += "\(category),"
                
            }
            url.removeLast()
        }
        url += ""
        return url
    }
    
    func createFlagsUrlComponentWith() -> String {
        var urlArray: [String] = []
        var  url = "&blacklistFlags="
        let activeFlags = [nsfwIsOn,religiousIsOn,politicalIsOn,racistIsOn,sexistIsOn,explicitIsOn]
        print("Flags:\(activeFlags)")
        let areAllTrue = activeFlags.allSatisfy{$0 == true}
        let areAllFalse = activeFlags.allSatisfy{$0 == false}
        
        if areAllTrue || areAllFalse {
            url = ""
        } else {
            if nsfwIsOn {urlArray.append("nsfw")}
            if religiousIsOn {urlArray.append("religious")}
            if politicalIsOn {urlArray.append("political")}
            if racistIsOn {urlArray.append("racist")}
            if sexistIsOn {urlArray.append("sexist")}
            if explicitIsOn {urlArray.append("explicit")}
            
            urlArray.forEach { flag in
                url += "\(flag),"
            }
            url.removeLast()
        }
        return url
    }
    
    func createPartsUrlComponentWith() -> String {
        var url = "&type="
    
        switch parts {
        case 1: url += "single"
        case 2: url += "twopart"
        default:
            url = ""
        }
        
        return url
    }
    
    
    //MARK: Language
    //    case cs, de, en, es, fr, pt
    let languageList = ["es - Spanish", "de - German", "en - English", "cs - Czech","fr - French", "pt - Portuguese"]
    

    var languageSelection = "es - Spanish"
    
    func createLanguageUrlComponentWith() -> String {
        var url = "?lang="
        
        switch languageSelection {
            
        case "cs - Czech": url += "cs"
        case "de - German": url += "de"
            case "es - Spanish": url += "es"
        case "fr - French": url += "fr"
        case "pt - Portuguese": url += "pt"
        default:
            url = ""
        }
        return url
    }
    
    func createUrl() {
        url = "https://v2.jokeapi.dev/joke/"
        url += createCategoryUrlComponentWith()
        url += createLanguageUrlComponentWith()
        url += createFlagsUrlComponentWith()
        url += createPartsUrlComponentWith()
    }
    
}
