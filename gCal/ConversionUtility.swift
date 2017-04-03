//
//  ConversionUtility.swift
//  gCal
//
//  Created by Gaurav Pathak on 4/2/17.
//  Copyright © 2017 gpmax. All rights reserved.
//

import Foundation

class ConversionUtility {
    
    static var catList: [[String]] = [["Area"],["Square KM","Square Meter","Square Mile","Square Yard","Square Foot","Square Inch","Hectare","Acre"],["Data Transfer Rate"],["Bit per second","Kilobit per second","Kilobyte per second","Kibibit per second","Megabit per second","Megabyte per second","Mebibit per second","Gigabit per second","Gigabyte per second","Gibibit per second","Terabit per second","Terabyte per second","Tebibit per second"],["Digital Storage"],["Bit","Kilobit","Kibibit","Megabit","Mebibit","Gigabit","Gibibit","Terabit","Tebibit","Petabit","Pebibit","Byte","Kilobyte","Kibibyte","Megabyte","Mebibyte","Gigabyte","Gibibyte","Terabyte","Tebibyte","Petabyte","Pebibyte"],["Energy"],["Joule","Kilojoule","Gram calorie","Kilocalorie","Watt hour","Kilowatt hour","Electronvolt","British thermal unit","US therm","Foot-pound"],["Frequency"],["Hertz","Kilohertz","Megahertz","Gigahertz"],["Fuel Echonomy"],["US Miles per gallon","Miles per gallon (Imperial)","Kilometer per liter","Liter per 100 kilometers"],["Length"],["Kilometer","Meter","Centimeter","Millimeter","Micrometer","Nanometer","Mile","Yard","Foot","Inch","Nautical mile"],["Mass"],["Metric ton","Kilogram","Gram","Milligram","Microgram","Imperial ton","US ton","Stone","Pound","Ounce"],["Plane Angle"],["Degree","Gradian","Milliradian","Minute of arc","Radian","Second of arc"],["Pressure"],["Atmosphere","Bar","Pascal","Pound-force per square inch","Torr"],["Speed"],["Miles per hour","Foot per second","Meter per second","Kilometer per hour","Knot"],["Temparature"],["Celsius","Fahrenheit","Kelvin"],["Time"],["Nanosecond","Microsecond","Millisecond","Second","Minute","Hour","Day","Week","Month","Year","Decade","Century"],["Volume"],["US liquid gallon","US liquid quart","US liquid pint","US legal cup","US fluid ounce","US tablespoon","US teaspoon","Cubic meter","Liter","Milliliter","Imperial gallon","Imperial quart","Imperial pint","Imperial cup","Imperial fluid ounce","Imperial tablespoon","Imperial teaspoon","Cubic foot","Cubic inch"]]
    
    // var fromUnit: Measurement<Unit>
    
    static let sharedInstance = ConversionUtility()
    
    
    static func getSubUnit(category: String, keyword: String) -> Unit {
        
        var subUnit: Unit = Unit.init()
        
        switch category {
            
        case catList[0][0]:
            
            switch keyword {
                
            case catList[1][0] :
                subUnit =  UnitArea.squareKilometers
                break;
                
            case catList[1][1] :
                subUnit = UnitArea.squareMeters
                break;
                
            case catList[1][2] :
                subUnit = UnitArea.squareMiles
                break;
                
            case catList[1][3] :
                subUnit = UnitArea.squareYards
                break;
                
            case catList[1][4] :
                subUnit = UnitArea.squareFeet
                break;
                
            case catList[1][5] :
                subUnit = UnitArea.squareInches
                break;
                
            case catList[1][6] :
                subUnit = UnitArea.hectares
                break;
                
            case catList[1][7] :
                subUnit = UnitArea.acres
                break;
                
            default :
                subUnit = UnitArea.squareKilometers
                break
                
            }
            
            break
            
        case catList[6][0]:
            
            switch keyword {
                
            case catList[7][0] :
                subUnit =  UnitEnergy.joules
                break;
                
            case catList[7][1] :
                subUnit = UnitEnergy.kilojoules
                break;
                
            case catList[7][2] :
                subUnit = UnitEnergy.calories
                break;
                
            case catList[7][3] :
                subUnit = UnitEnergy.kilocalories
                break;
                
            case catList[7][4] :
                subUnit = UnitEnergy.kilowattHours
                break;
                
            case catList[7][5] :
                subUnit = UnitEnergy.kilowattHours
                break;
                
            case catList[7][6] :
                subUnit = UnitEnergy.kilowattHours
                break;
                
            case catList[7][7] :
                subUnit = UnitEnergy.kilowattHours
                break;
                
            case catList[7][8] :
                subUnit = UnitEnergy.kilowattHours
                break;
                
            case catList[7][9] :
                subUnit = UnitEnergy.kilowattHours
                break;
                
            default :
                subUnit = UnitEnergy.kilowattHours
                break
                
            }
            
            break
            
        case catList[8][0]:
            
            switch keyword {
                
            case catList[9][0] :
                subUnit =  UnitFrequency.hertz
                break;
                
            case catList[9][1] :
                subUnit = UnitFrequency.kilohertz
                break;
                
            case catList[9][2] :
                subUnit = UnitFrequency.megahertz
                break;
                
            case catList[9][3] :
                subUnit = UnitFrequency.gigahertz
                break;
                
            default :
                subUnit = UnitFrequency.hertz
                break
                
            }
            
            break
            
        case catList[10][0]:
            
            switch keyword {
                
            case catList[11][0] :
                subUnit =  UnitFuelEfficiency.milesPerGallon
                break;
                
            case catList[11][1] :
                subUnit = UnitFuelEfficiency.milesPerImperialGallon
                break;
                
            case catList[11][2] :
                subUnit = UnitFuelEfficiency.litersPer100Kilometers
                break;
                
            case catList[11][3] :
                subUnit = UnitFuelEfficiency.litersPer100Kilometers
                break;
                
            default :
                subUnit = UnitFuelEfficiency.milesPerGallon
                break
                
            }
            
            break


        case catList[12][0]:
            
            switch keyword {
                
            case catList[13][0] :
                subUnit =  UnitLength.kilometers
                break;
                
            case catList[13][1] :
                subUnit = UnitLength.meters
                break;
                
            case catList[13][2] :
                subUnit = UnitLength.centimeters
                break;
                
            case catList[13][3] :
                subUnit = UnitLength.millimeters
                break;
                
            case catList[13][4] :
                subUnit = UnitLength.micrometers
                break;
                
            case catList[13][5] :
                subUnit = UnitLength.nanometers
                break;
                
            case catList[13][6] :
                subUnit = UnitLength.miles
                break;
                
            case catList[13][7] :
                subUnit = UnitLength.yards
                break;
                
            case catList[13][8] :
                subUnit = UnitLength.feet
                break;
                
            case catList[13][9] :
                subUnit = UnitLength.inches
                break;
                
            case catList[13][10] :
                subUnit = UnitLength.nauticalMiles
                break;
                
            default :
                subUnit = UnitLength.kilometers
                break
                
            }
            
            break
            
        case catList[14][0]:
            
            switch keyword {
                
            case catList[15][0] :
                subUnit =  UnitMass.metricTons
                break;
                
            case catList[15][1] :
                subUnit = UnitMass.kilograms
                break;
                
            case catList[15][2] :
                subUnit = UnitMass.grams
                break;
                
            case catList[15][3] :
                subUnit = UnitMass.milligrams
                break;
                
            case catList[15][4] :
                subUnit = UnitMass.micrograms
                break;
                
            case catList[15][5] :
                subUnit = UnitMass.metricTons
                break;
                
            case catList[15][6] :
                subUnit = UnitMass.metricTons
                break;
                
            case catList[15][7] :
                subUnit = UnitMass.stones
                break;
                
            case catList[15][8] :
                subUnit = UnitMass.pounds
                break;
                
            case catList[15][9] :
                subUnit = UnitMass.ounces
                break;

            default :
                subUnit = UnitMass.metricTons
                break
                
            }
            
        case catList[16][0]:
            
            switch keyword {
                
            case catList[17][0] :
                subUnit =  UnitAngle.degrees
                break;
                
            case catList[17][1] :
                subUnit = UnitAngle.gradians
                break;
                
            case catList[17][2] :
                subUnit = UnitAngle.radians
                break;
                
            case catList[17][3] :
                subUnit = UnitAngle.arcMinutes
                break;
                
            case catList[17][4] :
                subUnit = UnitAngle.radians
                break;
                
            case catList[17][5] :
                subUnit = UnitAngle.arcSeconds
                break;
                
            default :
                subUnit = UnitAngle.degrees
                break
                
            }
            
        case catList[18][0]:
            
            switch keyword {
                
            case catList[19][0] :
                subUnit =  UnitPressure.bars
                break;
                
            case catList[19][1] :
                subUnit = UnitPressure.bars
                break;
                
            case catList[19][2] :
                subUnit = UnitPressure.kilopascals
                break;
                
            case catList[19][3] :
                subUnit = UnitPressure.poundsForcePerSquareInch
                break;
                
            case catList[19][4] :
                subUnit = UnitPressure.gigapascals
                break;
                
            default :
                subUnit = UnitAngle.degrees
                break
                
            }
            
        case catList[20][0]:
            
            switch keyword {
                
            case catList[21][0] :
                subUnit =  UnitSpeed.milesPerHour
                break;
                
            case catList[21][1] :
                subUnit = UnitSpeed.knots
                break;
                
            case catList[21][2] :
                subUnit = UnitSpeed.metersPerSecond
                break;
                
            case catList[21][3] :
                subUnit = UnitSpeed.kilometersPerHour
                break;
                
            case catList[21][4] :
                subUnit = UnitSpeed.knots
                break;
                
            default :
                subUnit = UnitSpeed.milesPerHour
                break
                
            }
            
        case catList[22][0]:
            
            switch keyword {
                
            case catList[23][0] :
                subUnit =  UnitTemperature.celsius
                break;
                
            case catList[23][1] :
                subUnit = UnitTemperature.fahrenheit
                break;
                
            case catList[23][2] :
                subUnit = UnitTemperature.kelvin
                break;
        
            default :
                subUnit = UnitTemperature.celsius
                break
                
            }
            
        case catList[24][0]:
            
            switch keyword {
                
            case catList[25][0] :
                subUnit =  UnitDuration.hours
                break;
                
            case catList[25][1] :
                subUnit = UnitDuration.minutes
                break;
                
            case catList[25][2] :
                subUnit = UnitDuration.seconds
                break;
                
            default :
                subUnit = UnitDuration.hours
                break
                
            }
            
        case catList[26][0]:
            
            switch keyword {
                
            case catList[27][0] :
                subUnit =  UnitVolume.cubicInches
                break;
                
            case catList[27][1] :
                subUnit = UnitVolume.cubicInches

                break;
                
            case catList[27][2] :
                subUnit = UnitVolume.cubicInches

                break;
                
            default :
                subUnit = UnitVolume.cubicInches

                break
                
            }

          
        default : break
            
        }
        
        return subUnit
    }
    
    static func convert(category: String, from: Unit, to: Unit, value: Double) -> String {
        
        var convertedUnit = "None"
        
        switch category {
            
        case catList[0][0]:
            
            let currentUnit: Measurement<UnitArea> = Measurement(value: value, unit: from as! UnitArea)
            
            convertedUnit = String(describing: currentUnit.converted(to: to as! UnitArea))
            
            break
            
        case catList[2][0]:
            
            let currentUnit: Measurement<UnitArea> = Measurement(value: value, unit: from as! UnitArea)
            
            convertedUnit = String(describing: currentUnit.converted(to: to as! UnitArea))
            
            break
            
        case catList[4][0]:
            
            let currentUnit: Measurement<UnitArea> = Measurement(value: value, unit: from as! UnitArea)
            
            convertedUnit = String(describing: currentUnit.converted(to: to as! UnitArea))
            
            break
            
        case catList[6][0]:
            
            let currentUnit: Measurement<UnitEnergy> = Measurement(value: value, unit: from as! UnitEnergy)
            
            convertedUnit = String(describing: currentUnit.converted(to: to as! UnitEnergy))
            
            break
            
        case catList[8][0]:
            
            let currentUnit: Measurement<UnitFrequency> = Measurement(value: value, unit: from as! UnitFrequency)
            
            convertedUnit = String(describing: currentUnit.converted(to: to as! UnitFrequency))
            
            break
            
        case catList[10][0]:
            
            let currentUnit: Measurement<UnitFuelEfficiency> = Measurement(value: value, unit: from as! UnitFuelEfficiency)
            
            convertedUnit = String(describing: currentUnit.converted(to: to as! UnitFuelEfficiency))
            
            break
            
        case catList[12][0]:
            
            let currentUnit: Measurement<UnitLength> = Measurement(value: value, unit: from as! UnitLength)
            
            convertedUnit = String(describing: currentUnit.converted(to: to as! UnitLength))
            
            break
            
        case catList[14][0]:
            
            let currentUnit: Measurement<UnitMass> = Measurement(value: value, unit: from as! UnitMass)
            
            convertedUnit = String(describing: currentUnit.converted(to: to as! UnitMass))
            
            break
            
        case catList[16][0]:
            
            let currentUnit: Measurement<UnitAngle> = Measurement(value: value, unit: from as! UnitAngle)
            
            convertedUnit = String(describing: currentUnit.converted(to: to as! UnitAngle))
            
            break
            
        case catList[18][0]:
            
            let currentUnit: Measurement<UnitPressure> = Measurement(value: value, unit: from as! UnitPressure)
            
            convertedUnit = String(describing: currentUnit.converted(to: to as! UnitPressure))
            
            break
            
        case catList[20][0]:
            
            let currentUnit: Measurement<UnitSpeed> = Measurement(value: value, unit: from as! UnitSpeed)
            
            convertedUnit = String(describing: currentUnit.converted(to: to as! UnitSpeed))
            
            break
            
        case catList[22][0]:
            
            let currentUnit: Measurement<UnitTemperature> = Measurement(value: value, unit: from as! UnitTemperature)
            
            convertedUnit = String(describing: currentUnit.converted(to: to as! UnitTemperature))
            
            break
            
        case catList[24][0]:
            
            let currentUnit: Measurement<UnitDuration> = Measurement(value: value, unit: from as! UnitDuration)
            
            convertedUnit = String(describing: currentUnit.converted(to: to as! UnitDuration))
            
            break
            
        case catList[26][0]:
            
            let currentUnit: Measurement<UnitVolume> = Measurement(value: value, unit: from as! UnitVolume)
            
            convertedUnit = String(describing: currentUnit.converted(to: to as! UnitVolume))
            
            break
            
        default : break
            
        }
        
        return convertedUnit
    }
    
}
