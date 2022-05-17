package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/random"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestPlanSingleInstanceSingleRegion(t *testing.T) {
	t.Parallel()

	// Root folder where Terraform files should be (relative to the test folder)
	rootFolder := "../../../"

	// Path to Terraform example files being tested (relative to the root folder)
	terraformFolderRelativeToRoot := "./Deployments/Windows_virtual_machine/examples/"

	// Copy the terraform folder to a temp folder to prevent conflicts from parallel runs
	tempTestFolder := test_structure.CopyTerraformFolderToTemp(t, rootFolder, terraformFolderRelativeToRoot)

	// Generate a random deployment name for the test to prevent a naming conflict
	uniqueID := random.UniqueId()
	testREF := "SingleInstanceSingleRegion"
	serviceDeployment := testREF + "-" + uniqueID

	// Define variables
	locations := []string{"UK South"}

	// Enable retryable error
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// The path to where the Terraform code is located
		TerraformDir: tempTestFolder,

		// Variables to pass to the Terraform code using -var options
		Vars: map[string]interface{}{
			"service_deployment":      serviceDeployment,
			"resource_instance_count": 1,
			"service_location":        locations,
		},
	})

	// Run `terraform init` and `terraform plan`. Fail the test if there are any errors.
	terraform.InitAndPlan(t, terraformOptions)
}

func TestPlanSingleInstanceSingleRegion_DataDisks(t *testing.T) {
	t.Parallel()

	// Root folder where Terraform files should be (relative to the test folder)
	rootFolder := "../../../"

	// Path to Terraform example files being tested (relative to the root folder)
	terraformFolderRelativeToRoot := "./Deployments/Windows_virtual_machine/examples/"

	// Copy the terraform folder to a temp folder to prevent conflicts from parallel runs
	tempTestFolder := test_structure.CopyTerraformFolderToTemp(t, rootFolder, terraformFolderRelativeToRoot)

	// Generate a random deployment name for the test to prevent a naming conflict
	uniqueID := random.UniqueId()
	testREF := "SingleInstanceSingleRegion_DataDisks"
	serviceDeployment := testREF + "-" + uniqueID

	// Define variables
	locations := []string{"UK South"}

	// Enable retryable error
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// The path to where the Terraform code is located
		TerraformDir: tempTestFolder,

		// Variables to pass to the Terraform code using -var options
		Vars: map[string]interface{}{
			"service_deployment":       serviceDeployment,
			"resource_instance_count":  1,
			"service_location":         locations,
			"resource_data_disk_count": 2,
		},
	})

	// Run `terraform init` and `terraform plan`. Fail the test if there are any errors.
	terraform.InitAndPlan(t, terraformOptions)
}

func TestPlanSingleInstanceSingleRegion_MultiNI(t *testing.T) {
	t.Parallel()

	// Root folder where Terraform files should be (relative to the test folder)
	rootFolder := "../../../"

	// Path to Terraform example files being tested (relative to the root folder)
	terraformFolderRelativeToRoot := "./Deployments/Windows_virtual_machine/examples/"

	// Copy the terraform folder to a temp folder to prevent conflicts from parallel runs
	tempTestFolder := test_structure.CopyTerraformFolderToTemp(t, rootFolder, terraformFolderRelativeToRoot)

	// Generate a random deployment name for the test to prevent a naming conflict
	uniqueID := random.UniqueId()
	testREF := "SingleInstanceSingleRegion_MultiNI"
	serviceDeployment := testREF + "-" + uniqueID

	// Define variables
	locations := []string{"UK South"}

	// Enable retryable error
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// The path to where the Terraform code is located
		TerraformDir: tempTestFolder,

		// Variables to pass to the Terraform code using -var options
		Vars: map[string]interface{}{
			"service_deployment":               serviceDeployment,
			"resource_instance_count":          1,
			"service_location":                 locations,
			"resource_network_interface_count": 2,
		},
	})

	// Run `terraform init` and `terraform plan`. Fail the test if there are any errors.
	terraform.InitAndPlan(t, terraformOptions)
}

func TestMultiInstanceSingleRegion_LB(t *testing.T) {
	t.Parallel()

	// Root folder where Terraform files should be (relative to the test folder)
	rootFolder := "../../../"

	// Path to Terraform example files being tested (relative to the root folder)
	terraformFolderRelativeToRoot := "./Deployments/Windows_virtual_machine/examples/"

	// Copy the terraform folder to a temp folder to prevent conflicts from parallel runs
	tempTestFolder := test_structure.CopyTerraformFolderToTemp(t, rootFolder, terraformFolderRelativeToRoot)

	// Generate a random deployment name for the test to prevent a naming conflict
	uniqueID := random.UniqueId()
	testREF := "MultiInstanceSingleRegion_LB"
	serviceDeployment := testREF + "-" + uniqueID

	// Define variables
	locations := []string{"UK South"}

	// Enable retryable error
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// The path to where the Terraform code is located
		TerraformDir: tempTestFolder,

		// Variables to pass to the Terraform code using -var options
		Vars: map[string]interface{}{
			"service_deployment":             serviceDeployment,
			"resource_instance_count":        2,
			"service_location":               locations,
			"provision_public_load_balancer": true,
		},
	})

	// Run `terraform init` and `terraform plan`. Fail the test if there are any errors.
	terraform.InitAndPlan(t, terraformOptions)
}

func TestPlanMultiInstanceMultiRegion(t *testing.T) {
	t.Parallel()

	// Root folder where Terraform files should be (relative to the test folder)
	rootFolder := "../../../"

	// Path to Terraform example files being tested (relative to the root folder)
	terraformFolderRelativeToRoot := "./Deployments/Windows_virtual_machine/examples/"

	// Copy the terraform folder to a temp folder to prevent conflicts from parallel runs
	tempTestFolder := test_structure.CopyTerraformFolderToTemp(t, rootFolder, terraformFolderRelativeToRoot)

	// Generate a random deployment name for the test to prevent a naming conflict
	uniqueID := random.UniqueId()
	testREF := "MultiInstanceMultiRegion"
	serviceDeployment := testREF + "-" + uniqueID

	// Define variables
	locations := []string{"UK South", "North Central US"}

	// Enable retryable error
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{

		// The path to where the Terraform code is located
		TerraformDir: tempTestFolder,

		// Variables to pass to the Terraform code using -var options
		Vars: map[string]interface{}{
			"service_deployment":      serviceDeployment,
			"resource_instance_count": 2,
			"service_location":        locations,
		},
	})

	// Run `terraform init` and `terraform plan`. Fail the test if there are any errors.
	terraform.InitAndPlan(t, terraformOptions)
}
