//
//  PermissionHealthKitSetup.swift
//  HealthitPermissionDemand
//
//  Created by Bérenger on 08/01/2023.
//

import Foundation
import HealthKit

class PermissionHealthKitSetup{
    
    
    private enum permissionHealthKitError: Error{
        case deviceNotAvaliable
        case dataNotAvaliable
    }
    
    
    class func AuthorizeHealthKitSetup(completion: @escaping (Bool,Error?)-> Void){
        
        guard HKHealthStore.isHealthDataAvailable() else {
            completion(false,permissionHealthKitError.deviceNotAvaliable)
            return
        }
        
        guard let dateOfBirth = HKObjectType.characteristicType(forIdentifier: .dateOfBirth),
        let bloodType = HKObjectType.characteristicType(forIdentifier: .bloodType),
        let biologicalSex = HKObjectType.characteristicType(forIdentifier: .biologicalSex)
        else {
            completion(false,permissionHealthKitError.dataNotAvaliable)
            return
        }
        let hKHealthKitToReadDataType : Set<HKObjectType> = [dateOfBirth, bloodType, biologicalSex]
        HKHealthStore().requestAuthorization(toShare: nil, read: hKHealthKitToReadDataType) { success, error in
            completion(success,error)
        }
    }
    
}
