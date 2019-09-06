"admin_required": "role:admin"
"cloud_admin": "role:admin and ((is_admin_project:True or domain_id:default){{- if .Values.tempest.enabled }} or domain_id:{{.Values.tempest.domainId}}{{- end}})",
"service_role": "role:service"
"service_or_admin": "rule:admin_required or rule:service_role"
"cloud_viewer": "role:cloud_identity_viewer or rule:service_role or rule:cloud_admin",
"owner": "user_id:%(user_id)s or user_id:%(target.token.user_id)s"
"admin_or_owner": "(rule:admin_required and domain_id:%(target.token.user.domain.id)s) or rule:owner"
"admin_and_matching_domain_id": "rule:admin_required and domain_id:%(domain_id)s",
"service_admin_or_owner": "rule:service_or_admin or rule:owner",
"cloud_admin_or_owner": "rule:cloud_admin or rule:owner",

#token related not present in rocky.json
"token_subject": "user_id:%(target.token.user_id)s"
"admin_or_token_subject": "rule:admin_required or rule:token_subject"
"service_admin_or_token_subject": "rule:service_or_admin or rule:token_subject"

# application_credential
"identity:get_application_credential": "rule:admin_or_owner"
"identity:list_application_credentials": "rule:admin_or_owner"
"identity:create_application_credential": "rule:admin_or_owner"
"identity:delete_application_credential": "rule:admin_or_owner"

# Token
"identity:authorize_request_token": "rule:admin_required"
"identity:get_access_token": "rule:admin_required"
"identity:get_access_token_role": "rule:admin_required"
"identity:list_access_tokens": "rule:admin_required"
"identity:list_access_token_roles": "rule:admin_required"
"identity:delete_access_token": "rule:admin_required"

# Token1
"identity:check_token": "rule:admin_or_token_subject"
"identity:validate_token": "rule:service_admin_or_token_subject"
"identity:revoke_token": "rule:admin_or_token_subject"

# service catalog.
"identity:get_auth_catalog": ""
"identity:get_auth_projects": ""
"identity:get_auth_domains": ""
"identity:get_auth_system": ""

# OAUTH1 
"identity:get_consumer": "rule:admin_required"
"identity:list_consumers": "rule:admin_required"
"identity:create_consumer": "rule:admin_required"
"identity:update_consumer": "rule:admin_required"
"identity:delete_consumer": "rule:admin_required"

## credentials details.
"identity:get_credential": "(role:reader and system_scope:all) or user_id:%(target.credential.user_id)s"
"identity:list_credentials": "(role:reader and system_scope:all) or user_id:%(target.credential.user_id)s"
"identity:create_credential": "(role:admin and system_scope:all) or user_id:%(target.credential.user_id)s"
"identity:update_credential": "(role:admin and system_scope:all) or user_id:%(target.credential.user_id)s"
"identity:delete_credential": "(role:admin and system_scope:all) or user_id:%(target.credential.user_id)s"

## domain details.
"identity:get_domain": "(role:reader and system_scope:all) or token.domain.id:%(target.domain.id)s or token.project.domain.id:%(target.domain.id)s"
"identity:list_domains": "role:reader and system_scope:all"
"identity:create_domain": "role:admin and system_scope:all"
"identity:update_domain": "role:admin and system_scope:all"
"identity:delete_domain": "role:admin and system_scope:all"

# domain configuration.
"identity:create_domain_config": "rule:admin_required"
"identity:get_domain_config": "rule:admin_required"
"identity:get_security_compliance_domain_config": ""
"identity:update_domain_config": "rule:admin_required"
"identity:delete_domain_config": "rule:admin_required"
"identity:get_domain_config_default": "rule:admin_required"

## ec2 credential.
"identity:ec2_get_credential": "rule:admin_required or (rule:owner and user_id:%(target.credential.user_id)s)"
"identity:ec2_list_credentials": "rule:admin_or_owner"
"identity:ec2_create_credential": "rule:admin_or_owner"
"identity:ec2_delete_credential": "rule:admin_required or (rule:owner and user_id:%(target.credential.user_id)s)"

## endpoint details.
"identity:get_endpoint": "role:reader and system_scope:all"
"identity:list_endpoints": "role:reader and system_scope:all"
"identity:create_endpoint": "role:admin and system_scope:all"
"identity:update_endpoint": "role:admin and system_scope:all"
"identity:delete_endpoint": "role:admin and system_scope:all"

## endpoint group.
"identity:create_endpoint_group": "rule:admin_required"
"identity:list_endpoint_groups": "rule:admin_required"
"identity:get_endpoint_group": "rule:admin_required"
"identity:update_endpoint_group": "rule:admin_required"
"identity:delete_endpoint_group": "rule:admin_required"
"identity:list_projects_associated_with_endpoint_group": "rule:admin_required"
"identity:list_endpoints_associated_with_endpoint_group": "rule:admin_required"
"identity:get_endpoint_group_in_project": "rule:admin_required"
"identity:list_endpoint_groups_for_project": "rule:admin_required"
"identity:add_endpoint_group_to_project": "rule:admin_required"
"identity:remove_endpoint_group_from_project": "rule:admin_required"

## Grant
"identity:check_grant": "role:reader and system_scope:all"
"identity:list_grants": "role:reader and system_scope:all"
"identity:create_grant": "role:admin and system_scope:all"
"identity:revoke_grant": "role:admin and system_scope:all"
"identity:list_system_grants_for_user": "role:reader and system_scope:all"
"identity:check_system_grant_for_user": "role:reader and system_scope:all"
"identity:create_system_grant_for_user": "role:admin and system_scope:all"
"identity:revoke_system_grant_for_user": "role:admin and system_scope:all"

# System Grants
"identity:list_system_grants_for_group": "role:reader and system_scope:all"
"identity:check_system_grant_for_group": "role:reader and system_scope:all"
"identity:create_system_grant_for_group": "role:admin and system_scope:all"
"identity:revoke_system_grant_for_group": "role:admin and system_scope:all"

# Groups
"identity:get_group": "(role:reader and system_scope:all) or (role:reader and domain_id:%(target.group.domain_id)s)"
"identity:list_groups": "(role:reader and system_scope:all) or (role:reader and domain_id:%(target.group.domain_id)s)"
"identity:list_groups_for_user": "(role:reader and system_scope:all) or (role:reader and domain_id:%(target.user.domain_id)s) or user_id:%(user_id)s"
"identity:create_group": "(role:admin and system_scope:all) or (role:admin and domain_id:%(target.group.domain_id)s)"
"identity:update_group": "(role:admin and system_scope:all) or (role:admin and domain_id:%(target.group.domain_id)s)"
"identity:delete_group": "(role:admin and system_scope:all) or (role:admin and domain_id:%(target.group.domain_id)s)"
"identity:list_users_in_group": "(role:reader and system_scope:all) or (role:reader and domain_id:%(target.group.domain_id)s)"
"identity:remove_user_from_group": "(role:admin and system_scope:all) or (role:admin and domain_id:%(target.group.domain_id)s and domain_id:%(target.user.domain_id)s)"
"identity:check_user_in_group": "(role:reader and system_scope:all) or (role:reader and domain_id:%(target.group.domain_id)s and domain_id:%(target.user.domain_id)s)"
"identity:add_user_to_group": "(role:admin and system_scope:all) or (role:admin and domain_id:%(target.group.domain_id)s and domain_id:%(target.user.domain_id)s)"

# Identity Provider
"identity:create_identity_provider": "role:admin and system_scope:all"
"identity:list_identity_providers": "role:reader and system_scope:all"
"identity:get_identity_provider": "role:reader and system_scope:all"
"identity:update_identity_provider": "role:admin and system_scope:all"
"identity:delete_identity_provider": "role:admin and system_scope:all"

## implied roles
"identity:get_implied_role": "rule:admin_required"
"identity:list_implied_roles": "rule:admin_required"
"identity:create_implied_role": "rule:admin_required"
"identity:delete_implied_role": "rule:admin_required"
"identity:list_role_inference_rules": "rule:admin_required"
"identity:check_implied_role": "rule:admin_required"

# Limit model
"identity:get_limit_model": ""
"identity:get_limit": "(role:reader and system_scope:all) or project_id:%(target.limit.project_id)s or domain_id:%(target.limit.domain_id)s"
"identity:list_limits": ""
"identity:create_limits": "role:admin and system_scope:all"
"identity:update_limit": "role:admin and system_scope:all"
"identity:delete_limit": "role:admin and system_scope:all"

# Mapping
"identity:create_mapping": "role:admin and system_scope:all"
"identity:get_mapping": "role:reader and system_scope:all"
"identity:list_mappings": "role:reader and system_scope:all"
"identity:delete_mapping": "role:admin and system_scope:all"
"identity:update_mapping": "role:admin and system_scope:all"

# Policy
"identity:get_policy": "rule:admin_required"
"identity:list_policies": "rule:admin_required"
"identity:create_policy": "rule:admin_required"
"identity:update_policy": "rule:admin_required"
"identity:delete_policy": "rule:admin_required"
"identity:create_policy_association_for_endpoint": "rule:admin_required"
"identity:check_policy_association_for_endpoint": "rule:admin_required"
"identity:delete_policy_association_for_endpoint": "rule:admin_required"
"identity:create_policy_association_for_service": "rule:admin_required"
"identity:check_policy_association_for_service": "rule:admin_required"
"identity:delete_policy_association_for_service": "rule:admin_required"
"identity:create_policy_association_for_region_and_service": "rule:admin_required"
"identity:check_policy_association_for_region_and_service": "rule:admin_required"
"identity:delete_policy_association_for_region_and_service": "rule:admin_required"
"identity:get_policy_for_endpoint": "rule:admin_required"
"identity:list_endpoints_for_policy": "rule:admin_required"

# project details.
"identity:get_project": "(role:reader and system_scope:all) or (role:reader and domain_id:%(target.project.domain_id)s) or project_id:%(target.project.id)s"
"identity:list_projects": "(role:reader and system_scope:all) or (role:reader and domain_id:%(target.domain_id)s)"
"identity:list_user_projects": "(role:reader and system_scope:all) or (role:reader and domain_id:%(target.user.domain_id)s) or user_id:%(target.user.id)s"
"identity:create_project": "(role:admin and system_scope:all) or (role:admin and domain_id:%(target.project.domain_id)s)"
"identity:update_project": "(role:admin and system_scope:all) or (role:admin and domain_id:%(target.project.domain_id)s)"
"identity:delete_project": "(role:admin and system_scope:all) or (role:admin and domain_id:%(target.project.domain_id)s)"

# Project Tags
"identity:list_project_tags": "rule:admin_required or project_id:%(target.project.id)s"
"identity:get_project_tag": "rule:admin_required or project_id:%(target.project.id)s"
"identity:update_project_tags": "rule:admin_required"
"identity:create_project_tag": "rule:admin_required"
"identity:delete_project_tags": "rule:admin_required"
"identity:delete_project_tag": "rule:admin_required"

# Project EndPoints
"identity:list_projects_for_endpoint": "rule:admin_required"
"identity:add_endpoint_to_project": "rule:admin_required"
"identity:check_endpoint_in_project": "rule:admin_required"
"identity:list_endpoints_for_project": "rule:admin_required"
"identity:remove_endpoint_from_project": "rule:admin_required"

# Protocols
"identity:create_protocol": "role:admin and system_scope:all"
"identity:update_protocol": "role:admin and system_scope:all"
"identity:get_protocol": "role:reader and system_scope:all"
"identity:list_protocols":"role:reader and system_scope:all".
"identity:delete_protocol": "role:admin and system_scope:all"

# Regions
"identity:get_region": ""
"identity:list_regions": ""
"identity:create_region": "role:admin and system_scope:all"
"identity:update_region": "role:admin and system_scope:all"
"identity:delete_region": "role:admin and system_scope:all"

#  Registrations
"identity:get_registered_limit": ""
"identity:list_registered_limits": ""
"identity:create_registered_limits": "role:admin and system_scope:all"
"identity:update_registered_limit": "role:admin and system_scope:all"
"identity:delete_registered_limit": "role:admin and system_scope:all"

"identity:list_revoke_events": "rule:service_or_admin"

# Roles
"identity:get_role": "role:reader and system_scope:all"
"identity:list_roles": "role:reader and system_scope:all"
"identity:create_role": "role:admin and system_scope:all"
"identity:update_role": "role:admin and system_scope:all"
"identity:delete_role": "role:admin and system_scope:all"

# Domains
"identity:get_domain_role": "rule:admin_required"
"identity:list_domain_roles": "rule:admin_required"
"identity:create_domain_role": "rule:admin_required"
"identity:update_domain_role": "rule:admin_required"
"identity:delete_domain_role": "rule:admin_required"

"identity:list_role_assignments": "(role:reader and system_scope:all) or (role:reader and domain_id:%(target.domain_id)s)"

# Services
"identity:get_service": "role:reader and system_scope:all"
"identity:list_services": "role:reader and system_scope:all"
"identity:create_service": "role:admin and system_scope:all"
"identity:update_service": "role:admin and system_scope:all"
"identity:delete_service": "role:admin and system_scope:all"

# Service Provider
"identity:create_service_provider": "role:admin and system_scope:all"
"identity:list_service_providers": "role:reader and system_scope:all"
"identity:get_service_provider": "role:reader and system_scope:all"
"identity:update_service_provider": "role:admin and system_scope:all"
"identity:delete_service_provider": "role:admin and system_scope:all"


"identity:revocation_list": "rule:service_or_admin"

# Trust
"identity:create_trust": "user_id:%(trust.trustor_user_id)s"
"identity:list_trusts": ""
"identity:list_roles_for_trust": ""
"identity:get_role_for_trust": ""
"identity:delete_trust": ""
"identity:get_trust": ""

# Users
"identity:get_user": "(role:reader and system_scope:all) or (role:reader and token.domain.id:%(target.user.domain_id)s) or user_id:%(target.user.id)s"
"identity:list_users": "(role:reader and system_scope:all) or (role:reader and domain_id:%(target.domain_id)s)"
"identity:create_user": "(role:admin and system_scope:all) or (role:admin and token.domain.id:%(target.user.domain_id)s)"
"identity:update_user": "(role:admin and system_scope:all) or (role:admin and token.domain.id:%(target.user.domain_id)s)"
"identity:delete_user": "(role:admin and system_scope:all) or (role:admin and token.domain.id:%(target.user.domain_id)s)"

# For users
"identity:list_projects_for_user": ""
"identity:list_domains_for_user": ""