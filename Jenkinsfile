pipeline {
    agent {
        node {
            label 'Mac-mini'
            customWorkspace 'wrappers/flutter_face_api'
        }
    }
    parameters {
        string(name: 'TYPE', defaultValue: 'Temp', description: '')
        string(name: 'BRANCH_NAME', defaultValue: 'functions', description: '')
        string(name: 'IOS_CI_BRANCH', defaultValue: 'wrappers', description: '')
        choice(name: 'SOURCE_TYPE', choices: ['Release', 'Temp', 'Nightly', 'Beta', 'Stage'])
        choice(name: 'CORE_MODULE_TYPE', choices: ['Release', 'Nightly', 'Beta', 'Stage', 'Temp'])
        string(name: 'MODULE_VERSION', defaultValue: '+', description: '')
        string(name: 'IOS_VERSION', defaultValue: '+', description: '')
        string(name: 'ANDROID_VERSION', defaultValue: '+', description: '')
        string(name: 'CORE_MODULE_VERSION', defaultValue: '+', description: '')
        booleanParam(name: 'VERBOSE_LOGS', defaultValue: false, description: "Enables 'set -x' and logs every executed command")
    }
    options {
        buildDiscarder logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '30', numToKeepStr: '120')
        gitLabConnection gitLabConnection: 'Jenkins', jobCredentialId: ''
        disableConcurrentBuilds()
    }
    environment {
        GITLAB_JENKINS_USER = credentials('JenkinsToGitLab')
        GITHUB_TOKEN = credentials('GitHubToken')
        PRIVATE_UPLOAD_FTP = credentials('temp-ftp')
    }
    stages {
        stage('Set Build name') {
            steps {
                script {
                    buildName "#$BUILD_NUMBER $TYPE $BRANCH_NAME"
                }
            }
        }
        stage('Build') {
            steps {
                dir('ios-ci') {
                    checkout scmGit(branches: [[name: "$IOS_CI_BRANCH"]],
                    userRemoteConfigs: [[credentialsId: "$GITLAB_JENKINS_USER",
                    url: 'http://gitlab.regula.local/mobile-sdk/ios-ci.git']])
                }
                sh '''
                source ios-ci/wrappers/core.sh
                run ./update.sh
                '''
            }
        }
    }
}
