import org.jetbrains.kotlin.gradle.dsl.JvmTarget
import org.jetbrains.kotlin.gradle.dsl.KotlinAndroidProjectExtension

plugins {
    id("com.android.library")
}

rootProject.allprojects {
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://maven.regulaforensics.com/RegulaDocumentReader") }
        maven { url = uri("https://maven.regulaforensics.com/RegulaDocumentReader/Beta") }
        maven { url = uri("https://maven.regulaforensics.com/RegulaDocumentReader/Nightly") }
        maven { url = uri("https://maven.regulaforensics.com/RegulaDocumentReader/Stage") }
    }
}

val agpMajor = com.android.Version.ANDROID_GRADLE_PLUGIN_VERSION.substringBefore('.').toInt()
val builtInKotlinEnabled = providers.gradleProperty("android.builtInKotlin").map { it.toBoolean() }.getOrElse(agpMajor >= 9)
if (agpMajor < 9 || !builtInKotlinEnabled) {
    apply(plugin = "org.jetbrains.kotlin.android")
}

android {
    namespace = "com.regula.plugin.face.sdk"
    compileSdk = 36

    defaultConfig {
        minSdk = 24
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    testOptions {
        unitTests {
            isIncludeAndroidResources = true
            all {
                it.jvmArgs("--add-opens=java.base/jdk.internal.access=ALL-UNNAMED")
                it.outputs.upToDateWhen { false }
                it.testLogging {
                    events("passed", "skipped", "failed", "standardOut", "standardError")
                    showStandardStreams = true
                }
            }
        }
    }
}

extensions.configure<KotlinAndroidProjectExtension> {
    compilerOptions {
        jvmTarget = JvmTarget.JVM_11
    }
}

dependencies {
    implementation("com.regula.face:api:8.4.5414") {
        isTransitive = true
    }

    testImplementation("junit:junit:4.13.2")
    testImplementation("androidx.test:core:1.7.0")
    testImplementation("org.robolectric:robolectric:4.17")
    testImplementation("org.json:json:20260814")
    testImplementation("org.skyscreamer:jsonassert:1.5.3")
}
