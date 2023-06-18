///  Settings.swift
///  MuVis
///
///  This class contains variables that the app's user gets to adjust - using the buttons and sliders provided in the user interface within the ContentView struct.
///  It also contans constants and variables that the app's developer has selected for optimum performance.
///
///  Created by Keith Bromley on 16 Feb 20/21.


import Foundation
import SwiftUI


class Settings: ObservableObject {

    static let settings = Settings()  // This singleton instantiates the Settings class

    let optionCount: Int = 4
    @Published var option: Int = 0              // allows user to view variations on each visualization
                                                // Changed in ContentView; Published to all visualizations
    
    
    // Performance Monitoring:					// allows developer to observe graphics timing of each visualization
    var date = NSDate()
    var timePassed: Double = 0.0
    var displayedTimePassed: Double = 0.0
    var counter: Int = 0     // simple counter   0 <= counter < 5

    func monitorPerformance() -> (Int) {
        // Find the elapsed time since the last timer reset:
        let timePassed: Double = -date.timeIntervalSinceNow
        // print( lround( 1000.0 * timePassed ) )  // Gives frame-by-frame timing for debugging.
        // the variable "counter" counts from 0 to 9 continuously (incrementing by one each frame):
        counter = (counter < 9) ? counter + 1 : 0
        // Every tenth frame, update the "displayedTimePassed" and render it on the screen:
        if (counter == 9) {displayedTimePassed = timePassed}
        let mspFrame: Int = lround( 1000.0 * displayedTimePassed )
        date = NSDate() // Reset the timer to the current time.  <- Done just before end of visualization rendering.
        return mspFrame
    }  // end of monitorPerformance() func

}  // end of Settings class
