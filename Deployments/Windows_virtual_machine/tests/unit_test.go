package test

import (
	"testing"
	
	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestUnitSingleInstanceSingleRegion(t *testing.T) {
	t.Parallel()

	// Generate a random ID to prevent a naming conflict
	uniqueID := random.UniqueId()

	// Define variables
	locations := []string{"UK South"}

	// Enable retryable error
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// The path to where the Terraform code is located
		TerraformDir: "../examples/",

		// Variables to pass to the Terraform code using -var options
		Vars: map[string]interface{}{
			"service_deployment": uniqueID,
			"resource_instance_count": 1,
			"service_location": locations,
		},
	})

	// Run `terraform init` and `terraform plan`. Fail the test if there are any errors.
	terraform.InitAndPlan(t, terraformOptions)
}

func TestUnitMultiInstanceSingleRegion(t *testing.T) {
	t.Parallel()

	// Generate a random ID to prevent a naming conflict
	uniqueID := random.UniqueId()

	// Define variables
	locations := []string{"UK South"}

	// Enable retryable error
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// The path to where the Terraform code is located
		TerraformDir: "../examples/",

		// Variables to pass to the Terraform code using -var options
		Vars: map[string]interface{}{
			"service_deployment": uniqueID,
			"resource_instance_count": 2,
			"service_location": locations,
		},
	})

	// Run `terraform init` and `terraform plan`. Fail the test if there are any errors.
	terraform.InitAndPlan(t, terraformOptions)
}

func TestUnitMultiInstanceMultiRegion(t *testing.T) {
	t.Parallel()

	// Generate a random ID to prevent a naming conflict
	uniqueID := random.UniqueId()

	// Define variables
	locations := []string{"UK South", "North Central US"}

	// Enable retryable error
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// The path to where the Terraform code is located
		TerraformDir: "../examples/",

		// Variables to pass to the Terraform code using -var options
		Vars: map[string]interface{}{
			"service_deployment": uniqueID,
			"resource_instance_count": 2,
			"service_location": locations,
		},
	})

	// Run `terraform init` and `terraform plan`. Fail the test if there are any errors.
	terraform.InitAndPlan(t, terraformOptions)
}