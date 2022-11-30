    //
    //  AppDefault.swift
    //  AegisRider-iOS
    //
    //  Created by Abdul Suraj on 14/12/2021.
    //

import Foundation
import UIKit
import CoreBluetooth
class AppDefaults: NSObject {
        // MARK: - Shared instance
    static let shared = AppDefaults()
    
        // MARK: - Shared Variables
    var currentUser = NewGeneralProfile()
    
        // APP Delegate
    let userDefault = UserDefaults.standard
    func saveToken(token: String) {
        userDefault.set(token, forKey: Utilities.Defaults.accessToken)
        saveContext()
    }
    
    func isAppleGoogleLogin(_ isLogin: Bool) {
        userDefault.setValue(isLogin, forKey: Utilities.Defaults.applegoogleeLogin)
    }
    func isAppleLogin(_ isLogin: Bool) {
        userDefault.setValue(isLogin, forKey: Utilities.Defaults.appleLogin)
    }
    func isGoogleLogin(_ isLogin: Bool) {
        userDefault.setValue(isLogin, forKey: Utilities.Defaults.googleLogin)
    }
    func saveEmail(email: String) {
        userDefault.set(email, forKey: Utilities.Defaults.userEmail)
        saveContext()
    }
    func savePassword(token: String) {
        userDefault.set(token, forKey: Utilities.Defaults.userPassword)
        saveContext()
    }
    func saveDate(userDate: Date) {
        userDefault.set(userDate, forKey: Utilities.Defaults.userDate)
        saveContext()
    }
    func saveFullName(fullName: String) {
        userDefault.set(fullName, forKey: Utilities.Defaults.fullName)
        saveContext()
    }
    func saveHeight(height: String) {
        userDefault.set(height, forKey: Utilities.Defaults.height)
        saveContext()
    }
    func saveHeightUnit(heightUnit: String) {
        userDefault.set(heightUnit, forKey: Utilities.Defaults.heightUnit)
        saveContext()
    }
    func saveWeight(weight: String) {
        userDefault.set(weight, forKey: Utilities.Defaults.weight)
        saveContext()
    }
    func saveWeightUnit(weightUnit: String) {
        userDefault.set(weightUnit, forKey: Utilities.Defaults.weightUnit)
        saveContext()
    }
    func saveBike(bike: String) {
        userDefault.set(bike, forKey: Utilities.Defaults.bike)
        saveContext()
    }
    func savePhone(phone: String) {
        userDefault.set(phone, forKey: Utilities.Defaults.phone)
        saveContext()
    }
    func saveMobile(mobile: String) {
        userDefault.set(mobile, forKey: Utilities.Defaults.mobile)
        saveContext()
    }
    func saveOhterEmail(otherEmail: String) {
        userDefault.set(otherEmail, forKey: Utilities.Defaults.otherEmail)
        saveContext()
    }
    func saveAddress(address: String) {
        userDefault.set(address, forKey: Utilities.Defaults.address)
        saveContext()
    }
    func savePostalCode(postalCode: String) {
        userDefault.set(postalCode, forKey: Utilities.Defaults.postalCode)
        saveContext()
    }
    func saveCity(city: String) {
        userDefault.set(city, forKey: Utilities.Defaults.city)
        saveContext()
    }
    func saveCountry(country: String) {
        userDefault.set(country, forKey: Utilities.Defaults.country)
        saveContext()
    }
    func savefacebook(facebook: String) {
        userDefault.set(facebook, forKey: Utilities.Defaults.facebook)
        saveContext()
    }
    func saveInstagram(instagram: String) {
        userDefault.set(instagram, forKey: Utilities.Defaults.instagram)
        saveContext()
    }
    func saveTwitter(twitter: String) {
        userDefault.set(twitter, forKey: Utilities.Defaults.twitter)
        saveContext()
    }
    func savewhatsApp(whatsapp: String) {
        userDefault.set(whatsapp, forKey: Utilities.Defaults.whatsapp)
        saveContext()
    }
    func saveProfileImageUrl(url: String) {
        userDefault.set(url, forKey: Utilities.Defaults.profileImage)
        saveContext()
    }
    func saveCoverImageUrl(url: String) {
        userDefault.set(url, forKey: Utilities.Defaults.coverImage)
        saveContext()
    }
    func saveUserKey(userKey: String) {
        print(userKey)
        userDefault.set(userKey, forKey: Utilities.Defaults.userId)
        print("key saved")
        saveContext()
    }
    func getUserEmail() -> String {
        return userDefault.value(forKey: Utilities.Defaults.userEmail) as? String ?? ""
    }
    func getUserKey() -> String {
        return userDefault.value(forKey: Utilities.Defaults.userId) as? String ?? ""
    }
    func setUserLogin(_ isLogin: Bool = false) {
        userDefault.setValue(isLogin, forKey: Utilities.Defaults.isLoggedIn)
    }
    func setProfileUpdated(_ isProfileUpdated: Bool = false) {
        userDefault.setValue(isProfileUpdated, forKey: Utilities.Defaults.isProfileUpdated)
            //  isProfileUpdated
    }
    func unverifiedUser(_ unverified: Bool = false) {
        userDefault.setValue(unverified, forKey: Utilities.Defaults.unverifiedUser)
    }
    //Bluetooth connection state
    func setConnState(_ isConnected: Bool = false) {
        userDefault.setValue(isConnected, forKey: Utilities.Defaults.connState)
    }
    func getConnState() -> Bool {
        return userDefault.value(forKey: Utilities.Defaults.connState) as? Bool ?? false
    }
    func getToken() -> String {
        return userDefault.value(forKey: Utilities.Defaults.accessToken) as? String ?? ""
    }
   
    func getUserLogin() -> Bool {
        return userDefault.value(forKey: Utilities.Defaults.isLoggedIn) as? Bool ?? false
    }
    func getAppleGoogleLogin() -> Bool {
        return userDefault.value(forKey: Utilities.Defaults.applegoogleeLogin) as? Bool ?? false
    }
    func getAppleLogin() -> Bool {
        return userDefault.value(forKey: Utilities.Defaults.appleLogin) as? Bool ?? false
    }
    func getGoogleLogin() -> Bool {
        return userDefault.value(forKey: Utilities.Defaults.googleLogin) as? Bool ?? false
    }
    func getRefreshToken() -> String {
        return userDefault.value(forKey: Utilities.Defaults.refreshToken) as? String ?? ""
    }
    func saveRefreshToken(token: String) {
        userDefault.set(token, forKey: Utilities.Defaults.refreshToken)
        saveContext()
    }
    
    func setAppMode(_ theme: AppMode) {
        userDefault.setValue(theme == .Light ? "light" : "dark", forKey: Utilities.Defaults.appMode)
    }
    
    func getAppMode() -> AppMode {
        let theme = userDefault.value(forKey: Utilities.Defaults.appMode) as? String ?? ""
        return theme == "light" ? .Light : .Dark  
    }
    
    func deleteUserData() {
        userDefault.set(nil, forKey: Utilities.Defaults.accessToken)
        userDefault.set(nil, forKey: Utilities.Defaults.refreshToken)
        userDefault.set(nil, forKey: Utilities.Defaults.userData)
        userDefault.set(false, forKey: Utilities.Defaults.isLoggedIn)
        userDefault.set(false, forKey: Utilities.Defaults.appleLogin)
        userDefault.set(false, forKey: Utilities.Defaults.googleLogin)
        userDefault.set("", forKey: Utilities.Defaults.profileImage)
        userDefault.set("", forKey: Utilities.Defaults.coverImage)
        userDefault.set("", forKey: Utilities.Defaults.userId)
        saveContext()
    }
    private func saveContext() {
        userDefault.synchronize()
    }
    func saveUserProfile(userKey: String) {
        print(userKey)
        userDefault.set(String(userKey), forKey: Utilities.Defaults.userId)
        print("key saved")
        saveContext()
    }
    
    func cacheProfileImage (image: UIImage) {
        userDefault.set(image, forKey: Utilities.Defaults.localProfilemage)
    }
    
    func saveConnectedPeripheral (peripheralIdentifier: String) {
        print("peripheral....", peripheralIdentifier)
        userDefault.set(peripheralIdentifier, forKey: "connectedPeripheral")
    }
    func getConnectedPeripheral () -> String {
        return userDefault.string(forKey: "connectedPeripheral") ?? ""
    }
}
