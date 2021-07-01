const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "api": {
        "plugins": {
            "awsAPIPlugin": {
                "servicewalletvender": {
                    "endpointType": "GraphQL",
                    "endpoint": "https://cj4nqfd7fzcchl45652hl6imo4.appsync-api.ap-south-1.amazonaws.com/graphql",
                    "region": "ap-south-1",
                    "authorizationType": "API_KEY",
                    "apiKey": "da2-l65fmlqlg5bitlijp2qtjrci5q"
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
                            "PoolId": "ap-south-1:3ab8ce8b-e6b0-4bbe-b92e-37257e240e9d",
                            "Region": "ap-south-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ap-south-1_8VBaD5lab",
                        "AppClientId": "5sa8i6440jealh6o78e3b8jrr1",
                        "Region": "ap-south-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                },
                "AppSync": {
                    "Default": {
                        "ApiUrl": "https://cj4nqfd7fzcchl45652hl6imo4.appsync-api.ap-south-1.amazonaws.com/graphql",
                        "Region": "ap-south-1",
                        "AuthMode": "API_KEY",
                        "ApiKey": "da2-l65fmlqlg5bitlijp2qtjrci5q",
                        "ClientDatabasePrefix": "servicewalletvender_API_KEY"
                    }
                },
                "PinpointAnalytics": {
                    "Default": {
                        "AppId": "4ba1d36d7e9f4b189a0a2d3d94e96e74",
                        "Region": "us-west-2"
                    }
                },
                "PinpointTargeting": {
                    "Default": {
                        "Region": "us-west-2"
                    }
                },
                "S3TransferUtility": {
                    "Default": {
                        "Bucket": "servicewalletvenderbc9cd999d4f94b25a96809b8531a172923-dev",
                        "Region": "ap-south-1"
                    }
                }
            }
        }
    },
    "analytics": {
        "plugins": {
            "awsPinpointAnalyticsPlugin": {
                "pinpointAnalytics": {
                    "appId": "4ba1d36d7e9f4b189a0a2d3d94e96e74",
                    "region": "us-west-2"
                },
                "pinpointTargeting": {
                    "region": "us-west-2"
                }
            }
        }
    },
    "storage": {
        "plugins": {
            "awsS3StoragePlugin": {
                "bucket": "servicewalletvenderbc9cd999d4f94b25a96809b8531a172923-dev",
                "region": "ap-south-1",
                "defaultAccessLevel": "guest"
            }
        }
    }
}''';