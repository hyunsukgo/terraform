<powershell>
Invoke-WebRequest `
    https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/windows_amd64/AmazonSSMAgentSetup.exe `
    -OutFile $env:USERPROFILE\Desktop\SSMAgent_latest.exe
Start-Process `
    -FilePath $env:USERPROFILE\Desktop\SSMAgent_latest.exe `
    -ArgumentList "/S"
Invoke-WebRequest `
    https://s3.amazonaws.com/amazoncloudwatch-agent/windows/amd64/latest/amazon-cloudwatch-agent.msi `
    -OutFile $env:USERPROFILE\Desktop\amazon-cloudwatch-agent.msi
Start-Process `
    -FilePath $env:USERPROFILE\Desktop\amazon-cloudwatch-agent.msi `
</powershell>