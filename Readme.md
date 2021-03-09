# Kooeee Messenger

iOS App to show:

- Bitcoin balance for address: `1KbrSKrT3GeEruTuuYYUSQ35JwKbrAWJYm`
- Bitcoin and Ethereum Rates in US Dollars using [cryptocompare](https://min-api.cryptocompare.com/)
- Tab and Side Drawer navigation

## Setup

##### Requirments:

- MacOS `Mojave 10.14.4` or above
- Swift `5.0` or above
- XCode `10.2` or above
- Cocoa Pods `1.10.1`

##### Run the app

1. Got to the project's root: `kooee`
2. Open terminal and run the below command:

```
pod install
```

3. Open `KOOEEMessenger.xcworkspace` in `XCode` and run the project.

## Project Structure

```
├── KOOEEMessenger
│   ├── AppDelegate
│   │   ├── AppDelegate.swift
│   │   └── SceneDelegate.swift
│   │     
│   ├── Assets.xcassets
│   │   ├── AppColors
│   │   └── AppImages
│   │     
│   ├── Base.lproj
│   │   ├── LaunchScreen.storyboard
│   │   └── Main.storyboard
│   │     
│   ├── Features
│   │   ├── Add
│   │   │   ├── Add.storyboard
│   │   │   └── AddVC.swift
│   │   ├── Contacts
│   │   │   ├── Contacts.storyboard
│   │   │   └── ContactsVC.swift
│   │   ├── Messages
│   │   │   ├── Messages.storyboard
│   │   │   └── MessagesVC.swift
│   │   ├── Play
│   │   │   ├── Content.storyboard
│   │   │   └── ContentVC.swift
│   │   ├── Settings
│   │   │   ├── SettingCell.swift
│   │   │   ├── SettingCell.xib
│   │   │   ├── Settings.storyboard
│   │   │   └── SettingsVC.swift
│   │   └── Wallet
│   │       ├── Wallet.storyboard
│   │       ├── WalletPresenter.swift
│   │       └── WalletVC.swift
│   │     
│   ├── Fonts
│   │   ├── SFProDisplay-Bold.ttf
│   │   ├── SFProDisplay-Light.ttf
│   │   └── SFProDisplay-Regular.ttf
│   │     
│   ├── Helper
│   │   ├── Colors.swift
│   │   ├── Constants.swift
│   │   ├── Helper.swift
│   │   └── Strings.swift
│   │     
│   ├── Info.plist
│   │     
│   ├── Models
│   │   ├── CryptoBalance.swift
│   │   ├── CryptoRate.swift
│   │   └── SettingItem.swift
│   │     
│   ├── Reusable Classes
│   │   ├── CustomViewController.swift
│   │   ├── KMCustomButton.swift
│   │   └── RoundedCornerView.swift
│   │     
│   └── Utilities
│       └── NetworkLayer
│           ├── APIs
│           │   ├── GetCryptoRate.swift
│           │   └── GetCryptoBalance.swift
│           ├── Encoding
│           │   ├── JSONParameterEncoder.swift
│           │   ├── ParameterEncoding.swift
│           │   └── URLParameterEncoder.swift
│           ├── EndPoints
│           │   ├── CryptoCurrencyEndPoints.swift
│           │   └── CryptoRatesEndPoints.swift
│           ├── NetworkManager
│           │   └── NetworkManager.swift
│           └── Service
│               ├── EndPointType.swift
│               ├── HTTPMethod.swift
│               ├── HTTPTask.swift
│               ├── NetworkLogger.swift
│               └── Router.swift
│ 
├── Podfile
└── Podfile.lock
```

The project is build upon the MVP architecture. And the directory structure is described below:

1. `Features`: Contains all the files categorised based on a feature.
2. `Models`: Contains all the data model classes.
3. `Reusable Classes`: Contains all the reusable classes.
4. `Utilities`: Contains all the utilities for the app. Currently, network layer for making API calls.

#### Notes

- Used [blockcypher](https://api.blockcypher.com/) service to fetch Bitcoin balance for the provided address.
- Used [cryptocompare](https://min-api.cryptocompare.com/) instead of [blockchain.info](https://blockchain.info/) as it gives ETH rates too.
- Added an image for the graph on wallet screen (just to look good 😉).
