//
//  APIURLS.swift
//  AegisRider-iOS
//
//  Created by Abdul Suraj on 14/12/2021.
//

import Foundation

struct APIURLs {
    
    // Authenticate
    let checkUser = EndPoints(with: "check-user", .auth).requestedURL
    let login = EndPoints(with: "sign-in", .auth).requestedURL
    let appleLogin = EndPoints(with: "apple-login", .auth).requestedURL
    let googleLogin = EndPoints(with: "google-login", .auth).requestedURL
    let registration = EndPoints(with: "registration", .auth).requestedURL
    let resetPassword = EndPoints(with: "reset-password", .auth).requestedURL
    let verifyCode = EndPoints(with: "verify-reset-code", .auth).requestedURL
    let changePassword = EndPoints(with: "change-password", .auth).requestedURL
    let sendPasswordResetMail = EndPoints(with: "send-password-reset-mail", .auth).requestedURL
    let resendEmail = EndPoints(with: "resend-email", .auth).requestedURL
    // account
    let editProfile = EndPoints(with: "update-user-profile", .accounts).requestedURL
    let signedInUser = EndPoints(with: "profile", .accounts).requestedURL
    // media
    let imageFileUpload = EndPoints(with: "profile-image-upload", .accounts).requestedURL
    let coverImageUpload = EndPoints(with: "cover-image-upload", .accounts).requestedURL
    
    // statistics
    let startRide = EndPoints(with: "start-ride", .statistics).requestedURL
    let filterRides = EndPoints(with: "filter-stats", .statistics).requestedURL
    let startRideOffline = EndPoints(with: "start-ride-offline", .statistics).requestedURL

    // to upload CSV 👇🏽
    
    let uploadCSV = EndPoints(with: "upload-csv", .azureService).requestedURL
        // to upload Video(s) 👇🏽
    let uploadVideo = EndPoints(with:"upload-mobile-video", .azureService).requestedURL
        // to delete Video(s) 👇🏽
    let deleteVideo = EndPoints(with:"delete-ride-video", .azureService).requestedURL
        // to create summarized Video(s) 👇🏽
    let createSummarizedVideo = EndPoints(with:"create-summarized-video", .azureService).requestedURL
    let favouriteRide = EndPoints(with: "favourite-ride", .statistics).requestedURL
    let deleteRide = EndPoints(with: "delete-ride/", .statistics).requestedURL
    let allUserRides = EndPoints(with: "all-user-rides", .statistics).requestedURL
    let singleUserRide = EndPoints(with: "single-user-ride/", .statistics).requestedURL
    let saveUserDevice = EndPoints(with: "save-user-device/", .statistics).requestedURL
    let fetchPolyline = EndPoints(with: "ride-polyline/", .statistics).requestedURL
    let renameRide = EndPoints(with: "rename-ride", .statistics).requestedURL
    init() {}
}
