//
//  100_Doors.swift
//  100_doors
//
//  Created by James Hall on 10/7/15.
//  Copyright (c) 2015 ImJamesHall. All rights reserved.
//

import Foundation



func OneHundredDoors() {
    var doors = [Bool](count: 100, repeatedValue: false)
    
    var i: Int
    for i = 1; i <= 100; ++i {
        for (index, element) in enumerate(doors) {
            if((index + 1) % i == 0){
                doors[index] = !doors[index]
                //                    print("Changing door \(index+1) for iteration \(i) \n")
            }
        }
    }
    
    for(index,element) in enumerate(doors){
        var status = doors[index] ? "Open": "Closed";
        print("Door #\(index+1) is \(status)\n")
    }

}



