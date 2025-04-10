plugins {
    id("com.android.application")
    id("com.google.gms.google-services") // Firebase
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin") // Must be after Android & Kotlin plugins
}

android {
    namespace = "com.example.souq_app"
    
    compileSdk = 35  // ✅ FIXED: Correct Kotlin DSL syntax

    ndkVersion = "27.0.12077973" // ✅ FIXED: Removed quotes (must be a number, not a string)

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.example.souq_app"
        
        minSdk = 23  // ✅ FIXED: Use `minSdk =` instead of `minSdkVersion`
        targetSdk = 33 // ✅ FIXED: Replace `flutter.targetSdkVersion` if undefined
        versionCode = 1 // ✅ FIXED: Replace `flutter.versionCode` if undefined
        versionName = "1.0" // ✅ FIXED: Replace `flutter.versionName` if undefined
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
   // implementation 'com.facebook.android:facebook-login:latest.release'
     implementation("com.facebook.android:facebook-login:16.3.0")
}
