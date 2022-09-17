# require 'httparty'
require 'json'

def protect(event: , context: )
  resource = event['methodArn']
  p event
  p context

  {
    "principalId" => "current_user_id", # replace with the current user id
    "policyDocument" => {
      "Version" => "2012-10-17",
      "Statement" => [
        {
          "Action" => "execute-api:Invoke",
          "Effect" => "Allow",
          "Resource" => resource
        }
      ]
    }
  }
end
