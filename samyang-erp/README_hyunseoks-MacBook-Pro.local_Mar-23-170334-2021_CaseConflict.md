
 - version: 4
 - terraform_version: 0.14.6
 - serial: 106
 - lineage: b4ba3cb7-07a3-a3a3-9e68-9b6ba5f3d02e
 - outputs
    
     - id
        
         - value: i-01c1a85fdc39e3748
         - type: string
        
    
 - resources
    
     - 0
        
         - mode: data
         - type: aws_availability_zones
         - name: available
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - all_availability_zones: null
                     - exclude_names: null
                     - exclude_zone_ids: null
                     - filter
                        
                         - 0
                            
                             - name: zone-name
                             - values
                                
                                 - 0: ap-northeast-2a
                                 - 1: ap-northeast-2c
                                
                            
                        
                     - group_names
                        
                         - 0: ap-northeast-2
                        
                     - id: ap-northeast-2
                     - names
                        
                         - 0: ap-northeast-2a
                         - 1: ap-northeast-2c
                        
                     - state: available
                     - zone_ids
                        
                         - 0: apne2-az1
                         - 1: apne2-az3
                        
                    
                 - sensitive_attributes
                    
                    
                
            
        
     - 1
        
         - mode: data
         - type: aws_ec2_transit_gateway_vpn_attachment
         - name: tgw_attachment_vpn
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - filter: null
                     - id: tgw-attach-0a124ecf64b91c10c
                     - tags
                        
                        
                     - transit_gateway_id: tgw-0b9255b9254c08317
                     - vpn_connection_id: vpn-090ed6e6c352adf45
                    
                 - sensitive_attributes
                    
                    
                
            
        
     - 2
        
         - mode: data
         - type: aws_subnet_ids
         - name: private
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - filter: null
                     - id: vpc-02c522ba58ca5f742
                     - ids
                        
                         - 0: subnet-00280d3887f782614
                         - 1: subnet-00817db828487ad50
                         - 2: subnet-00dacef89f1e93aca
                         - 3: subnet-014cb9765b303b464
                         - 4: subnet-052acb88931aa28cf
                         - 5: subnet-062446f45fd20df78
                         - 6: subnet-063aba40e559711f2
                         - 7: subnet-0665f9f4846e3a227
                         - 8: subnet-0ab6c4f1421f2d1ed
                         - 9: subnet-0bbed088ce4609440
                         - 10: subnet-0bdef5652db079b1f
                         - 11: subnet-0e8f608f825ce4f27
                         - 12: subnet-0fbb4d36765952735
                        
                     - tags
                        
                         - RT: private
                        
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                
            
        
     - 3
        
         - mode: data
         - type: aws_subnet_ids
         - name: public
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - filter: null
                     - id: vpc-02c522ba58ca5f742
                     - ids
                        
                         - 0: subnet-0312c7e5c759250b2
                         - 1: subnet-03b15c93a2b2cb897
                        
                     - tags
                        
                         - RT: public
                        
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                
            
        
     - 4
        
         - mode: managed
         - type: aws_accessanalyzer_analyzer
         - name: iam-access-analyzer
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - analyzer_name: samyang-access
                     - arn: arn:aws:access-analyzer:ap-northeast-2:969470234861:analyzer/samyang-access
                     - id: samyang-access
                     - tags: null
                     - type: ACCOUNT
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 5
        
         - mode: managed
         - type: aws_cloudtrail
         - name: cloudtrail
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:cloudtrail:ap-northeast-2:969470234861:trail/samyang-trail
                     - cloud_watch_logs_group_arn: 
                     - cloud_watch_logs_role_arn: 
                     - enable_log_file_validation: false
                     - enable_logging: true
                     - event_selector
                        
                        
                     - home_region: ap-northeast-2
                     - id: samyang-trail
                     - include_global_service_events: false
                     - insight_selector
                        
                        
                     - is_multi_region_trail: false
                     - is_organization_trail: false
                     - kms_key_id: 
                     - name: samyang-trail
                     - s3_bucket_name: samyang-cloudtrail-bucket
                     - s3_key_prefix: prefix
                     - sns_topic_name: 
                     - tags
                        
                        
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_s3_bucket.cloudtrailucket
                    
                
            
        
     - 6
        
         - mode: managed
         - type: aws_config_aggregate_authorization
         - name: config
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - account_id: 969470234861
                     - arn: arn:aws:config:ap-northeast-2:969470234861:aggregation-authorization/969470234861/ap-northeast-2
                     - id: 969470234861:ap-northeast-2
                     - region: ap-northeast-2
                     - tags
                        
                        
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 7
        
         - mode: managed
         - type: aws_customer_gateway
         - name: cgw
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:customer-gateway/cgw-0303a99f7dd5dd93a
                     - bgp_asn: 65000
                     - device_name: 
                     - id: cgw-0303a99f7dd5dd93a
                     - ip_address: 220.72.11.210
                     - tags
                        
                         - Name: samyang-customer-gateway
                        
                     - type: ipsec.1
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 8
        
         - mode: managed
         - type: aws_default_security_group
         - name: sy_d_sg
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:security-group/sg-0b74c9424e4dba1f9
                     - description: default VPC security group
                     - egress
                        
                         - 0
                            
                             - cidr_blocks
                                
                                 - 0: 0.0.0.0/0
                                
                             - description: 
                             - from_port: 0
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: -1
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 0
                            
                        
                     - id: sg-0b74c9424e4dba1f9
                     - ingress
                        
                         - 0
                            
                             - cidr_blocks
                                
                                
                             - description: 
                             - from_port: 0
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: -1
                             - security_groups
                                
                                
                             - self: true
                             - to_port: 0
                            
                        
                     - name: default
                     - owner_id: 969470234861
                     - revoke_rules_on_delete: false
                     - tags
                        
                         - Name: sy-default-sg
                        
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJzY2hlbWFfdmVyc2lvbiI6IjEifQ==
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 9
        
         - mode: managed
         - type: aws_dlm_lifecycle_policy
         - name: lifecycle_manager
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:dlm:ap-northeast-2:969470234861:policy/policy-0846666a51e500431
                     - description: lifecycle policy
                     - execution_role_arn: arn:aws:iam::969470234861:role/dlm-lifecycle-role
                     - id: policy-0846666a51e500431
                     - policy_details
                        
                         - 0
                            
                             - resource_types
                                
                                 - 0: VOLUME
                                
                             - schedule
                                
                                 - 0
                                    
                                     - copy_tags: false
                                     - create_rule
                                        
                                         - 0
                                            
                                             - interval: 24
                                             - interval_unit: HOURS
                                             - times
                                                
                                                 - 0: 20:30
                                                
                                            
                                        
                                     - name: 1 weeks of daily snapshots
                                     - retain_rule
                                        
                                         - 0
                                            
                                             - count: 7
                                            
                                        
                                     - tags_to_add
                                        
                                         - SnapshotCreator: DLM
                                        
                                    
                                
                             - target_tags
                                
                                 - Snapshot: true
                                
                            
                        
                     - state: ENABLED
                     - tags
                        
                        
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_iam_role.dlm_lifecycle_role
                    
                
            
        
     - 10
        
         - mode: managed
         - type: aws_ebs_volume
         - name: eaccapdev_add
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:volume/vol-0b6a8baefc36129f9
                     - availability_zone: ap-northeast-2a
                     - encrypted: false
                     - id: vol-0b6a8baefc36129f9
                     - iops: 180
                     - kms_key_id: 
                     - multi_attach_enabled: false
                     - outpost_arn: 
                     - size: 60
                     - snapshot_id: 
                     - tags
                        
                         - Snapshot: true
                        
                     - throughput: 0
                     - type: gp2
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 11
        
         - mode: managed
         - type: aws_ebs_volume
         - name: eaccdb_add
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:volume/vol-0be435649bddab716
                     - availability_zone: ap-northeast-2a
                     - encrypted: false
                     - id: vol-0be435649bddab716
                     - iops: 300
                     - kms_key_id: 
                     - multi_attach_enabled: false
                     - outpost_arn: 
                     - size: 100
                     - snapshot_id: 
                     - tags
                        
                         - Snapshot: true
                        
                     - throughput: 0
                     - type: gp2
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 12
        
         - mode: managed
         - type: aws_ebs_volume
         - name: endb
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:volume/vol-0c54b248e218ed725
                     - availability_zone: ap-northeast-2a
                     - encrypted: false
                     - id: vol-0c54b248e218ed725
                     - iops: 100
                     - kms_key_id: 
                     - multi_attach_enabled: false
                     - outpost_arn: 
                     - size: 10
                     - snapshot_id: 
                     - tags
                        
                         - Name: samyang-endb
                         - Snapshot: true
                        
                     - throughput: 0
                     - type: gp2
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 13
        
         - mode: managed
         - type: aws_ebs_volume
         - name: hanadata
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:volume/vol-00f9dcb212738fcbb
                     - availability_zone: ap-northeast-2a
                     - encrypted: false
                     - id: vol-00f9dcb212738fcbb
                     - iops: 3000
                     - kms_key_id: 
                     - multi_attach_enabled: false
                     - outpost_arn: 
                     - size: 310
                     - snapshot_id: 
                     - tags
                        
                         - Snapshot: true
                        
                     - throughput: 125
                     - type: gp3
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 14
        
         - mode: managed
         - type: aws_ebs_volume
         - name: hanalog
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:volume/vol-0b4f35ac2f752f4ba
                     - availability_zone: ap-northeast-2a
                     - encrypted: false
                     - id: vol-0b4f35ac2f752f4ba
                     - iops: 3000
                     - kms_key_id: 
                     - multi_attach_enabled: false
                     - outpost_arn: 
                     - size: 128
                     - snapshot_id: 
                     - tags
                        
                         - Snapshot: true
                        
                     - throughput: 125
                     - type: gp3
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 15
        
         - mode: managed
         - type: aws_ebs_volume
         - name: hanashared
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:volume/vol-05fd625968123b4a6
                     - availability_zone: ap-northeast-2a
                     - encrypted: false
                     - id: vol-05fd625968123b4a6
                     - iops: 3000
                     - kms_key_id: 
                     - multi_attach_enabled: false
                     - outpost_arn: 
                     - size: 256
                     - snapshot_id: 
                     - tags
                        
                         - Snapshot: true
                        
                     - throughput: 125
                     - type: gp3
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 16
        
         - mode: managed
         - type: aws_ebs_volume
         - name: sapcd-db
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:volume/vol-071f94ab595f34acd
                     - availability_zone: ap-northeast-2a
                     - encrypted: false
                     - id: vol-071f94ab595f34acd
                     - iops: 3000
                     - kms_key_id: 
                     - multi_attach_enabled: false
                     - outpost_arn: 
                     - size: 300
                     - snapshot_id: 
                     - tags
                        
                         - Snapshot: true
                        
                     - throughput: 125
                     - type: gp3
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 17
        
         - mode: managed
         - type: aws_ebs_volume
         - name: swap-db
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:volume/vol-01a300925099a6f92
                     - availability_zone: ap-northeast-2a
                     - encrypted: false
                     - id: vol-01a300925099a6f92
                     - iops: 3000
                     - kms_key_id: 
                     - multi_attach_enabled: false
                     - outpost_arn: 
                     - size: 160
                     - snapshot_id: 
                     - tags
                        
                         - Snapshot: true
                        
                     - throughput: 125
                     - type: gp3
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 18
        
         - mode: managed
         - type: aws_ebs_volume
         - name: usrsap_db
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:volume/vol-05c4c0e84a3a7523e
                     - availability_zone: ap-northeast-2a
                     - encrypted: false
                     - id: vol-05c4c0e84a3a7523e
                     - iops: 3000
                     - kms_key_id: 
                     - multi_attach_enabled: false
                     - outpost_arn: 
                     - size: 20
                     - snapshot_id: 
                     - tags
                        
                         - Snapshot: true
                        
                     - throughput: 125
                     - type: gp3
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 19
        
         - mode: managed
         - type: aws_ec2_transit_gateway
         - name: tgw
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - amazon_side_asn: 64512
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:transit-gateway/tgw-0b9255b9254c08317
                     - association_default_route_table_id: tgw-rtb-0a2de2df8148cc830
                     - auto_accept_shared_attachments: disable
                     - default_route_table_association: enable
                     - default_route_table_propagation: enable
                     - description: samyang-tgw
                     - dns_support: enable
                     - id: tgw-0b9255b9254c08317
                     - owner_id: 969470234861
                     - propagation_default_route_table_id: tgw-rtb-0a2de2df8148cc830
                     - tags
                        
                         - Name: samyang-tgw
                        
                     - vpn_ecmp_support: enable
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 20
        
         - mode: managed
         - type: aws_ec2_transit_gateway_route
         - name: vpn_route
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - blackhole: false
                     - destination_cidr_block: 130.1.0.0/16
                     - id: tgw-rtb-0a2de2df8148cc830_130.1.0.0/16
                     - transit_gateway_attachment_id: tgw-attach-0a124ecf64b91c10c
                     - transit_gateway_route_table_id: tgw-rtb-0a2de2df8148cc830
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_customer_gateway.cgw
                     - 1: aws_ec2_transit_gateway.tgw
                     - 2: aws_ec2_transit_gateway_route_table.tgw_rt
                     - 3: aws_vpn_connection.vpn
                     - 4: data.aws_ec2_transit_gateway_vpn_attachment.tgw_attachment_vpn
                    
                
            
        
     - 21
        
         - mode: managed
         - type: aws_ec2_transit_gateway_route_table
         - name: tgw_rt
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:transit-gateway-route-table/tgw-rtb-0a2de2df8148cc830
                     - default_association_route_table: true
                     - default_propagation_route_table: true
                     - id: tgw-rtb-0a2de2df8148cc830
                     - tags
                        
                         - Name: samyang-tgw-rt
                        
                     - transit_gateway_id: tgw-0b9255b9254c08317
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                    
                
            
        
     - 22
        
         - mode: managed
         - type: aws_ec2_transit_gateway_route_table_association
         - name: tgw_rta_vpn
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - id: tgw-rtb-0a2de2df8148cc830_tgw-attach-0a124ecf64b91c10c
                     - resource_id: vpn-090ed6e6c352adf45
                     - resource_type: vpn
                     - transit_gateway_attachment_id: tgw-attach-0a124ecf64b91c10c
                     - transit_gateway_route_table_id: tgw-rtb-0a2de2df8148cc830
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_customer_gateway.cgw
                     - 1: aws_ec2_transit_gateway.tgw
                     - 2: aws_ec2_transit_gateway_route_table.tgw_rt
                     - 3: aws_vpn_connection.vpn
                     - 4: data.aws_ec2_transit_gateway_vpn_attachment.tgw_attachment_vpn
                    
                
            
        
     - 23
        
         - mode: managed
         - type: aws_ec2_transit_gateway_vpc_attachment
         - name: tgw_attachment_vpc
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - appliance_mode_support: disable
                     - dns_support: enable
                     - id: tgw-attach-0e4921f04a086355e
                     - ipv6_support: disable
                     - subnet_ids
                        
                         - 0: subnet-0312c7e5c759250b2
                        
                     - tags
                        
                        
                     - transit_gateway_default_route_table_association: true
                     - transit_gateway_default_route_table_propagation: true
                     - transit_gateway_id: tgw-0b9255b9254c08317
                     - vpc_id: vpc-02c522ba58ca5f742
                     - vpc_owner_id: 969470234861
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_subnet.COMMON1_A
                     - 2: aws_vpc.vpc
                    
                
            
        
     - 24
        
         - mode: managed
         - type: aws_efs_access_point
         - name: efs_access_point
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:elasticfilesystem:ap-northeast-2:969470234861:access-point/fsap-0003c9161d33fe1be
                     - file_system_arn: arn:aws:elasticfilesystem:ap-northeast-2:969470234861:file-system/fs-0d3ec46d
                     - file_system_id: fs-0d3ec46d
                     - id: fsap-0003c9161d33fe1be
                     - owner_id: 969470234861
                     - posix_user
                        
                        
                     - root_directory
                        
                         - 0
                            
                             - creation_info
                                
                                
                             - path: /
                            
                        
                     - tags
                        
                         - Name: samyang-efs-access-point
                        
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_efs_file_system.efs
                    
                
            
        
     - 25
        
         - mode: managed
         - type: aws_efs_file_system
         - name: efs
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:elasticfilesystem:ap-northeast-2:969470234861:file-system/fs-0d3ec46d
                     - creation_token: terraform-20210216061100619800000001
                     - dns_name: fs-0d3ec46d.efs.ap-northeast-2.amazonaws.com
                     - encrypted: false
                     - id: fs-0d3ec46d
                     - kms_key_id: 
                     - lifecycle_policy
                        
                        
                     - performance_mode: generalPurpose
                     - provisioned_throughput_in_mibps: 0
                     - tags
                        
                         - Name: samyang-efs
                        
                     - throughput_mode: bursting
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 26
        
         - mode: managed
         - type: aws_eip
         - name: nat_eip
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - allocation_id: null
                     - associate_with_private_ip: null
                     - association_id: eipassoc-031ada5e509fe9ab7
                     - carrier_ip: 
                     - customer_owned_ip: 
                     - customer_owned_ipv4_pool: 
                     - domain: vpc
                     - id: eipalloc-017bf67bbba02c337
                     - instance: 
                     - network_border_group: ap-northeast-2
                     - network_interface: eni-0c490ebc2c7b21472
                     - private_dns: ip-10-200-0-109.ap-northeast-2.compute.internal
                     - private_ip: 10.200.0.109
                     - public_dns: ec2-52-78-167-33.ap-northeast-2.compute.amazonaws.com
                     - public_ip: 52.78.167.33
                     - public_ipv4_pool: amazon
                     - tags
                        
                         - Name: samyang-EIP
                        
                     - timeouts: null
                     - vpc: true
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiZGVsZXRlIjoxODAwMDAwMDAwMDAsInJlYWQiOjkwMDAwMDAwMDAwMCwidXBkYXRlIjozMDAwMDAwMDAwMDB9fQ==
                
            
        
     - 27
        
         - mode: managed
         - type: aws_iam_group
         - name: ARCHITECT
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:iam::969470234861:group/users/ARCHITECT
                     - id: ARCHITECT
                     - name: ARCHITECT
                     - path: /users/
                     - unique_id: AGPA6DOHN2DWWVQPP6QIP
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 28
        
         - mode: managed
         - type: aws_iam_group
         - name: OPS
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:iam::969470234861:group/users/OPS
                     - id: OPS
                     - name: OPS
                     - path: /users/
                     - unique_id: AGPA6DOHN2DW5HHF33RWS
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 29
        
         - mode: managed
         - type: aws_iam_group
         - name: SCIENTIST
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:iam::969470234861:group/users/SCIENTIST
                     - id: SCIENTIST
                     - name: SCIENTIST
                     - path: /users/
                     - unique_id: AGPA6DOHN2DWZMQGBYKGW
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 30
        
         - mode: managed
         - type: aws_iam_group
         - name: SECURITY
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:iam::969470234861:group/users/SECURITY
                     - id: SECURITY
                     - name: SECURITY
                     - path: /users/
                     - unique_id: AGPA6DOHN2DWVV7AYZS74
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 31
        
         - mode: managed
         - type: aws_iam_group
         - name: SYSOPS
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:iam::969470234861:group/users/SYSOPS
                     - id: SYSOPS
                     - name: SYSOPS
                     - path: /users/
                     - unique_id: AGPA6DOHN2DW4B6LDU5VF
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 32
        
         - mode: managed
         - type: aws_iam_group_policy
         - name: ARCHITECT
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - group: ARCHITECT
                     - id: ARCHITECT:ARCHITECT
                     - name: ARCHITECT
                     - name_prefix: null
                     - policy: {"Statement":[{"Action":"*","Effect":"Allow","Resource":"*"}],"Version":"2012-10-17"}
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_iam_group.ARCHITECT
                    
                
            
        
     - 33
        
         - mode: managed
         - type: aws_iam_group_policy
         - name: SECURITY
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - group: SECURITY
                     - id: SECURITY:SECURITY
                     - name: SECURITY
                     - name_prefix: null
                     - policy: {"Statement":[{"Action":["access-analyzer:GetAnalyzedResource","access-analyzer:GetAnalyzer","access-analyzer:GetArchiveRule","access-analyzer:GetFinding","access-analyzer:ListAnalyzedResources","access-analyzer:ListAnalyzers","access-analyzer:ListArchiveRules","access-analyzer:ListFindings","access-analyzer:ListTagsForResource","acm:Describe*","acm:List*","application-autoscaling:Describe*","athena:GetWorkGroup","athena:List*","autoscaling:Describe*","batch:DescribeComputeEnvironments","batch:DescribeJobDefinitions","cloudformation:DescribeStack*","cloudformation:GetTemplate","cloudformation:ListStack*","cloudformation:GetStackPolicy","cloudsearch:DescribeDomains","cloudsearch:DescribeServiceAccessPolicies","cloudtrail:DescribeTrails","cloudtrail:GetEventSelectors","cloudtrail:GetTrailStatus","cloudtrail:ListTags","cloudtrail:LookupEvents","cloudwatch:Describe*","comprehend:Describe*","comprehend:List*","config:BatchGetAggregateResourceConfig","config:BatchGetResourceConfig","config:Deliver*","config:Describe*","config:Get*","config:List*","directconnect:Describe*","ds:DescribeDirectories","ec2:Describe*","ec2:DescribeTransitGatewayAttachments","ec2:DescribeTransitGatewayMulticastDomains","ec2:DescribeTransitGatewayPeeringAttachments","ec2:DescribeTransitGatewayRouteTables","ec2:DescribeTransitGateways","ec2:DescribeTransitGatewayVpcAttachments","ec2:GetManagedPrefixListAssociations","ec2:GetManagedPrefixListEntries","ecr:DescribeRepositories","ecr:GetRepositoryPolicy","ecs:Describe*","ecs:List*","eks:DescribeCluster","eks:ListClusters","elasticfilesystem:DescribeFileSystems","elasticfilesystem:DescribeMountTargetSecurityGroups","elasticfilesystem:DescribeMountTargets","elasticloadbalancing:Describe*","events:Describe*","events:List*","guardduty:Get*","guardduty:List*","iam:GenerateCredentialReport","iam:GenerateServiceLastAccessedDetails","iam:Get*","iam:List*","iam:SimulateCustomPolicy","iam:SimulatePrincipalPolicy","inspector:Describe*","inspector:Get*","inspector:List*","inspector:Preview*","kms:Describe*","kms:Get*","kms:List*","lambda:GetAccountSettings","lambda:GetFunctionConfiguration","lambda:GetLayerVersionPolicy","lambda:GetPolicy","lambda:List*","license-manager:List*","lightsail:GetInstances","lightsail:GetLoadBalancers","logs:Describe*","logs:ListTagsLogGroup","quicksight:Describe*","quicksight:List*","ram:List*","rds:Describe*","rds:DownloadDBLogFilePortion","rds:ListTagsForResource","redshift:Describe*","robomaker:Describe*","robomaker:List*","s3:GetAccelerateConfiguration","s3:GetAccessPoint","s3:GetAccessPointPolicy","s3:GetAccessPointPolicyStatus","s3:GetAccountPublicAccessBlock","s3:GetAnalyticsConfiguration","s3:GetBucket*","s3:GetEncryptionConfiguration","s3:GetInventoryConfiguration","s3:GetLifecycleConfiguration","s3:GetMetricsConfiguration","s3:GetObjectAcl","s3:GetObjectVersionAcl","s3:GetReplicationConfiguration","s3:ListAccessPoints","s3:ListAllMyBuckets","secretsmanager:GetResourcePolicy","secretsmanager:ListSecrets","secretsmanager:ListSecretVersionIds","securityhub:Describe*","securityhub:Get*","securityhub:List*","shield:Describe*","shield:List*","sns:GetTopicAttributes","sns:ListSubscriptionsByTopic","sns:ListTagsForResource","sns:ListTopics","ssm:Describe*","ssm:GetAutomationExecution","ssm:ListDocuments","states:ListStateMachines","tag:GetResources","tag:GetTagKeys","waf:GetWebACL","waf:ListWebACLs","waf:ListTagsForResource","wafv2:GetWebACL","wafv2:ListAvailableManagedRuleGroups","wafv2:ListIPSets","wafv2:ListLoggingConfigurations","wafv2:ListRegexPatternSets","wafv2:ListResourcesForWebACL","wafv2:ListRuleGroups","wafv2:ListTagsForResource","wafv2:ListWebACLs","waf-regional:GetWebACL","waf-regional:ListResourcesForWebACL","waf-regional:ListTagsForResource","waf-regional:ListWebACLs","workspaces:Describe*","cloudsearch:DescribeDomainEndpointOptions","cloudwatch:ListTagsForResource","detective:ListGraphs","detective:ListMembers","detective:GetGraphIngestState","dynamodb:ListTagsOfResource","ec2:DescribeTransitGatewayAttachments","ec2:DescribeTransitGatewayMulticastDomains","ec2:DescribeTransitGatewayPeeringAttachments","ec2:DescribeTransitGatewayRouteTables","ec2:DescribeTransitGateways","ec2:DescribeTransitGatewayVpcAttachments","ec2:GetManagedPrefixListAssociations","ec2:GetManagedPrefixListEntries","ecr:DescribeImages","ecr:GetLifecyclePolicy","ecr:ListTagsForResource","eks:DescribeNodeGroup","eks:ListNodeGroups","elasticache:ListTagsForResource","events:TestEventPattern","glue:GetDataCatalogEncryptionSettings","glue:GetDevEndpoints","guardduty:DescribePublishingDestination","secretsmanager:DescribeSecret","sns:ListTagsForResource","ssm:ListTagsForResource"],"Effect":"Allow","Resource":"*"}],"Version":"2012-10-17"}
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_iam_group.SECURITY
                    
                
            
        
     - 34
        
         - mode: managed
         - type: aws_iam_group_policy
         - name: SYSOPS
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - group: SYSOPS
                     - id: SYSOPS:SYSOPS
                     - name: SYSOPS
                     - name_prefix: null
                     - policy: {"Statement":[{"Action":["acm:Describe*","acm:Get*","acm:List*","acm:Request*","acm:Resend*","autoscaling:*","cloudtrail:DescribeTrails","cloudtrail:GetTrailStatus","cloudtrail:ListPublicKeys","cloudtrail:ListTags","cloudtrail:LookupEvents","cloudtrail:StartLogging","cloudtrail:StopLogging","cloudwatch:*","config:*","ds:*","ec2:Allocate*","ec2:AssignPrivateIpAddresses*","ec2:Associate*","ec2:Allocate*","ec2:AttachInternetGateway","ec2:AttachNetworkInterface","ec2:AttachVpnGateway","ec2:Bundle*","ec2:Cancel*","ec2:Copy*","ec2:CreateCustomerGateway","ec2:CreateDhcpOptions","ec2:CreateFlowLogs","ec2:CreateImage","ec2:CreateInstanceExportTask","ec2:CreateInternetGateway","ec2:CreateKeyPair","ec2:CreateLaunchTemplate","ec2:CreateLaunchTemplateVersion","ec2:CreateNatGateway","ec2:CreateNetworkInterface","ec2:CreatePlacementGroup","ec2:CreateReservedInstancesListing","ec2:CreateRoute","ec2:CreateRouteTable","ec2:CreateSecurityGroup","ec2:CreateSnapshot","ec2:CreateSpotDatafeedSubscription","ec2:CreateSubnet","ec2:CreateTags","ec2:CreateVolume","ec2:CreateVpc","ec2:CreateVpcEndpoint","ec2:CreateVpnConnection","ec2:CreateVpnConnectionRoute","ec2:CreateVpnGateway","ec2:DeleteFlowLogs","ec2:DeleteKeyPair","ec2:DeleteLaunchTemplate","ec2:DeleteLaunchTemplateVersions","ec2:DeleteNatGateway","ec2:DeleteNetworkInterface","ec2:DeletePlacementGroup","ec2:DeleteSnapshot","ec2:DeleteSpotDatafeedSubscription","ec2:DeleteSubnet","ec2:DeleteTags","ec2:DeleteVpc","ec2:DeleteVpcEndpoints","ec2:DeleteVpnConnection","ec2:DeleteVpnConnectionRoute","ec2:DeleteVpnGateway","ec2:DeregisterImage","ec2:Describe*","ec2:DetachInternetGateway","ec2:DetachNetworkInterface","ec2:DetachVpnGateway","ec2:DisableVgwRoutePropagation","ec2:DisableVpcClassicLinkDnsSupport","ec2:DisassociateAddress","ec2:DisassociateRouteTable","ec2:EnableVgwRoutePropagation","ec2:EnableVolumeIO","ec2:EnableVpcClassicLinkDnsSupport","ec2:GetConsoleOutput","ec2:GetHostReservationPurchasePreview","ec2:GetLaunchTemplateData","ec2:GetPasswordData","ec2:Import*","ec2:Modify*","ec2:MonitorInstances","ec2:MoveAddressToVpc","ec2:Purchase*","ec2:RegisterImage","ec2:Release*","ec2:Replace*","ec2:ReportInstanceStatus","ec2:Request*","ec2:Reset*","ec2:RestoreAddressToClassic","ec2:RunScheduledInstances","ec2:UnassignPrivateIpAddresses","ec2:UnmonitorInstances","ec2:UpdateSecurityGroupRuleDescriptionsEgress","ec2:UpdateSecurityGroupRuleDescriptionsIngress","elasticloadbalancing:*","events:*","iam:GetAccount*","iam:GetContextKeys*","iam:GetCredentialReport","iam:ListAccountAliases","iam:ListGroups","iam:ListOpenIDConnectProviders","iam:ListPolicies","iam:ListPoliciesGrantingServiceAccess","iam:ListRoles","iam:ListSAMLProviders","iam:ListServerCertificates","iam:Simulate*","iam:UpdateServerCertificate","iam:UpdateSigningCertificate","kinesis:ListStreams","kinesis:PutRecord","kms:CreateAlias","kms:CreateKey","kms:DeleteAlias","kms:Describe*","kms:GenerateRandom","kms:Get*","kms:List*","kms:Encrypt","kms:ReEncrypt*","lambda:Create*","lambda:Delete*","lambda:Get*","lambda:InvokeFunction","lambda:List*","lambda:PublishVersion","lambda:Update*","logs:*","rds:Describe*","rds:ListTagsForResource","ses:*","sns:*","sqs:*","trustedadvisor:*"],"Effect":"Allow","Resource":"*"},{"Action":["ec2:AcceptVpcPeeringConnection","ec2:AttachClassicLinkVpc","ec2:AttachVolume","ec2:AuthorizeSecurityGroupEgress","ec2:AuthorizeSecurityGroupIngress","ec2:CreateVpcPeeringConnection","ec2:DeleteCustomerGateway","ec2:DeleteDhcpOptions","ec2:DeleteInternetGateway","ec2:DeleteNetworkAcl*","ec2:DeleteRoute","ec2:DeleteRouteTable","ec2:DeleteSecurityGroup","ec2:DeleteVolume","ec2:DeleteVpcPeeringConnection","ec2:DetachClassicLinkVpc","ec2:DetachVolume","ec2:DisableVpcClassicLink","ec2:EnableVpcClassicLink","ec2:GetConsoleScreenshot","ec2:RebootInstances","ec2:RejectVpcPeeringConnection","ec2:RevokeSecurityGroupEgress","ec2:RevokeSecurityGroupIngress","ec2:RunInstances","ec2:StartInstances","ec2:StopInstances","ec2:TerminateInstances"],"Effect":"Allow","Resource":["*"]},{"Action":"s3:*","Effect":"Allow","Resource":["*"]},{"Action":["iam:GetAccessKeyLastUsed","iam:GetGroup*","iam:GetInstanceProfile","iam:GetLoginProfile","iam:GetOpenIDConnectProvider","iam:GetPolicy*","iam:GetRole*","iam:GetSAMLProvider","iam:GetSSHPublicKey","iam:GetServerCertificate","iam:GetServiceLastAccessed*","iam:GetUser*","iam:ListAccessKeys","iam:ListAttached*","iam:ListEntitiesForPolicy","iam:ListGroupPolicies","iam:ListGroupsForUser","iam:ListInstanceProfiles*","iam:ListMFADevices","iam:ListPolicyVersions","iam:ListRolePolicies","iam:ListSSHPublicKeys","iam:ListSigningCertificates","iam:ListUserPolicies","iam:Upload*"],"Effect":"Allow","Resource":["*"]},{"Action":["iam:GetRole","iam:ListRoles","iam:PassRole"],"Effect":"Allow","Resource":["arn:aws:iam::*:role/rds-monitoring-role","arn:aws:iam::*:role/ec2-sysadmin-*","arn:aws:iam::*:role/ecr-sysadmin-*","arn:aws:iam::*:role/lambda-sysadmin-*"]}],"Version":"2012-10-17"}
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_iam_group.SYSOPS
                    
                
            
        
     - 35
        
         - mode: managed
         - type: aws_iam_policy
         - name: admin
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:iam::969470234861:policy/Architect
                     - description: Architect policy
                     - id: arn:aws:iam::969470234861:policy/Architect
                     - name: Architect
                     - name_prefix: null
                     - path: /
                     - policy: {
                          "Version": "2012-10-17",
                          "Statement": [
                            {
                              "Action": "*",
                              "Effect": "Allow",
                              "Resource": "*"
                            }
                          ]
                        }
                        
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 36
        
         - mode: managed
         - type: aws_iam_policy_attachment
         - name: admin-attach
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - groups
                        
                        
                     - id: admin-attachment
                     - name: admin-attachment
                     - policy_arn: arn:aws:iam::969470234861:policy/Architect
                     - roles
                        
                        
                     - users
                        
                         - 0: skcc-sa
                        
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_iam_policy.admin
                     - 1: aws_iam_user.architect
                    
                
            
        
     - 37
        
         - mode: managed
         - type: aws_iam_role
         - name: dlm_lifecycle_role
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:iam::969470234861:role/dlm-lifecycle-role
                     - assume_role_policy: {"Version":"2012-10-17","Statement":[{"Sid":"","Effect":"Allow","Principal":{"Service":"dlm.amazonaws.com"},"Action":"sts:AssumeRole"}]}
                     - create_date: 2021-02-17T08:08:18Z
                     - description: 
                     - force_detach_policies: false
                     - id: dlm-lifecycle-role
                     - max_session_duration: 3600
                     - name: dlm-lifecycle-role
                     - name_prefix: null
                     - path: /
                     - permissions_boundary: null
                     - tags
                        
                        
                     - unique_id: AROA6DOHN2DWRCQKOU673
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 38
        
         - mode: managed
         - type: aws_iam_role_policy
         - name: dlm_lifecycle
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - id: dlm-lifecycle-role:dlm-lifecycle-policy
                     - name: dlm-lifecycle-policy
                     - name_prefix: null
                     - policy: {
                           "Version": "2012-10-17",
                           "Statement": [
                              {
                                 "Effect": "Allow",
                                 "Action": [
                                    "ec2:CreateSnapshot",
                                    "ec2:CreateSnapshots",
                                    "ec2:DeleteSnapshot",
                                    "ec2:DescribeInstances",
                                    "ec2:DescribeVolumes",
                                    "ec2:DescribeSnapshots"
                                 ],
                                 "Resource": "*"
                              },
                              {
                                 "Effect": "Allow",
                                 "Action": [
                                    "ec2:CreateTags"
                                 ],
                                 "Resource": "arn:aws:ec2:*::snapshot/*"
                              }
                           ]
                        }
                        
                     - role: dlm-lifecycle-role
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_iam_role.dlm_lifecycle_role
                    
                
            
        
     - 39
        
         - mode: managed
         - type: aws_iam_user
         - name: architect
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:iam::969470234861:user/skcc-sa
                     - force_destroy: false
                     - id: skcc-sa
                     - name: skcc-sa
                     - path: /
                     - permissions_boundary: null
                     - tags
                        
                         - company: SKCC
                        
                     - unique_id: AIDA6DOHN2DWYZ4OPB5QG
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 40
        
         - mode: managed
         - type: aws_iam_user
         - name: syc196561
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:iam::969470234861:user/syc196561
                     - force_destroy: false
                     - id: syc196561
                     - name: syc196561
                     - path: /
                     - permissions_boundary: null
                     - tags
                        
                         - Description: 이민숙
                         - company: Samyang
                        
                     - unique_id: AIDA6DOHN2DWV2KXBMGCT
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 41
        
         - mode: managed
         - type: aws_iam_user
         - name: syc197128
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:iam::969470234861:user/syc197128
                     - force_destroy: false
                     - id: syc197128
                     - name: syc197128
                     - path: /
                     - permissions_boundary: null
                     - tags
                        
                         - Description: 김범술
                         - company: Samyang
                        
                     - unique_id: AIDA6DOHN2DWTSIEH453C
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 42
        
         - mode: managed
         - type: aws_iam_user
         - name: syc218389
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:iam::969470234861:user/syc218389
                     - force_destroy: false
                     - id: syc218389
                     - name: syc218389
                     - path: /
                     - permissions_boundary: null
                     - tags
                        
                         - Description: 박훈
                         - company: Samsung
                        
                     - unique_id: AIDA6DOHN2DWQ3VQNMGPK
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 43
        
         - mode: managed
         - type: aws_iam_user
         - name: syc221025
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:iam::969470234861:user/syc221025
                     - force_destroy: false
                     - id: syc221025
                     - name: syc221025
                     - path: /
                     - permissions_boundary: null
                     - tags
                        
                         - Description: 백승훈
                         - company: Samsung
                        
                     - unique_id: AIDA6DOHN2DWU7TCDSCQS
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 44
        
         - mode: managed
         - type: aws_iam_user
         - name: syc719860
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:iam::969470234861:user/syc719860
                     - force_destroy: false
                     - id: syc719860
                     - name: syc719860
                     - path: /
                     - permissions_boundary: null
                     - tags
                        
                         - Description: 조원혁
                         - company: Samsung
                        
                     - unique_id: AIDA6DOHN2DWXAV3ANC6N
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 45
        
         - mode: managed
         - type: aws_iam_user
         - name: syc720059
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:iam::969470234861:user/syc720059
                     - force_destroy: false
                     - id: syc720059
                     - name: syc720059
                     - path: /
                     - permissions_boundary: null
                     - tags
                        
                         - Description: 김제호
                         - company: Samsung
                        
                     - unique_id: AIDA6DOHN2DW5J2I7L6CN
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 46
        
         - mode: managed
         - type: aws_iam_user_group_membership
         - name: syc196561
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - groups
                        
                         - 0: ARCHITECT
                         - 1: SECURITY
                         - 2: SYSOPS
                        
                     - id: terraform-20210218044855282500000003
                     - user: syc196561
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_iam_group.ARCHITECT
                     - 1: aws_iam_group.SECURITY
                     - 2: aws_iam_group.SYSOPS
                     - 3: aws_iam_user.syc196561
                    
                
            
        
     - 47
        
         - mode: managed
         - type: aws_iam_user_group_membership
         - name: syc197128
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - groups
                        
                         - 0: ARCHITECT
                         - 1: SYSOPS
                        
                     - id: terraform-20210218045457605500000003
                     - user: syc197128
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_iam_group.ARCHITECT
                     - 1: aws_iam_group.SYSOPS
                     - 2: aws_iam_user.syc197128
                    
                
            
        
     - 48
        
         - mode: managed
         - type: aws_iam_user_group_membership
         - name: syc218389
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - groups
                        
                         - 0: ARCHITECT
                         - 1: SECURITY
                         - 2: SYSOPS
                        
                     - id: terraform-20210218064454543500000001
                     - user: syc218389
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_iam_group.ARCHITECT
                     - 1: aws_iam_group.SECURITY
                     - 2: aws_iam_group.SYSOPS
                     - 3: aws_iam_user.syc218389
                    
                
            
        
     - 49
        
         - mode: managed
         - type: aws_iam_user_group_membership
         - name: syc221025
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - groups
                        
                         - 0: ARCHITECT
                         - 1: SECURITY
                         - 2: SYSOPS
                        
                     - id: terraform-20210218064454551200000002
                     - user: syc221025
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_iam_group.ARCHITECT
                     - 1: aws_iam_group.SECURITY
                     - 2: aws_iam_group.SYSOPS
                     - 3: aws_iam_user.syc221025
                    
                
            
        
     - 50
        
         - mode: managed
         - type: aws_iam_user_group_membership
         - name: syc719860
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - groups
                        
                         - 0: SYSOPS
                        
                     - id: terraform-20210218045457252400000002
                     - user: syc719860
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_iam_group.SYSOPS
                     - 1: aws_iam_user.syc719860
                    
                
            
        
     - 51
        
         - mode: managed
         - type: aws_iam_user_group_membership
         - name: syc720059
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - groups
                        
                         - 0: SYSOPS
                        
                     - id: terraform-20210218045457242600000001
                     - user: syc720059
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_iam_group.SYSOPS
                     - 1: aws_iam_user.syc720059
                    
                
            
        
     - 52
        
         - mode: managed
         - type: aws_instance
         - name: eaccapdev
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - ami: ami-0fc1ba861e48fc890
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:instance/i-01b4ea92cfa081f4e
                     - associate_public_ip_address: false
                     - availability_zone: ap-northeast-2a
                     - cpu_core_count: 2
                     - cpu_threads_per_core: 2
                     - credit_specification
                        
                        
                     - disable_api_termination: true
                     - ebs_block_device
                        
                         - 0
                            
                             - delete_on_termination: false
                             - device_name: /dev/sdb
                             - encrypted: false
                             - iops: 180
                             - kms_key_id: 
                             - snapshot_id: 
                             - tags
                                
                                 - Snapshot: true
                                
                             - throughput: 0
                             - volume_id: vol-0b6a8baefc36129f9
                             - volume_size: 60
                             - volume_type: gp2
                            
                        
                     - ebs_optimized: false
                     - enclave_options
                        
                         - 0
                            
                             - enabled: false
                            
                        
                     - ephemeral_block_device
                        
                        
                     - get_password_data: false
                     - hibernation: false
                     - host_id: null
                     - iam_instance_profile: 
                     - id: i-01b4ea92cfa081f4e
                     - instance_initiated_shutdown_behavior: null
                     - instance_state: running
                     - instance_type: m5.xlarge
                     - ipv6_address_count: 0
                     - ipv6_addresses
                        
                        
                     - key_name: samyangerp
                     - metadata_options
                        
                         - 0
                            
                             - http_endpoint: enabled
                             - http_put_response_hop_limit: 1
                             - http_tokens: optional
                            
                        
                     - monitoring: false
                     - network_interface
                        
                        
                     - outpost_arn: 
                     - password_data: 
                     - placement_group: 
                     - primary_network_interface_id: eni-0ac3362653b2aa812
                     - private_dns: ip-10-200-60-31.ap-northeast-2.compute.internal
                     - private_ip: 10.200.60.31
                     - public_dns: 
                     - public_ip: 
                     - root_block_device
                        
                         - 0
                            
                             - delete_on_termination: true
                             - device_name: /dev/sda1
                             - encrypted: false
                             - iops: 120
                             - kms_key_id: 
                             - tags
                                
                                
                             - throughput: 0
                             - volume_id: vol-033797e6334096a32
                             - volume_size: 40
                             - volume_type: gp2
                            
                        
                     - secondary_private_ips
                        
                        
                     - security_groups
                        
                        
                     - source_dest_check: true
                     - subnet_id: subnet-063aba40e559711f2
                     - tags
                        
                         - Description: 전자전표(AP)
                         - Environment: Dev
                         - Name: sy-eaccdev
                         - Schedule: samyang-office-hours
                         - cz-product: Non-SAP
                        
                     - tenancy: default
                     - timeouts: null
                     - user_data: null
                     - user_data_base64: null
                     - volume_tags: null
                     - vpc_security_group_ids
                        
                         - 0: sg-039273c8ae8f27646
                        
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMCwidXBkYXRlIjo2MDAwMDAwMDAwMDB9LCJzY2hlbWFfdmVyc2lvbiI6IjEifQ==
                 - dependencies
                    
                     - 0: aws_subnet.LEGADEV_A
                    
                
            
        
     - 53
        
         - mode: managed
         - type: aws_instance
         - name: eaccdb
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - ami: ami-0fc1ba861e48fc890
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:instance/i-01c1a85fdc39e3748
                     - associate_public_ip_address: false
                     - availability_zone: ap-northeast-2a
                     - cpu_core_count: 4
                     - cpu_threads_per_core: 2
                     - credit_specification
                        
                        
                     - disable_api_termination: true
                     - ebs_block_device
                        
                         - 0
                            
                             - delete_on_termination: false
                             - device_name: /dev/sdb
                             - encrypted: false
                             - iops: 300
                             - kms_key_id: 
                             - snapshot_id: 
                             - tags
                                
                                 - Snapshot: true
                                
                             - throughput: 0
                             - volume_id: vol-0be435649bddab716
                             - volume_size: 100
                             - volume_type: gp2
                            
                        
                     - ebs_optimized: false
                     - enclave_options
                        
                         - 0
                            
                             - enabled: false
                            
                        
                     - ephemeral_block_device
                        
                        
                     - get_password_data: false
                     - hibernation: false
                     - host_id: null
                     - iam_instance_profile: 
                     - id: i-01c1a85fdc39e3748
                     - instance_initiated_shutdown_behavior: null
                     - instance_state: running
                     - instance_type: m5.2xlarge
                     - ipv6_address_count: 0
                     - ipv6_addresses
                        
                        
                     - key_name: samyangerp
                     - metadata_options
                        
                         - 0
                            
                             - http_endpoint: enabled
                             - http_put_response_hop_limit: 1
                             - http_tokens: optional
                            
                        
                     - monitoring: false
                     - network_interface
                        
                        
                     - outpost_arn: 
                     - password_data: 
                     - placement_group: 
                     - primary_network_interface_id: eni-006f751a9369f25d2
                     - private_dns: ip-10-200-50-251.ap-northeast-2.compute.internal
                     - private_ip: 10.200.50.251
                     - public_dns: 
                     - public_ip: 
                     - root_block_device
                        
                         - 0
                            
                             - delete_on_termination: true
                             - device_name: /dev/sda1
                             - encrypted: false
                             - iops: 150
                             - kms_key_id: 
                             - tags
                                
                                
                             - throughput: 0
                             - volume_id: vol-0b21226671b4beb5d
                             - volume_size: 50
                             - volume_type: gp2
                            
                        
                     - secondary_private_ips
                        
                        
                     - security_groups
                        
                        
                     - source_dest_check: true
                     - subnet_id: subnet-062446f45fd20df78
                     - tags
                        
                         - Description: 전자전표(DB)
                         - Environment: Dev
                         - Name: sy-eaccdb
                         - Schedule: samyang-office-hours
                         - cz-product: Non-SAP
                        
                     - tenancy: default
                     - timeouts: null
                     - user_data: null
                     - user_data_base64: null
                     - volume_tags: null
                     - vpc_security_group_ids
                        
                         - 0: sg-09b1301f67000ee81
                        
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMCwidXBkYXRlIjo2MDAwMDAwMDAwMDB9LCJzY2hlbWFfdmVyc2lvbiI6IjEifQ==
                 - dependencies
                    
                     - 0: aws_subnet.LEGADMZ_A
                    
                
            
        
     - 54
        
         - mode: managed
         - type: aws_internet_gateway
         - name: gw
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:internet-gateway/igw-0019f239c338eb99f
                     - id: igw-0019f239c338eb99f
                     - owner_id: 969470234861
                     - tags
                        
                         - Name: samyang-igw
                        
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 55
        
         - mode: managed
         - type: aws_kms_key
         - name: kms
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:kms:ap-northeast-2:969470234861:key/84c657dc-06ff-4484-911d-9c6c82002709
                     - customer_master_key_spec: SYMMETRIC_DEFAULT
                     - deletion_window_in_days: null
                     - description: KMS key 1
                     - enable_key_rotation: false
                     - id: 84c657dc-06ff-4484-911d-9c6c82002709
                     - is_enabled: true
                     - key_id: 84c657dc-06ff-4484-911d-9c6c82002709
                     - key_usage: ENCRYPT_DECRYPT
                     - policy: {"Id":"key-default-1","Statement":[{"Action":"kms:*","Effect":"Allow","Principal":{"AWS":"arn:aws:iam::969470234861:root"},"Resource":"*","Sid":"Enable IAM User Permissions"}],"Version":"2012-10-17"}
                     - tags
                        
                        
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 56
        
         - mode: managed
         - type: aws_launch_configuration
         - name: sedap
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:autoscaling:ap-northeast-2:969470234861:launchConfiguration:f3b1acc3-0647-489f-bb0d-9524e67ddc40:launchConfigurationName/terraform-20210208154346788400000001
                     - associate_public_ip_address: false
                     - ebs_block_device
                        
                        
                     - ebs_optimized: false
                     - enable_monitoring: true
                     - ephemeral_block_device
                        
                        
                     - iam_instance_profile: 
                     - id: terraform-20210208154346788400000001
                     - image_id: ami-097fc5cd098dd20d5
                     - instance_type: m5.2xlarge
                     - key_name: test
                     - metadata_options
                        
                        
                     - name: terraform-20210208154346788400000001
                     - name_prefix: null
                     - placement_tenancy: null
                     - root_block_device
                        
                        
                     - security_groups
                        
                        
                     - spot_price: 
                     - user_data: null
                     - user_data_base64: null
                     - vpc_classic_link_id: 
                     - vpc_classic_link_security_groups
                        
                        
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - create_before_destroy: true
                
            
        
     - 57
        
         - mode: managed
         - type: aws_nat_gateway
         - name: nat_gw
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - allocation_id: eipalloc-017bf67bbba02c337
                     - id: nat-066b2a9d379b448cd
                     - network_interface_id: eni-0c490ebc2c7b21472
                     - private_ip: 10.200.0.109
                     - public_ip: 52.78.167.33
                     - subnet_id: subnet-03b15c93a2b2cb897
                     - tags
                        
                         - Name: samyang-NAT
                         - RT: public
                        
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_eip.nat_eip
                     - 1: aws_subnet.COMMON2_C
                     - 2: aws_vpc.vpc
                    
                
            
        
     - 58
        
         - mode: managed
         - type: aws_route_table
         - name: private_route
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - id: rtb-096e82b1b6757291f
                     - owner_id: 969470234861
                     - propagating_vgws
                        
                        
                     - route
                        
                         - 0
                            
                             - cidr_block: 0.0.0.0/0
                             - egress_only_gateway_id: 
                             - gateway_id: 
                             - instance_id: 
                             - ipv6_cidr_block: 
                             - local_gateway_id: 
                             - nat_gateway_id: nat-066b2a9d379b448cd
                             - network_interface_id: 
                             - transit_gateway_id: 
                             - vpc_endpoint_id: 
                             - vpc_peering_connection_id: 
                            
                         - 1
                            
                             - cidr_block: 10.100.0.0/16
                             - egress_only_gateway_id: 
                             - gateway_id: 
                             - instance_id: 
                             - ipv6_cidr_block: 
                             - local_gateway_id: 
                             - nat_gateway_id: 
                             - network_interface_id: 
                             - transit_gateway_id: 
                             - vpc_endpoint_id: 
                             - vpc_peering_connection_id: pcx-0d4ca24dc13ac71e1
                            
                         - 2
                            
                             - cidr_block: 130.1.0.0/16
                             - egress_only_gateway_id: 
                             - gateway_id: 
                             - instance_id: 
                             - ipv6_cidr_block: 
                             - local_gateway_id: 
                             - nat_gateway_id: 
                             - network_interface_id: 
                             - transit_gateway_id: tgw-0b9255b9254c08317
                             - vpc_endpoint_id: 
                             - vpc_peering_connection_id: 
                            
                        
                     - tags
                        
                         - Name: samyang-private-rt
                        
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_eip.nat_eip
                     - 2: aws_nat_gateway.nat_gw
                     - 3: aws_subnet.COMMON2_C
                     - 4: aws_vpc.vpc
                     - 5: aws_vpc_peering_connection.peering
                    
                
            
        
     - 59
        
         - mode: managed
         - type: aws_route_table
         - name: public_route
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - id: rtb-03fe521a7d79e3fce
                     - owner_id: 969470234861
                     - propagating_vgws
                        
                        
                     - route
                        
                         - 0
                            
                             - cidr_block: 0.0.0.0/0
                             - egress_only_gateway_id: 
                             - gateway_id: igw-0019f239c338eb99f
                             - instance_id: 
                             - ipv6_cidr_block: 
                             - local_gateway_id: 
                             - nat_gateway_id: 
                             - network_interface_id: 
                             - transit_gateway_id: 
                             - vpc_endpoint_id: 
                             - vpc_peering_connection_id: 
                            
                         - 1
                            
                             - cidr_block: 10.100.0.0/16
                             - egress_only_gateway_id: 
                             - gateway_id: 
                             - instance_id: 
                             - ipv6_cidr_block: 
                             - local_gateway_id: 
                             - nat_gateway_id: 
                             - network_interface_id: 
                             - transit_gateway_id: 
                             - vpc_endpoint_id: 
                             - vpc_peering_connection_id: pcx-0d4ca24dc13ac71e1
                            
                         - 2
                            
                             - cidr_block: 130.1.0.0/16
                             - egress_only_gateway_id: 
                             - gateway_id: 
                             - instance_id: 
                             - ipv6_cidr_block: 
                             - local_gateway_id: 
                             - nat_gateway_id: 
                             - network_interface_id: 
                             - transit_gateway_id: tgw-0b9255b9254c08317
                             - vpc_endpoint_id: 
                             - vpc_peering_connection_id: 
                            
                        
                     - tags
                        
                         - Name: samyang-public-rt
                        
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_internet_gateway.gw
                     - 2: aws_vpc.vpc
                     - 3: aws_vpc_peering_connection.peering
                    
                
            
        
     - 60
        
         - mode: managed
         - type: aws_route_table_association
         - name: private_rta
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - index_key: subnet-00280d3887f782614
                 - schema_version: 0
                 - attributes
                    
                     - gateway_id: null
                     - id: rtbassoc-0d494d2f3ecb0275a
                     - route_table_id: rtb-096e82b1b6757291f
                     - subnet_id: subnet-00280d3887f782614
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_eip.nat_eip
                     - 2: aws_nat_gateway.nat_gw
                     - 3: aws_route_table.private_route
                     - 4: aws_subnet.COMMON2_C
                     - 5: aws_vpc.vpc
                     - 6: aws_vpc_peering_connection.peering
                     - 7: data.aws_subnet_ids.private
                    
                
             - 1
                
                 - index_key: subnet-00817db828487ad50
                 - schema_version: 0
                 - attributes
                    
                     - gateway_id: null
                     - id: rtbassoc-04bc3dabbcdba6f87
                     - route_table_id: rtb-096e82b1b6757291f
                     - subnet_id: subnet-00817db828487ad50
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_eip.nat_eip
                     - 2: aws_nat_gateway.nat_gw
                     - 3: aws_route_table.private_route
                     - 4: aws_subnet.COMMON2_C
                     - 5: aws_vpc.vpc
                     - 6: aws_vpc_peering_connection.peering
                     - 7: data.aws_subnet_ids.private
                    
                
             - 2
                
                 - index_key: subnet-00dacef89f1e93aca
                 - schema_version: 0
                 - attributes
                    
                     - gateway_id: null
                     - id: rtbassoc-01bcd6817e30f3881
                     - route_table_id: rtb-096e82b1b6757291f
                     - subnet_id: subnet-00dacef89f1e93aca
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_eip.nat_eip
                     - 2: aws_nat_gateway.nat_gw
                     - 3: aws_route_table.private_route
                     - 4: aws_subnet.COMMON2_C
                     - 5: aws_vpc.vpc
                     - 6: aws_vpc_peering_connection.peering
                     - 7: data.aws_subnet_ids.private
                    
                
             - 3
                
                 - index_key: subnet-014cb9765b303b464
                 - schema_version: 0
                 - attributes
                    
                     - gateway_id: null
                     - id: rtbassoc-0a7ea541df4a91b13
                     - route_table_id: rtb-096e82b1b6757291f
                     - subnet_id: subnet-014cb9765b303b464
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_eip.nat_eip
                     - 2: aws_nat_gateway.nat_gw
                     - 3: aws_route_table.private_route
                     - 4: aws_subnet.COMMON2_C
                     - 5: aws_vpc.vpc
                     - 6: aws_vpc_peering_connection.peering
                     - 7: data.aws_subnet_ids.private
                    
                
             - 4
                
                 - index_key: subnet-052acb88931aa28cf
                 - schema_version: 0
                 - attributes
                    
                     - gateway_id: null
                     - id: rtbassoc-0c4ad41b8cdaecdb7
                     - route_table_id: rtb-096e82b1b6757291f
                     - subnet_id: subnet-052acb88931aa28cf
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_eip.nat_eip
                     - 2: aws_nat_gateway.nat_gw
                     - 3: aws_route_table.private_route
                     - 4: aws_subnet.COMMON2_C
                     - 5: aws_vpc.vpc
                     - 6: aws_vpc_peering_connection.peering
                     - 7: data.aws_subnet_ids.private
                    
                
             - 5
                
                 - index_key: subnet-062446f45fd20df78
                 - schema_version: 0
                 - attributes
                    
                     - gateway_id: null
                     - id: rtbassoc-04d4f30e3e053b099
                     - route_table_id: rtb-096e82b1b6757291f
                     - subnet_id: subnet-062446f45fd20df78
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_eip.nat_eip
                     - 2: aws_nat_gateway.nat_gw
                     - 3: aws_route_table.private_route
                     - 4: aws_subnet.COMMON2_C
                     - 5: aws_vpc.vpc
                     - 6: aws_vpc_peering_connection.peering
                     - 7: data.aws_subnet_ids.private
                    
                
             - 6
                
                 - index_key: subnet-063aba40e559711f2
                 - schema_version: 0
                 - attributes
                    
                     - gateway_id: null
                     - id: rtbassoc-003973d0eb994bfdc
                     - route_table_id: rtb-096e82b1b6757291f
                     - subnet_id: subnet-063aba40e559711f2
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_eip.nat_eip
                     - 2: aws_nat_gateway.nat_gw
                     - 3: aws_route_table.private_route
                     - 4: aws_subnet.COMMON2_C
                     - 5: aws_vpc.vpc
                     - 6: aws_vpc_peering_connection.peering
                     - 7: data.aws_subnet_ids.private
                    
                
             - 7
                
                 - index_key: subnet-0665f9f4846e3a227
                 - schema_version: 0
                 - attributes
                    
                     - gateway_id: null
                     - id: rtbassoc-0017b7a43e41193dc
                     - route_table_id: rtb-096e82b1b6757291f
                     - subnet_id: subnet-0665f9f4846e3a227
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_eip.nat_eip
                     - 2: aws_nat_gateway.nat_gw
                     - 3: aws_route_table.private_route
                     - 4: aws_subnet.COMMON2_C
                     - 5: aws_vpc.vpc
                     - 6: aws_vpc_peering_connection.peering
                     - 7: data.aws_subnet_ids.private
                    
                
             - 8
                
                 - index_key: subnet-0ab6c4f1421f2d1ed
                 - schema_version: 0
                 - attributes
                    
                     - gateway_id: null
                     - id: rtbassoc-08c6fb627340d9648
                     - route_table_id: rtb-096e82b1b6757291f
                     - subnet_id: subnet-0ab6c4f1421f2d1ed
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_eip.nat_eip
                     - 2: aws_nat_gateway.nat_gw
                     - 3: aws_route_table.private_route
                     - 4: aws_subnet.COMMON2_C
                     - 5: aws_vpc.vpc
                     - 6: aws_vpc_peering_connection.peering
                     - 7: data.aws_subnet_ids.private
                    
                
             - 9
                
                 - index_key: subnet-0bbed088ce4609440
                 - schema_version: 0
                 - attributes
                    
                     - gateway_id: null
                     - id: rtbassoc-0fe80e9697e6f9619
                     - route_table_id: rtb-096e82b1b6757291f
                     - subnet_id: subnet-0bbed088ce4609440
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_eip.nat_eip
                     - 2: aws_nat_gateway.nat_gw
                     - 3: aws_route_table.private_route
                     - 4: aws_subnet.COMMON2_C
                     - 5: aws_vpc.vpc
                     - 6: aws_vpc_peering_connection.peering
                     - 7: data.aws_subnet_ids.private
                    
                
             - 10
                
                 - index_key: subnet-0bdef5652db079b1f
                 - schema_version: 0
                 - attributes
                    
                     - gateway_id: null
                     - id: rtbassoc-06a050619c5aa2bfd
                     - route_table_id: rtb-096e82b1b6757291f
                     - subnet_id: subnet-0bdef5652db079b1f
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_eip.nat_eip
                     - 2: aws_nat_gateway.nat_gw
                     - 3: aws_route_table.private_route
                     - 4: aws_subnet.COMMON2_C
                     - 5: aws_vpc.vpc
                     - 6: aws_vpc_peering_connection.peering
                     - 7: data.aws_subnet_ids.private
                    
                
             - 11
                
                 - index_key: subnet-0e8f608f825ce4f27
                 - schema_version: 0
                 - attributes
                    
                     - gateway_id: null
                     - id: rtbassoc-0bf5d00ebd956e586
                     - route_table_id: rtb-096e82b1b6757291f
                     - subnet_id: subnet-0e8f608f825ce4f27
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_eip.nat_eip
                     - 2: aws_nat_gateway.nat_gw
                     - 3: aws_route_table.private_route
                     - 4: aws_subnet.COMMON2_C
                     - 5: aws_vpc.vpc
                     - 6: aws_vpc_peering_connection.peering
                     - 7: data.aws_subnet_ids.private
                    
                
             - 12
                
                 - index_key: subnet-0fbb4d36765952735
                 - schema_version: 0
                 - attributes
                    
                     - gateway_id: null
                     - id: rtbassoc-0dae609b7e36bee32
                     - route_table_id: rtb-096e82b1b6757291f
                     - subnet_id: subnet-0fbb4d36765952735
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_eip.nat_eip
                     - 2: aws_nat_gateway.nat_gw
                     - 3: aws_route_table.private_route
                     - 4: aws_subnet.COMMON2_C
                     - 5: aws_vpc.vpc
                     - 6: aws_vpc_peering_connection.peering
                     - 7: data.aws_subnet_ids.private
                    
                
            
        
     - 61
        
         - mode: managed
         - type: aws_route_table_association
         - name: public_rta
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - index_key: subnet-0312c7e5c759250b2
                 - schema_version: 0
                 - attributes
                    
                     - gateway_id: null
                     - id: rtbassoc-0c821e8b8b54b0159
                     - route_table_id: rtb-03fe521a7d79e3fce
                     - subnet_id: subnet-0312c7e5c759250b2
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_internet_gateway.gw
                     - 2: aws_route_table.public_route
                     - 3: aws_vpc.vpc
                     - 4: aws_vpc_peering_connection.peering
                     - 5: data.aws_subnet_ids.public
                    
                
             - 1
                
                 - index_key: subnet-03b15c93a2b2cb897
                 - schema_version: 0
                 - attributes
                    
                     - gateway_id: null
                     - id: rtbassoc-0e4e4bcf8dae77a30
                     - route_table_id: rtb-03fe521a7d79e3fce
                     - subnet_id: subnet-03b15c93a2b2cb897
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ec2_transit_gateway.tgw
                     - 1: aws_internet_gateway.gw
                     - 2: aws_route_table.public_route
                     - 3: aws_vpc.vpc
                     - 4: aws_vpc_peering_connection.peering
                     - 5: data.aws_subnet_ids.public
                    
                
            
        
     - 62
        
         - mode: managed
         - type: aws_s3_bucket
         - name: cloudtrailucket
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - acceleration_status: 
                     - acl: private
                     - arn: arn:aws:s3:::samyang-cloudtrail-bucket
                     - bucket: samyang-cloudtrail-bucket
                     - bucket_domain_name: samyang-cloudtrail-bucket.s3.amazonaws.com
                     - bucket_prefix: null
                     - bucket_regional_domain_name: samyang-cloudtrail-bucket.s3.ap-northeast-2.amazonaws.com
                     - cors_rule
                        
                        
                     - force_destroy: true
                     - grant
                        
                        
                     - hosted_zone_id: Z3W03O7B5YMIYP
                     - id: samyang-cloudtrail-bucket
                     - lifecycle_rule
                        
                        
                     - logging
                        
                        
                     - object_lock_configuration
                        
                        
                     - policy: {"Statement":[{"Action":"s3:GetBucketAcl","Effect":"Allow","Principal":{"Service":"cloudtrail.amazonaws.com"},"Resource":"arn:aws:s3:::samyang-cloudtrail-bucket","Sid":"AWSCloudTrailAclCheck"},{"Action":"s3:PutObject","Condition":{"StringEquals":{"s3:x-amz-acl":"bucket-owner-full-control"}},"Effect":"Allow","Principal":{"Service":"cloudtrail.amazonaws.com"},"Resource":"arn:aws:s3:::samyang-cloudtrail-bucket/prefix/AWSLogs/*","Sid":"AWSCloudTrailWrite"}],"Version":"2012-10-17"}
                     - region: ap-northeast-2
                     - replication_configuration
                        
                        
                     - request_payer: BucketOwner
                     - server_side_encryption_configuration
                        
                        
                     - tags
                        
                         - Environment: Prd
                         - Name: samyang-bucket
                        
                     - versioning
                        
                         - 0
                            
                             - enabled: false
                             - mfa_delete: false
                            
                        
                     - website
                        
                        
                     - website_domain: null
                     - website_endpoint: null
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 63
        
         - mode: managed
         - type: aws_security_group
         - name: allow_from_trust_to_ap
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:security-group/sg-0cfa3e9b507fc0295
                     - description: Allow inbound traffic
                     - egress
                        
                         - 0
                            
                             - cidr_blocks
                                
                                 - 0: 0.0.0.0/0
                                
                             - description: 
                             - from_port: 0
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: -1
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 0
                            
                        
                     - id: sg-0cfa3e9b507fc0295
                     - ingress
                        
                         - 0
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: Host agent access
                             - from_port: 1128
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 1129
                            
                         - 1
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: Host agent access
                             - from_port: 443
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 443
                            
                         - 2
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: Host agent access
                             - from_port: 80
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 80
                            
                         - 3
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 22
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 22
                            
                         - 4
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 30000
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 39999
                            
                         - 5
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 3200
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 3299
                            
                         - 6
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 3300
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 3399
                            
                         - 7
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 3600
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 3699
                            
                         - 8
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 4237
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 4237
                            
                         - 9
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 4300
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 4399
                            
                         - 10
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 4900
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 4999
                            
                         - 11
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 50000
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 59999
                            
                         - 12
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 8000
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 8999
                            
                        
                     - name: allow_traffic_s4h_ap
                     - name_prefix: 
                     - owner_id: 969470234861
                     - revoke_rules_on_delete: false
                     - tags
                        
                         - Name: allow_from_trust_to_ap
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6NjAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 64
        
         - mode: managed
         - type: aws_security_group
         - name: allow_from_trust_to_db
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:security-group/sg-074a49128f52360f6
                     - description: Allow inbound traffic
                     - egress
                        
                         - 0
                            
                             - cidr_blocks
                                
                                 - 0: 0.0.0.0/0
                                
                             - description: 
                             - from_port: 0
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: -1
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 0
                            
                        
                     - id: sg-074a49128f52360f6
                     - ingress
                        
                         - 0
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: Host agent access
                             - from_port: 1128
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 1129
                            
                         - 1
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: Host agent access
                             - from_port: 443
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 443
                            
                         - 2
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: Host agent access
                             - from_port: 80
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 80
                            
                         - 3
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 22
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 22
                            
                         - 4
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 30000
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 39999
                            
                         - 5
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 3200
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 3299
                            
                         - 6
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 3300
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 3399
                            
                         - 7
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 3600
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 3699
                            
                         - 8
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 4237
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 4237
                            
                         - 9
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 4300
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 4399
                            
                         - 10
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 4900
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 4999
                            
                         - 11
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 50000
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 59999
                            
                         - 12
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 8000
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 8999
                            
                        
                     - name: allow_traffic_s4h_db
                     - name_prefix: 
                     - owner_id: 969470234861
                     - revoke_rules_on_delete: false
                     - tags
                        
                         - Name: allow_from_trust_to_db
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6NjAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 65
        
         - mode: managed
         - type: aws_security_group
         - name: allow_from_trust_to_eaccap
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:security-group/sg-039273c8ae8f27646
                     - description: Allow inbound traffic
                     - egress
                        
                         - 0
                            
                             - cidr_blocks
                                
                                 - 0: 0.0.0.0/0
                                
                             - description: 
                             - from_port: 0
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: -1
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 0
                            
                        
                     - id: sg-039273c8ae8f27646
                     - ingress
                        
                         - 0
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: RDP from On-Prem
                             - from_port: 3389
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 3389
                            
                        
                     - name: allow_traffic_eaccap
                     - name_prefix: 
                     - owner_id: 969470234861
                     - revoke_rules_on_delete: false
                     - tags
                        
                         - Name: allow_from_trust_to_eaccdev
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6NjAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 66
        
         - mode: managed
         - type: aws_security_group
         - name: allow_from_trust_to_eaccdb
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:security-group/sg-09b1301f67000ee81
                     - description: Allow inbound traffic
                     - egress
                        
                         - 0
                            
                             - cidr_blocks
                                
                                 - 0: 0.0.0.0/0
                                
                             - description: 
                             - from_port: 0
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: -1
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 0
                            
                        
                     - id: sg-09b1301f67000ee81
                     - ingress
                        
                         - 0
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: RDP from On-Prem
                             - from_port: 3389
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 3389
                            
                        
                     - name: allow_traffic_eaccdb
                     - name_prefix: 
                     - owner_id: 969470234861
                     - revoke_rules_on_delete: false
                     - tags
                        
                         - Name: allow_from_trust_to_eaccdev
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6NjAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 67
        
         - mode: managed
         - type: aws_security_group
         - name: allow_from_trust_to_po
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:security-group/sg-0c05f4efd878a93c9
                     - description: Allow inbound traffic
                     - egress
                        
                         - 0
                            
                             - cidr_blocks
                                
                                 - 0: 0.0.0.0/0
                                
                             - description: 
                             - from_port: 0
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: -1
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 0
                            
                        
                     - id: sg-0c05f4efd878a93c9
                     - ingress
                        
                         - 0
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: Host agent access
                             - from_port: 1128
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 1129
                            
                         - 1
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: Host agent access
                             - from_port: 443
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 443
                            
                         - 2
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: Host agent access
                             - from_port: 80
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 80
                            
                         - 3
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 22
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 22
                            
                         - 4
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 30000
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 39999
                            
                         - 5
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 3200
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 3299
                            
                         - 6
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 3300
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 3399
                            
                         - 7
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 3600
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 3699
                            
                         - 8
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 4237
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 4237
                            
                         - 9
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 4300
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 4399
                            
                         - 10
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 4900
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 4999
                            
                         - 11
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 50000
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 59999
                            
                         - 12
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                 - 1: 10.200.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 8000
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 8199
                            
                        
                     - name: allow_traffic_s4h_po
                     - name_prefix: 
                     - owner_id: 969470234861
                     - revoke_rules_on_delete: false
                     - tags
                        
                         - Name: allow_from_trust_to_po
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6NjAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 68
        
         - mode: managed
         - type: aws_security_group
         - name: allow_ssh_from_vpn
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:security-group/sg-00fa9004cca8fa914
                     - description: Allow SSH inbound traffic
                     - egress
                        
                         - 0
                            
                             - cidr_blocks
                                
                                 - 0: 0.0.0.0/0
                                
                             - description: 
                             - from_port: 0
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: -1
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 0
                            
                        
                     - id: sg-00fa9004cca8fa914
                     - ingress
                        
                         - 0
                            
                             - cidr_blocks
                                
                                 - 0: 130.1.0.0/16
                                
                             - description: SSH from On-Prem
                             - from_port: 22
                             - ipv6_cidr_blocks
                                
                                
                             - prefix_list_ids
                                
                                
                             - protocol: tcp
                             - security_groups
                                
                                
                             - self: false
                             - to_port: 22
                            
                        
                     - name: allow_ssh
                     - name_prefix: 
                     - owner_id: 969470234861
                     - revoke_rules_on_delete: false
                     - tags
                        
                         - Name: allow_ssh
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6NjAwMDAwMDAwMDAwfSwic2NoZW1hX3ZlcnNpb24iOiIxIn0=
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 69
        
         - mode: managed
         - type: aws_subnet
         - name: COMMON1_A
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:subnet/subnet-0312c7e5c759250b2
                     - assign_ipv6_address_on_creation: false
                     - availability_zone: ap-northeast-2a
                     - availability_zone_id: apne2-az1
                     - cidr_block: 10.200.0.0/26
                     - customer_owned_ipv4_pool: 
                     - id: subnet-0312c7e5c759250b2
                     - ipv6_cidr_block: 
                     - ipv6_cidr_block_association_id: 
                     - map_customer_owned_ip_on_launch: false
                     - map_public_ip_on_launch: false
                     - outpost_arn: 
                     - owner_id: 969470234861
                     - tags
                        
                         - Enviroment: PRD_NW
                         - Name: COMMON1_A
                         - RT: public
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 70
        
         - mode: managed
         - type: aws_subnet
         - name: COMMON2_C
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:subnet/subnet-03b15c93a2b2cb897
                     - assign_ipv6_address_on_creation: false
                     - availability_zone: ap-northeast-2c
                     - availability_zone_id: apne2-az3
                     - cidr_block: 10.200.0.64/26
                     - customer_owned_ipv4_pool: 
                     - id: subnet-03b15c93a2b2cb897
                     - ipv6_cidr_block: 
                     - ipv6_cidr_block_association_id: 
                     - map_customer_owned_ip_on_launch: false
                     - map_public_ip_on_launch: false
                     - outpost_arn: 
                     - owner_id: 969470234861
                     - tags
                        
                         - Enviroment: PRD_NW
                         - Name: COMMON2_C
                         - RT: public
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 71
        
         - mode: managed
         - type: aws_subnet
         - name: INTERNAL1_A
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:subnet/subnet-0ab6c4f1421f2d1ed
                     - assign_ipv6_address_on_creation: false
                     - availability_zone: ap-northeast-2a
                     - availability_zone_id: apne2-az1
                     - cidr_block: 10.200.0.192/28
                     - customer_owned_ipv4_pool: 
                     - id: subnet-0ab6c4f1421f2d1ed
                     - ipv6_cidr_block: 
                     - ipv6_cidr_block_association_id: 
                     - map_customer_owned_ip_on_launch: false
                     - map_public_ip_on_launch: false
                     - outpost_arn: 
                     - owner_id: 969470234861
                     - tags
                        
                         - Enviroment: PRD_NW
                         - Name: INTERNAL1_A
                         - RT: private
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 72
        
         - mode: managed
         - type: aws_subnet
         - name: INTERNAL2_C
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:subnet/subnet-0bbed088ce4609440
                     - assign_ipv6_address_on_creation: false
                     - availability_zone: ap-northeast-2c
                     - availability_zone_id: apne2-az3
                     - cidr_block: 10.200.0.208/28
                     - customer_owned_ipv4_pool: 
                     - id: subnet-0bbed088ce4609440
                     - ipv6_cidr_block: 
                     - ipv6_cidr_block_association_id: 
                     - map_customer_owned_ip_on_launch: false
                     - map_public_ip_on_launch: false
                     - outpost_arn: 
                     - owner_id: 969470234861
                     - tags
                        
                         - Enviroment: PRD_NW
                         - Name: INTERNAL2_C
                         - RT: private
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 73
        
         - mode: managed
         - type: aws_subnet
         - name: LEGAAP1_A
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:subnet/subnet-0fbb4d36765952735
                     - assign_ipv6_address_on_creation: false
                     - availability_zone: ap-northeast-2a
                     - availability_zone_id: apne2-az1
                     - cidr_block: 10.200.50.0/25
                     - customer_owned_ipv4_pool: 
                     - id: subnet-0fbb4d36765952735
                     - ipv6_cidr_block: 
                     - ipv6_cidr_block_association_id: 
                     - map_customer_owned_ip_on_launch: false
                     - map_public_ip_on_launch: false
                     - outpost_arn: 
                     - owner_id: 969470234861
                     - tags
                        
                         - Enviroment: PRD
                         - Name: LEGAAP1_A
                         - RT: private
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 74
        
         - mode: managed
         - type: aws_subnet
         - name: LEGADB1_A
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:subnet/subnet-0e8f608f825ce4f27
                     - assign_ipv6_address_on_creation: false
                     - availability_zone: ap-northeast-2a
                     - availability_zone_id: apne2-az1
                     - cidr_block: 10.200.40.0/25
                     - customer_owned_ipv4_pool: 
                     - id: subnet-0e8f608f825ce4f27
                     - ipv6_cidr_block: 
                     - ipv6_cidr_block_association_id: 
                     - map_customer_owned_ip_on_launch: false
                     - map_public_ip_on_launch: false
                     - outpost_arn: 
                     - owner_id: 969470234861
                     - tags
                        
                         - Enviroment: PRD
                         - Name: LEGADB1_A
                         - RT: private
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 75
        
         - mode: managed
         - type: aws_subnet
         - name: LEGADEV_A
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:subnet/subnet-063aba40e559711f2
                     - assign_ipv6_address_on_creation: false
                     - availability_zone: ap-northeast-2a
                     - availability_zone_id: apne2-az1
                     - cidr_block: 10.200.60.0/26
                     - customer_owned_ipv4_pool: 
                     - id: subnet-063aba40e559711f2
                     - ipv6_cidr_block: 
                     - ipv6_cidr_block_association_id: 
                     - map_customer_owned_ip_on_launch: false
                     - map_public_ip_on_launch: false
                     - outpost_arn: 
                     - owner_id: 969470234861
                     - tags
                        
                         - Enviroment: DEV
                         - Name: LEGADEV_A
                         - RT: private
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 76
        
         - mode: managed
         - type: aws_subnet
         - name: LEGADMZ_A
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:subnet/subnet-062446f45fd20df78
                     - assign_ipv6_address_on_creation: false
                     - availability_zone: ap-northeast-2a
                     - availability_zone_id: apne2-az1
                     - cidr_block: 10.200.50.240/28
                     - customer_owned_ipv4_pool: 
                     - id: subnet-062446f45fd20df78
                     - ipv6_cidr_block: 
                     - ipv6_cidr_block_association_id: 
                     - map_customer_owned_ip_on_launch: false
                     - map_public_ip_on_launch: false
                     - outpost_arn: 
                     - owner_id: 969470234861
                     - tags
                        
                         - Enviroment: PRD
                         - Name: LEGADMZ_A
                         - RT: private
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 77
        
         - mode: managed
         - type: aws_subnet
         - name: NAS1_A
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:subnet/subnet-00280d3887f782614
                     - assign_ipv6_address_on_creation: false
                     - availability_zone: ap-northeast-2a
                     - availability_zone_id: apne2-az1
                     - cidr_block: 10.200.0.128/27
                     - customer_owned_ipv4_pool: 
                     - id: subnet-00280d3887f782614
                     - ipv6_cidr_block: 
                     - ipv6_cidr_block_association_id: 
                     - map_customer_owned_ip_on_launch: false
                     - map_public_ip_on_launch: false
                     - outpost_arn: 
                     - owner_id: 969470234861
                     - tags
                        
                         - Enviroment: PRD_NW
                         - Name: NAS1_A
                         - RT: private
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 78
        
         - mode: managed
         - type: aws_subnet
         - name: NAS2_C
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:subnet/subnet-052acb88931aa28cf
                     - assign_ipv6_address_on_creation: false
                     - availability_zone: ap-northeast-2c
                     - availability_zone_id: apne2-az3
                     - cidr_block: 10.200.11.160/27
                     - customer_owned_ipv4_pool: 
                     - id: subnet-052acb88931aa28cf
                     - ipv6_cidr_block: 
                     - ipv6_cidr_block_association_id: 
                     - map_customer_owned_ip_on_launch: false
                     - map_public_ip_on_launch: false
                     - outpost_arn: 
                     - owner_id: 969470234861
                     - tags
                        
                         - Enviroment: PRD_NW
                         - Name: NAS2_C
                         - RT: private
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 79
        
         - mode: managed
         - type: aws_subnet
         - name: SAPAP1_A
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:subnet/subnet-0665f9f4846e3a227
                     - assign_ipv6_address_on_creation: false
                     - availability_zone: ap-northeast-2a
                     - availability_zone_id: apne2-az1
                     - cidr_block: 10.200.20.0/26
                     - customer_owned_ipv4_pool: 
                     - id: subnet-0665f9f4846e3a227
                     - ipv6_cidr_block: 
                     - ipv6_cidr_block_association_id: 
                     - map_customer_owned_ip_on_launch: false
                     - map_public_ip_on_launch: false
                     - outpost_arn: 
                     - owner_id: 969470234861
                     - tags
                        
                         - Enviroment: PRD
                         - Name: SAPAP1_A
                         - RT: private
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 80
        
         - mode: managed
         - type: aws_subnet
         - name: SAPAP2_C
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:subnet/subnet-00dacef89f1e93aca
                     - assign_ipv6_address_on_creation: false
                     - availability_zone: ap-northeast-2c
                     - availability_zone_id: apne2-az3
                     - cidr_block: 10.200.21.0/26
                     - customer_owned_ipv4_pool: 
                     - id: subnet-00dacef89f1e93aca
                     - ipv6_cidr_block: 
                     - ipv6_cidr_block_association_id: 
                     - map_customer_owned_ip_on_launch: false
                     - map_public_ip_on_launch: false
                     - outpost_arn: 
                     - owner_id: 969470234861
                     - tags
                        
                         - Enviroment: PRD
                         - Name: SAPAP2_C
                         - RT: private
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 81
        
         - mode: managed
         - type: aws_subnet
         - name: SAPDB1_A
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:subnet/subnet-0bdef5652db079b1f
                     - assign_ipv6_address_on_creation: false
                     - availability_zone: ap-northeast-2a
                     - availability_zone_id: apne2-az1
                     - cidr_block: 10.200.10.0/26
                     - customer_owned_ipv4_pool: 
                     - id: subnet-0bdef5652db079b1f
                     - ipv6_cidr_block: 
                     - ipv6_cidr_block_association_id: 
                     - map_customer_owned_ip_on_launch: false
                     - map_public_ip_on_launch: false
                     - outpost_arn: 
                     - owner_id: 969470234861
                     - tags
                        
                         - Enviroment: PRD
                         - Name: SAPDB1_A
                         - RT: private
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 82
        
         - mode: managed
         - type: aws_subnet
         - name: SAPDB2_C
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:subnet/subnet-014cb9765b303b464
                     - assign_ipv6_address_on_creation: false
                     - availability_zone: ap-northeast-2c
                     - availability_zone_id: apne2-az3
                     - cidr_block: 10.200.11.0/26
                     - customer_owned_ipv4_pool: 
                     - id: subnet-014cb9765b303b464
                     - ipv6_cidr_block: 
                     - ipv6_cidr_block_association_id: 
                     - map_customer_owned_ip_on_launch: false
                     - map_public_ip_on_launch: false
                     - outpost_arn: 
                     - owner_id: 969470234861
                     - tags
                        
                         - Enviroment: PRD
                         - Name: SAPDB2_C
                         - RT: private
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 83
        
         - mode: managed
         - type: aws_subnet
         - name: SAPDEV_A
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:subnet/subnet-00817db828487ad50
                     - assign_ipv6_address_on_creation: false
                     - availability_zone: ap-northeast-2a
                     - availability_zone_id: apne2-az1
                     - cidr_block: 10.200.30.0/26
                     - customer_owned_ipv4_pool: 
                     - id: subnet-00817db828487ad50
                     - ipv6_cidr_block: 
                     - ipv6_cidr_block_association_id: 
                     - map_customer_owned_ip_on_launch: false
                     - map_public_ip_on_launch: false
                     - outpost_arn: 
                     - owner_id: 969470234861
                     - tags
                        
                         - Enviroment: DEV
                         - Name: SAPDEV_A
                         - RT: private
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMDAsImRlbGV0ZSI6MTIwMDAwMDAwMDAwMH0sInNjaGVtYV92ZXJzaW9uIjoiMSJ9
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 84
        
         - mode: managed
         - type: aws_volume_attachment
         - name: eaccapdev_att
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - device_name: /dev/sdb
                     - force_detach: null
                     - id: vai-743358189
                     - instance_id: i-01b4ea92cfa081f4e
                     - skip_destroy: null
                     - volume_id: vol-0b6a8baefc36129f9
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ebs_volume.eaccapdev_add
                     - 1: aws_instance.eaccapdev
                     - 2: aws_subnet.LEGADEV_A
                     - 3: aws_vpc.vpc
                    
                
            
        
     - 85
        
         - mode: managed
         - type: aws_volume_attachment
         - name: eaccdb_att
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - device_name: /dev/sdb
                     - force_detach: null
                     - id: vai-1685267644
                     - instance_id: i-01c1a85fdc39e3748
                     - skip_destroy: null
                     - volume_id: vol-0be435649bddab716
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_ebs_volume.eaccdb_add
                     - 1: aws_instance.eaccdb
                     - 2: aws_subnet.LEGADMZ_A
                     - 3: aws_vpc.vpc
                    
                
            
        
     - 86
        
         - mode: managed
         - type: aws_vpc
         - name: vpc
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 1
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:vpc/vpc-02c522ba58ca5f742
                     - assign_generated_ipv6_cidr_block: false
                     - cidr_block: 10.200.0.0/16
                     - default_network_acl_id: acl-096f917323b84a5fa
                     - default_route_table_id: rtb-0cce0b4f03ced5f26
                     - default_security_group_id: sg-0b74c9424e4dba1f9
                     - dhcp_options_id: dopt-01d7bf367afb59552
                     - enable_classiclink: null
                     - enable_classiclink_dns_support: null
                     - enable_dns_hostnames: true
                     - enable_dns_support: true
                     - id: vpc-02c522ba58ca5f742
                     - instance_tenancy: default
                     - ipv6_association_id: 
                     - ipv6_cidr_block: 
                     - main_route_table_id: rtb-0cce0b4f03ced5f26
                     - owner_id: 969470234861
                     - tags
                        
                         - Name: samyang-vpc
                        
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJzY2hlbWFfdmVyc2lvbiI6IjEifQ==
                
            
        
     - 87
        
         - mode: managed
         - type: aws_vpc_dhcp_options
         - name: dhcp_option_set
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:dhcp-options/dopt-01d7bf367afb59552
                     - domain_name: sy.com
                     - domain_name_servers
                        
                         - 0: 130.1.22.21
                         - 1: 130.1.22.30
                        
                     - id: dopt-01d7bf367afb59552
                     - netbios_name_servers
                        
                         - 0: 130.1.22.21
                         - 1: 130.1.22.30
                        
                     - netbios_node_type: null
                     - ntp_servers: null
                     - owner_id: 969470234861
                     - tags
                        
                         - Name: samyang-dhcp-option-set
                        
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                
            
        
     - 88
        
         - mode: managed
         - type: aws_vpc_dhcp_options_association
         - name: dhcp_vpc
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - dhcp_options_id: dopt-01d7bf367afb59552
                     - id: dopt-01d7bf367afb59552-vpc-02c522ba58ca5f742
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                     - 1: aws_vpc_dhcp_options.dhcp_option_set
                    
                
            
        
     - 89
        
         - mode: managed
         - type: aws_vpc_peering_connection
         - name: peering
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - accept_status: active
                     - accepter
                        
                        
                     - auto_accept: null
                     - id: pcx-0d4ca24dc13ac71e1
                     - peer_owner_id: 036491913501
                     - peer_region: ap-northeast-2
                     - peer_vpc_id: vpc-08029084c4e1f5546
                     - requester
                        
                         - 0
                            
                             - allow_classic_link_to_remote_vpc: false
                             - allow_remote_vpc_dns_resolution: false
                             - allow_vpc_to_remote_classic_link: false
                            
                        
                     - tags
                        
                        
                     - timeouts: null
                     - vpc_id: vpc-02c522ba58ca5f742
                    
                 - sensitive_attributes
                    
                    
                 - private: eyJlMmJmYjczMC1lY2FhLTExZTYtOGY4OC0zNDM2M2JjN2M0YzAiOnsiY3JlYXRlIjo2MDAwMDAwMDAwMCwiZGVsZXRlIjo2MDAwMDAwMDAwMCwidXBkYXRlIjo2MDAwMDAwMDAwMH19
                 - dependencies
                    
                     - 0: aws_vpc.vpc
                    
                
            
        
     - 90
        
         - mode: managed
         - type: aws_vpn_connection
         - name: vpn
         - provider: provider["registry.terraform.io/hashicorp/aws"]
         - instances
            
             - 0
                
                 - schema_version: 0
                 - attributes
                    
                     - arn: arn:aws:ec2:ap-northeast-2:969470234861:vpn-connection/vpn-090ed6e6c352adf45
                     - customer_gateway_configuration: <?xml version="1.0" encoding="UTF-8"?>
                        <vpn_connection id="vpn-090ed6e6c352adf45">
                          <customer_gateway_id>cgw-0303a99f7dd5dd93a</customer_gateway_id>
                          <vpn_gateway_id></vpn_gateway_id>
                          <vpn_connection_type>ipsec.1</vpn_connection_type>
                          <vpn_connection_attributes>NoBGPVPNConnection</vpn_connection_attributes>
                          <ipsec_tunnel>
                            <customer_gateway>
                              <tunnel_outside_address>
                                <ip_address>220.72.11.210</ip_address>
                              </tunnel_outside_address>
                              <tunnel_inside_address>
                                <ip_address>169.254.11.2</ip_address>
                                <network_mask>255.255.255.252</network_mask>
                                <network_cidr>30</network_cidr>
                              </tunnel_inside_address>
                            </customer_gateway>
                            <vpn_gateway>
                              <tunnel_outside_address>
                                <ip_address>52.78.20.140</ip_address>
                              </tunnel_outside_address>
                              <tunnel_inside_address>
                                <ip_address>169.254.11.1</ip_address>
                                <network_mask>255.255.255.252</network_mask>
                                <network_cidr>30</network_cidr>
                              </tunnel_inside_address>
                            </vpn_gateway>
                            <ike>
                              <authentication_protocol>sha1</authentication_protocol>
                              <encryption_protocol>aes-128-cbc</encryption_protocol>
                              <lifetime>28800</lifetime>
                              <perfect_forward_secrecy>group2</perfect_forward_secrecy>
                              <mode>main</mode>
                              <pre_shared_key>ahkytkI2yAaB5rW.MGPgCaUix6YBO0nr</pre_shared_key>
                            </ike>
                            <ipsec>
                              <protocol>esp</protocol>
                              <authentication_protocol>hmac-sha1-96</authentication_protocol>
                              <encryption_protocol>aes-128-cbc</encryption_protocol>
                              <lifetime>3600</lifetime>
                              <perfect_forward_secrecy>group2</perfect_forward_secrecy>
                              <mode>tunnel</mode>
                              <clear_df_bit>true</clear_df_bit>
                              <fragmentation_before_encryption>true</fragmentation_before_encryption>
                              <tcp_mss_adjustment>1379</tcp_mss_adjustment>
                              <dead_peer_detection>
                                <interval>10</interval>
                                <retries>3</retries>
                              </dead_peer_detection>
                            </ipsec>
                          </ipsec_tunnel>
                          <ipsec_tunnel>
                            <customer_gateway>
                              <tunnel_outside_address>
                                <ip_address>220.72.11.210</ip_address>
                              </tunnel_outside_address>
                              <tunnel_inside_address>
                                <ip_address>169.254.21.6</ip_address>
                                <network_mask>255.255.255.252</network_mask>
                                <network_cidr>30</network_cidr>
                              </tunnel_inside_address>
                            </customer_gateway>
                            <vpn_gateway>
                              <tunnel_outside_address>
                                <ip_address>52.78.40.61</ip_address>
                              </tunnel_outside_address>
                              <tunnel_inside_address>
                                <ip_address>169.254.21.5</ip_address>
                                <network_mask>255.255.255.252</network_mask>
                                <network_cidr>30</network_cidr>
                              </tunnel_inside_address>
                            </vpn_gateway>
                            <ike>
                              <authentication_protocol>sha1</authentication_protocol>
                              <encryption_protocol>aes-128-cbc</encryption_protocol>
                              <lifetime>28800</lifetime>
                              <perfect_forward_secrecy>group2</perfect_forward_secrecy>
                              <mode>main</mode>
                              <pre_shared_key>GyTJt6IsIXWaQNjq82AV_h.hJ_0Vi.Yf</pre_shared_key>
                            </ike>
                            <ipsec>
                              <protocol>esp</protocol>
                              <authentication_protocol>hmac-sha1-96</authentication_protocol>
                              <encryption_protocol>aes-128-cbc</encryption_protocol>
                              <lifetime>3600</lifetime>
                              <perfect_forward_secrecy>group2</perfect_forward_secrecy>
                              <mode>tunnel</mode>
                              <clear_df_bit>true</clear_df_bit>
                              <fragmentation_before_encryption>true</fragmentation_before_encryption>
                              <tcp_mss_adjustment>1379</tcp_mss_adjustment>
                              <dead_peer_detection>
                                <interval>10</interval>
                                <retries>3</retries>
                              </dead_peer_detection>
                            </ipsec>
                          </ipsec_tunnel>
                        </vpn_connection>
                     - customer_gateway_id: cgw-0303a99f7dd5dd93a
                     - enable_acceleration: false
                     - id: vpn-090ed6e6c352adf45
                     - local_ipv4_network_cidr: 0.0.0.0/0
                     - local_ipv6_network_cidr: 
                     - remote_ipv4_network_cidr: 0.0.0.0/0
                     - remote_ipv6_network_cidr: 
                     - routes
                        
                        
                     - static_routes_only: true
                     - tags
                        
                        
                     - transit_gateway_attachment_id: tgw-attach-0a124ecf64b91c10c
                     - transit_gateway_id: tgw-0b9255b9254c08317
                     - tunnel1_address: 52.78.20.140
                     - tunnel1_bgp_asn: 
                     - tunnel1_bgp_holdtime: 0
                     - tunnel1_cgw_inside_address: 169.254.11.2
                     - tunnel1_dpd_timeout_action: null
                     - tunnel1_dpd_timeout_seconds: null
                     - tunnel1_ike_versions: null
                     - tunnel1_inside_cidr: null
                     - tunnel1_inside_ipv6_cidr: null
                     - tunnel1_phase1_dh_group_numbers: null
                     - tunnel1_phase1_encryption_algorithms: null
                     - tunnel1_phase1_integrity_algorithms: null
                     - tunnel1_phase1_lifetime_seconds: null
                     - tunnel1_phase2_dh_group_numbers: null
                     - tunnel1_phase2_encryption_algorithms: null
                     - tunnel1_phase2_integrity_algorithms: null
                     - tunnel1_phase2_lifetime_seconds: null
                     - tunnel1_preshared_key: ahkytkI2yAaB5rW.MGPgCaUix6YBO0nr
                     - tunnel1_rekey_fuzz_percentage: null
                     - tunnel1_rekey_margin_time_seconds: null
                     - tunnel1_replay_window_size: null
                     - tunnel1_startup_action: null
                     - tunnel1_vgw_inside_address: 169.254.11.1
                     - tunnel2_address: 52.78.40.61
                     - tunnel2_bgp_asn: 
                     - tunnel2_bgp_holdtime: 0
                     - tunnel2_cgw_inside_address: 169.254.21.6
                     - tunnel2_dpd_timeout_action: null
                     - tunnel2_dpd_timeout_seconds: null
                     - tunnel2_ike_versions: null
                     - tunnel2_inside_cidr: null
                     - tunnel2_inside_ipv6_cidr: null
                     - tunnel2_phase1_dh_group_numbers: null
                     - tunnel2_phase1_encryption_algorithms: null
                     - tunnel2_phase1_integrity_algorithms: null
                     - tunnel2_phase1_lifetime_seconds: null
                     - tunnel2_phase2_dh_group_numbers: null
                     - tunnel2_phase2_encryption_algorithms: null
                     - tunnel2_phase2_integrity_algorithms: null
                     - tunnel2_phase2_lifetime_seconds: null
                     - tunnel2_preshared_key: GyTJt6IsIXWaQNjq82AV_h.hJ_0Vi.Yf
                     - tunnel2_rekey_fuzz_percentage: null
                     - tunnel2_rekey_margin_time_seconds: null
                     - tunnel2_replay_window_size: null
                     - tunnel2_startup_action: null
                     - tunnel2_vgw_inside_address: 169.254.21.5
                     - tunnel_inside_ip_version: ipv4
                     - type: ipsec.1
                     - vgw_telemetry
                        
                         - 0
                            
                             - accepted_route_count: 0
                             - last_status_change: 2021-02-04T09:36:33Z
                             - outside_ip_address: 52.78.20.140
                             - status: UP
                             - status_message: 
                            
                         - 1
                            
                             - accepted_route_count: 0
                             - last_status_change: 2021-02-04T09:39:00Z
                             - outside_ip_address: 52.78.40.61
                             - status: UP
                             - status_message: 
                            
                        
                     - vpn_gateway_id: 
                    
                 - sensitive_attributes
                    
                    
                 - private: bnVsbA==
                 - dependencies
                    
                     - 0: aws_customer_gateway.cgw
                     - 1: aws_ec2_transit_gateway.tgw
                    
                
            
        
    

