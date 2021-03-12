const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "analytics": {
        "plugins": {
            "awsPinpointAnalyticsPlugin": {
                "pinpointAnalytics": {
                    "appId": "6c6a2608fcff4427b3a26e24d75fed04",
                    "region": "us-west-2"
                },
                "pinpointTargeting": {
                    "region": "us-west-2"
                }
            }
        }
    },
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "ap-south-1:e9cf9ce2-5996-43b0-ace0-4f6d67d62ebb",
                            "Region": "ap-south-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ap-south-1_zgd17n424",
                        "AppClientId": "42eou62jj402o4b76nkto3u646",
                        "Region": "ap-south-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                },
                "PinpointAnalytics": {
                    "Default": {
                        "AppId": "6c6a2608fcff4427b3a26e24d75fed04",
                        "Region": "us-west-2"
                    }
                },
                "PinpointTargeting": {
                    "Default": {
                        "Region": "us-west-2"
                    }
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://33j5de3ngrav5khi7havtz7uay.appsync-api.ap-south-1.amazonaws.com/graphql",
                        "Region": "ap-south-1",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-uuronqqakbdzzcgstvxjzslr2a",
                        "ClientDatabasePrefix": "servicewalletvender_API_KEY"
                    }
                },
                "S3TransferUtility": {
                    "Default": {
                        "Bucket": "servicewalletvender1db289b47a094b58a37d4bc95d56221605-dev",
                        "Region": "ap-south-1"
                    }
                }
            }
        }
    },
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "servicewalletvender": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://33j5de3ngrav5khi7havtz7uay.appsync-api.ap-south-1.amazonaws.com/graphql",
                    "region": "ap-south-1",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-uuronqqakbdzzcgstvxjzslr2a"
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsS3StoragePlugin": {
                "bucket": "servicewalletvender1db289b47a094b58a37d4bc95d56221605-dev",
                "region": "ap-south-1",
                "defaultAccessLevel": "guest"
            }
        }
    }
}''';