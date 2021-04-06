<powershell>
#Amazon SSM Agent 설치 & 실행
Invoke-WebRequest `
    https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/windows_amd64/AmazonSSMAgentSetup.exe `
    -OutFile $env:USERPROFILE\Desktop\SSMAgent_latest.exe
Start-Process `
    -FilePath $env:USERPROFILE\Desktop\SSMAgent_latest.exe `
    -ArgumentList "/S"
#Amazon Cloudwatch Agent 설치 & 실행
Invoke-WebRequest `
    https://s3.amazonaws.com/amazoncloudwatch-agent/windows/amd64/latest/amazon-cloudwatch-agent.msi `
    -OutFile $env:USERPROFILE\Desktop\amazon-cloudwatch-agent.msi
Start-Process `
    -FilePath $env:USERPROFILE\Desktop\amazon-cloudwatch-agent.msi `
echo 
& "C:\Program Files\Amazon\AmazonCloudWatchAgent\amazon-cloudwatch-agent-ctl.ps1" -a fetch-config -m ec2 -s -c ssm:AmazonCloudWatch-windows
</powershell>