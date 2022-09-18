# require 'httparty'
require 'json'

def protect(event: , context: )
  resource = event['methodArn']
  token = event['authorizationToken']
  effect = token == "abc123" ? "Allow" : "Deny"

  {
    "principalId" => "current_user_id",
    "policyDocument" => {
      "Version" => "2012-10-17",
      "Statement" => [
        {
          "Action" => "execute-api:Invoke",
          "Effect" => effect,
          "Resource" => resource
        }
      ]
    }
  }
end
