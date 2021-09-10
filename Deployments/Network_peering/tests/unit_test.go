package test

import (
	"testing"
	
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestUnitExample(t *testing.T) {
	t.Parallel()

	// Generate a random ID to prevent a naming conflict
	uniqueID := random.UniqueId()

	// Enable retryable error
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		
		// The path to where the Terraform code is located
		TerraformDir: "../examples/",
		
		// Variables to pass to the Terraform code using -var options
		Vars: map[string]interface{}{
			"service_deployment": uniqueID,
		},

		// Variables to pass to the Terraform code using -var options
		Targets: []string{
			"module.windows_virtual_machine_spoke",
			//"module.linux_virtual_machine_spoke",
		},
	})

	// Run `terraform init` and `terraform plan`. Fail the test if there are any errors.
	terraform.InitAndPlan(t, terraformOptions)
}