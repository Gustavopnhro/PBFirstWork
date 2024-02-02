{
  "MaxCount": 1,
  "MinCount": 1,
  "ImageId": "ami-0277155c3f0ab2930",
  "InstanceType": "t3.small",
  "KeyName": "minhaNovaChave",
  "EbsOptimized": true,
  "BlockDeviceMappings": [
    {
      "DeviceName": "/dev/xvda",
      "Ebs": {
        "Encrypted": false,
        "DeleteOnTermination": true,
        "Iops": 3000,
        "SnapshotId": "snap-07d29bb41309c5d78",
        "VolumeSize": 16,
        "VolumeType": "gp3",
        "Throughput": 125
      }
    }
  ],
  "NetworkInterfaces": [
    {
      "DeviceIndex": 0,
      "Groups": [
        "<groupId of the new security group created below>"
      ]
    }
  ],
  "TagSpecifications": [
    {
      "ResourceType": "instance",
      "Tags": [
        {
          "Key": "Name",
          "Value": "PB UNICESUMAR"
        },
        {
          "Key": "CostCenter",
          "Value": "C092000024"
        },
        {
          "Key": "Project",
          "Value": "PB UNICESUMAR"
        }
      ]
    },
    {
      "ResourceType": "volume",
      "Tags": [
        {
          "Key": "Name",
          "Value": "PB UNICESUMAR"
        },
        {
          "Key": "CostCenter",
          "Value": "C092000024"
        },
        {
          "Key": "Project",
          "Value": "PB UNICESUMAR"
        }
      ]
    }
  ],
  "MetadataOptions": {
    "HttpTokens": "required",
    "HttpEndpoint": "enabled",
    "HttpPutResponseHopLimit": 2
  },
  "PrivateDnsNameOptions": {
    "HostnameType": "ip-name",
    "EnableResourceNameDnsARecord": true,
    "EnableResourceNameDnsAAAARecord": false
  }
}


{
  "GroupName": "launch-wizard",
  "Description": "launch-wizard created 2024-02-01T13:21:06.611Z"
}

{
  "GroupId": "<groupId of the security group created above>",
  "IpPermissions": [
    {
      "IpProtocol": "tcp",
      "FromPort": 22,
      "ToPort": 22,
      "IpRanges": [
        {
          "CidrIp": "0.0.0.0/0"
        }
      ]
    }
  ]
}