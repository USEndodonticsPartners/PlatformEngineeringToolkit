# Standards

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.3.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.3.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [random_string.main](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_global_settings"></a> [global\_settings](#input\_global\_settings) | n/a | <pre>object({<br/>    environment        = string<br/>    primary_location   = string<br/>    secondary_location = optional(string, "none")<br/>    tags               = map(string)<br/>  })</pre> | <pre>{<br/>  "environment": "",<br/>  "primary_location": "",<br/>  "secondary_location": "",<br/>  "tags": {}<br/>}</pre> | no |
| <a name="input_unique-include-numbers"></a> [unique-include-numbers](#input\_unique-include-numbers) | If you want to include numbers in the unique generation | `bool` | `true` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_global_tags"></a> [global\_tags](#output\_global\_tags) | Tags containing information at the global layer |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
