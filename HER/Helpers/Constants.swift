//
//  Constants.swift
//  HER
//
//  Created by Dustin yang on 3/22/21.
//



import SwiftUI
import Firebase
import FirebaseStorage


let screen = UIScreen.main.bounds
let APP_LOGO = ""
let APP_NAME = "HER"

public let SERIES_TITLE = "Score"


// Information
let APP_VERSION = "1.0.0"
let APP_INFO = "App information"
let APP_CREDIT = "credit"

let APP_PLATFORM = "platform"
let COMPANY = "Company"
let VERSION = "App version"
let MIN_REQUIREMENT = "iOS14"




let AGE = "Gender"
let COLOR_LIGHT_GRAY = Color(red: 0, green: 0, blue: 0, opacity: 0.15)
let APP_THEME_COLOR = Color("Color2")


let DEFAULT_LOCATION = "US"
let FILLOUT_INFO = "Please Fill Out The Form"


// Tabbar
public let index1 = "Company"
public let index3 = "favorite"
public let index2 = "Dashboard"
public let index4 = "Message"
public let TABBAR_FONT_SIZE = 13


public var BELL = "bell"
public var FONT = "JSDongkang-Regular"
public var FONT_BOLD = "JSDongkang-Bold"
public var FONT_COOKIE = "CookieRun Regular"



public let BUTTON_TITLE_FONT_SIZE = 18

//public var FONT = "CookieRun Regular"

public let VOTE_NUMBER = "numVote"
public let CHART_Y_AXIS = 100



public let CONFIRM =  "Ok"
public let CANCEL =  "Cancel"
public let ERROR =  "Error"
public let COMPLETE =  "Complete"
public let CONTINUE =  "Continue"
public let SEND_MESSAGE =  "Ping"


// Sign in and Sign up pages
let TEXT_NEED_AN_ACCOUNT = "Dont' have an account?"
let TEXT_SIGN_UP = "Sign Up"
let TEXT_SIGN_IN = "Log In"
let TEXT_EMAIL = "Email"
let TEXT_USERNAME = "Nick Name"
let TEXT_PASSWORD = "Password"
let TEXT_PASSWORD_REENTER = "Confirm Password"



let TEXT_SIGNUP_NOTE = "An account will allow you to save and access photo information across devices. You can delete your account at any time and your information will not be shared."
let TEXT_SIGNUP_PASSWORD_REQUIRED = "Password should be minimum 8 characters"
let TERM_AGREEMENT = "I Read And Agree The Terms And Conditions"
let TERM_AGREEMENT2 = "Agree"
let PASSWORD_MINIMUM_LENGTH_ERROR = "Password should be minimum 8 characters"
let ALREADY_EXIST_EMAIL = "Email is already existing \nPlease re-enter"



let SENT_LINK = "Sent Link"
let CONFIRM_EMAIL = "Please check your email"



//LOGIN and SIGNUP ERROR
let NO_ACCOUNT = "Account does not exist Or \nit was deleted. \nPlease check"



let IMAGE_LOGO = "logo"
let IMAGE_USER_PLACEHOLDER = "user-placeholder"
let IMAGE_PHOTO = "plus.circle"

let APIKey = "raqfsc49wmp5"




class Ref {
    // Storage
    static var STORAGE_ROOT = Storage.storage().reference(forURL: "gs://her-blk.appspot.com")
    
    // Storage - Posts
    static var STORAGE_POSTS = STORAGE_ROOT.child("posts")
    static func STORAGE_POST_ID(postId: String) -> StorageReference {
        return STORAGE_POSTS.child(postId)
    }
    
    // Storage - Chat
    static var STORAGE_CHAT = STORAGE_ROOT.child("chat")
    static func STORAGE_CHAT_ID(chatId: String) -> StorageReference {
        return STORAGE_CHAT.child(chatId)
    }
    
    
    // Firestore
    static var FIRESTORE_ROOT = Firestore.firestore()
    
    // Firestore - Users
    static var FIRESTORE_COLLECTION_USERS = FIRESTORE_ROOT.collection("users")
    static func FIRESTORE_DOCUMENT_USERID(userId: String) -> DocumentReference {
        return FIRESTORE_COLLECTION_USERS.document(userId)
    }
    
    // Firestore - Location
    static var FIRESTORE_COLLECTION_USERS_LOCATION = FIRESTORE_ROOT.collection("user_location")
    static func FIRESTORE_DOCUMENT_USER_LOCATION(userId: String) -> DocumentReference {
        return FIRESTORE_COLLECTION_USERS_LOCATION.document(userId)
    }
    
    static var FIRESTORE_COLLECTION_COMPANY = FIRESTORE_ROOT.collection("companies")
    static func FIRESTORE_COLLECTION_MY_COMPANY(name:String) -> DocumentReference {
        return FIRESTORE_COLLECTION_COMPANY.document(name)
    }
    
    static var FIRESTORE_COLLECTION_SCORE = FIRESTORE_ROOT.collection("score2")
    static func FIRESTORE_COLLECTION_SCORES(name:String) -> DocumentReference {
        return FIRESTORE_COLLECTION_SCORE.document(name)
        
    }
    
    static var FIRESTORE_COLLECTION_FOLLOWING = FIRESTORE_ROOT.collection("company-following")
    static func FIRESTORE_COLLECTION_FOLLOWING(name:String) -> DocumentReference {
        return FIRESTORE_COLLECTION_FOLLOWING.document(name)
        
    }
    
    static var FIRESTORE_COLLECTION_FOLLOWER = FIRESTORE_ROOT.collection("company-follower")
    static func FIRESTORE_COLLECTION_FOLLOWER(name:String) -> DocumentReference {
        return FIRESTORE_COLLECTION_FOLLOWER.document(name)
        
    }
    
    
    static var FIRESTORE_COLLECTION_POSTS = FIRESTORE_ROOT.collection("posts")
    static func FIRESTORE_COLLECTION_POSTS(name:String) -> DocumentReference {
        return FIRESTORE_COLLECTION_POSTS.document(name)
        
    }
    
}
