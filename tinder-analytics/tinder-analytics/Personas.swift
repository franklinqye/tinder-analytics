//
//  Personas.swift
//  tinder-analytics
//
//  Created by Franklin Ye on 11/30/18.
//  Copyright © 2018 Franklin Ye. All rights reserved.
//

func formatePersonality(mind: Int, energy: Int, nature: Int, tactics: Int, identity: Int)->PersonalityPackage {
    var one = ""
    var two = ""
    var three = ""
    var four = ""
    
    if mind > 1 {
        one = "E"
    } else {
        one = "I"
    }
    
    if energy > 1 {
        two = "N"
    } else {
        two = "S"
    }
    
    if nature > 1 {
        three = "F"
    } else {
        three = "T"
    }
    
    if tactics > 1 {
        four = "P"
    } else {
        four = "J"
    }
    
    let node = personalityTree[one]![two]![three]![four]!
    return PersonalityPackage(name: node["name"]!, accromyn: node["accromyn"]!, description: node["description"]!)
    
}



// fat tree of the different types of personalirites. make a text/bio output, a acromny versoin, and descriptions for each possible trait. Mind-Energy-Nature-Tactics
let personalityTree = [
    "I":["S":["T":["J":["name": "LOGISTICIAN",
                        "accromyn": "ISTJ",
                        "description": "Practical and fact-minded individuals, whose reliability cannot be doubted"],
                   "P":["name": "VIRTUOSO",
                        "accromyn": "ISTP",
                        "description": "Bold and practical experimenters, masters of all kinds of tools"]],
              "F":["J":["name": "DEFENDER",
                        "accromyn": "ISFJ",
                        "description": "Very dedicated and warm protectors, always ready to defend their loved ones"],
                   "P":["name": "ADVENTURER",
                        "accromyn": "ISFP",
                        "description": "Flexible and charming artists, always ready to explore and experience something new"]]],
         "N":["T":["J":["name": "ARCHITECT",
                        "accromyn": "INTJ",
                        "description": "Imaginative and strategic thinkers, with a plan for everything"],
                   "P":["name": "LOGICIAN",
                        "accromyn": "INTP",
                        "description": "Innovative inventors with an unquenchable thirst for knowledge"]],
              "F":["J":["name": "ADVOCATE",
                        "accromyn": "INFJ",
                        "description": "Quiet and mystical, yet very inspiring and tireless idealists"],
                   "P":["name": "MEDIATOR",
                        "accromyn": "INFP",
                        "description": "Poetic, kind and altruistic people, always eager to help a good cause"]]]],
    "E":["S":["T":["J":["name": "EXECUTIVE",
                        "accromyn": "ESTJ",
                        "description": "Excellent administrators, unsurpassed at managing things- or people"],
                   "P":["name": "ENTREPRENEUR",
                        "accromyn": "ESTP",
                        "description": "Smart, energetic and very preceptive people, who truly enjoy living on the edge"]],
              "F":["J":["name": "CONSUL",
                        "accromyn": "ESFJ",
                        "description": "Extraordinarily caring, social and popular people, always eager to help"],
                   "P":["name": "ENTERTAINER",
                        "accromyn": "ESFP",
                        "description": "Spontaneous, energetic and enthusiastic people- life is never boring around them"]]],
         "N":["T":["J":["name": "COMMANDER",
                        "accromyn": "ENTJ",
                        "description": "Bold, imaginative and strong-willed leaders, always finding a way- or making one"],
                   "P":["name": "DEBATER",
                        "accromyn": "ENTP",
                        "description": "Smart and curious thinkers who cannot resist an intellectual challenge"]],
              "F":["J":["name": "PROTAGONIST",
                        "accromyn": "ENFJ",
                        "description": "Charismatic and inspiring leaders, able to mesmerize their listeners"],
                   "P":["name": "CAMPAIGNER",
                        "accromyn": "ENFP",
                "description": "Enthusiastic, creative and sociable free spirits, who can always find a reason to smile"]]]]]
